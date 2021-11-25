package kr.or.ddit.controller;

import java.io.Console;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import kr.or.ddit.command.MeetingModifyCommand;
import kr.or.ddit.command.MeetingRegistCommand;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.ChatVO;
import kr.or.ddit.dto.CommonAttachVO;
import kr.or.ddit.dto.MeetingVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.ProjectUserVO;
import kr.or.ddit.service.CommonAttachService;
import kr.or.ddit.service.MeetingService;
import kr.or.ddit.service.MeetingUserService;
import kr.or.ddit.service.ProjectUserService;
import kr.or.ddit.util.GetAttachesAsMultipartFiles;
import kr.or.ddit.util.MakeFileName;

@Controller
@RequestMapping("/pmsproject")
public class MeetingController {

	@Autowired
	private MeetingService service;
	
	@Autowired
	private MeetingUserService meetingUserService;
	
	@Autowired
	private ProjectUserService projectUserService;
	
	@Autowired
	private CommonAttachService attachService;
	
	
	@RequestMapping("/meeting")
	public ModelAndView list(int prjct_sn,ModelAndView mnv,String from) throws Exception{
		
		String url = "meeting/list";
//		Map<String, Object> dataMap = service.getList(prjct_sn);
//		
//		mnv.addObject("dataMap",dataMap);
		mnv.addObject("from",from);
		mnv.addObject("prjct_sn",prjct_sn);
		mnv.setViewName(url);
		
		return mnv;
	}
	@RequestMapping(value="/getChatMeeting/{prjct_sn}/{chatMeetingPage}",method=RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> getChatMeeting(@PathVariable("prjct_sn")int prjct_sn,@PathVariable("chatMeetingPage")int chatMeetingPage) throws Exception{
		ResponseEntity<Map<String , Object>> entity = null;
		SearchCriteria cri = new SearchCriteria();
		
		cri.setPage(chatMeetingPage);
		
		try {
			Map<String , Object> dataMap =service.getChatList(prjct_sn, cri);
			entity = new ResponseEntity<Map<String, Object>>(dataMap,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
	         entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value="/getZoomMeeting/{prjct_sn}/{zoomMeetingPage}",method=RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> getZoomMeeting(@PathVariable("prjct_sn")int prjct_sn,@PathVariable("zoomMeetingPage")int zoomMeetingPage) throws Exception{
		ResponseEntity<Map<String , Object>> entity = null;
		SearchCriteria cri = new SearchCriteria();
		
		cri.setPage(zoomMeetingPage);
		
		try {
			Map<String , Object> dataMap =service.getZoomList(prjct_sn, cri);
			entity = new ResponseEntity<Map<String, Object>>(dataMap,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
	         entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping("/meetingRegistForm")
	public ModelAndView registForm(ModelAndView mnv,int prjct_sn,HttpSession session) throws Exception{
		String url = "meeting/regist";
		
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		ProjectUserVO user = new ProjectUserVO();
		user.setMber_sn(member.getMber_sn());
		user.setPrjct_sn(prjct_sn);
		int loginUserSn = projectUserService.selectUserSnByMberPrjct(user);
		List<ProjectUserVO> userList = service.userList(prjct_sn);
		
		mnv.addObject("loginUserSn",loginUserSn);
		mnv.addObject("userList",userList);
		mnv.addObject("prjct_sn",prjct_sn);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/meetingRegist", method=RequestMethod.POST, produces= "text/plain;charset=utf-8")
	public String regist(MeetingRegistCommand registReq,HttpServletRequest request,RedirectAttributes rttr, HttpSession session)throws Exception{
		String url = "redirect:/pmsproject/meeting";
		MemberVO member= (MemberVO) session.getAttribute("loginUser");
		MeetingVO meeting = registReq.toMeetingVO();
		meeting.setMber_sn(member.getMber_sn());
		int mtg_sn = service.regist(meeting);

		List<Integer> userList = registReq.getUser();
		
		for (Integer user : userList) {
			MeetingVO insertuser = new MeetingVO();
			insertuser.setMtg_sn(mtg_sn);
			insertuser.setUser_sn(user);
			
			service.insertMeetingUser(insertuser);
		}
		
		rttr.addAttribute("from","regist");
		rttr.addAttribute("prjct_sn",meeting.getPrjct_sn());
		
		return url;
	}
	
	@RequestMapping(value="/meetingDetail")
	public ModelAndView detail(int mtg_sn,int prjct_sn, HttpSession session, ModelAndView mnv) throws Exception{
		String url = "meeting/chatDetail";
		
		MeetingVO meeting = service.getMeeting(mtg_sn);
		List<MemberVO> memList = service.selectMeetingUser(mtg_sn);
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String mber_sn = member.getMber_sn();
		
		int file_sn = meeting.getFile_sn();
		
		List<CommonAttachVO> attachList = null;
		if (file_sn != 0) {
			attachList =  attachService.selectAttachByFileSn(file_sn);
			for (CommonAttachVO commonAttachVO : attachList) {
				
				String file_nm = commonAttachVO.getFile_nm().split("\\$\\$")[1];
				commonAttachVO.setFile_nm(file_nm);
				
			}
		}
		
		
		
		ProjectUserVO user = new ProjectUserVO();
		user.setMber_sn(member.getMber_sn());
		user.setPrjct_sn(prjct_sn);
		int loginUserSn = projectUserService.selectUserSnByMberPrjct(user);
		
		mnv.addObject("member",member);
		mnv.addObject("attachList",attachList);
		mnv.addObject("loginUserSn",loginUserSn);
		mnv.addObject("memList",memList);
		mnv.addObject("prjct_sn",prjct_sn);
		mnv.addObject("loginSn",mber_sn);
		mnv.addObject("mtg_sn",mtg_sn);
		mnv.addObject("meeting",meeting);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/zoomMeetingDetail")
	public ModelAndView zoomdetail(int mtg_sn,int prjct_sn, HttpSession session, ModelAndView mnv) throws Exception{
		String url = "meeting/zoomDetail";
		
		MeetingVO meeting = service.getMeeting(mtg_sn);
		List<MemberVO> memList = service.selectMeetingUser(mtg_sn);
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String mber_sn = member.getMber_sn();
		
		ProjectUserVO user = new ProjectUserVO();
		user.setMber_sn(member.getMber_sn());
		user.setPrjct_sn(prjct_sn);
		int loginUserSn = projectUserService.selectUserSnByMberPrjct(user);
		
		mnv.addObject("member",member);
		mnv.addObject("loginUserSn",loginUserSn);
		mnv.addObject("memList",memList);
		mnv.addObject("prjct_sn",prjct_sn);
		mnv.addObject("loginSn",mber_sn);
		mnv.addObject("mtg_sn",mtg_sn);
		mnv.addObject("meeting",meeting);
		mnv.setViewName(url);
		
		return mnv;
	}
	
//	@RequestMapping(value="/meetingUserRegist")
//	public ModelAndView meetingUserRegist(MeetingUserRegistCommand registReq,ModelAndView mnv) throws Exception{
//		String url = "meeting/detail";
//		
//		MeetingUserVO meetingUser = registReq.toMeetingUserVO();
//		meetingUserService.regist(meetingUser);
//		
///*		mnv.setViewName(url);
//*/		
//		return mnv;
//	}
	
	@RequestMapping(value="/remove",method=RequestMethod.GET)
	public String remove(int mtg_sn, int prjct_sn, RedirectAttributes rttr) throws Exception{
		String url="redirect:/pmsproject/meeting";
		service.remove(mtg_sn);
		rttr.addFlashAttribute("from","remove");
		rttr.addAttribute("prjct_sn",prjct_sn);
		
		return url;
	}
	
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(HttpSession session, ModelAndView mnv, int mtg_sn, int prjct_sn) throws Exception{
		String url = "meeting/modify";
		//참가자
		List<MemberVO> memList = service.selectMeetingUser(mtg_sn);		
		MeetingVO meeting = service.getMeeting(mtg_sn);
		
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		ProjectUserVO user = new ProjectUserVO();
		user.setMber_sn(member.getMber_sn());
		user.setPrjct_sn(prjct_sn);
		int loginUserSn = projectUserService.selectUserSnByMberPrjct(user);
		//프로젝트 구성원
		List<ProjectUserVO> userList = service.userList(prjct_sn);
		
		mnv.addObject("loginUserSn",loginUserSn);
		mnv.addObject("userList",userList);
		mnv.addObject("memList",memList);
		mnv.addObject("meeting",meeting);
		mnv.addObject("prjct_sn", prjct_sn);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/modify")
	public String modifyPost(int prjct_sn, int mtg_sn, MeetingModifyCommand modifyReq,HttpServletRequest request, RedirectAttributes rttr) throws Exception{
		String url = "meeting/modify_success";
		
		MeetingVO meeting = modifyReq.toMeetingVO();
		meeting.setMtg_sn(mtg_sn);
		service.modify(meeting);

		service.deleteMeetingUser(mtg_sn);
		
		List<Integer> userList = modifyReq.getUser();
		
		for (Integer user : userList) {
			MeetingVO insertuser = new MeetingVO();
			insertuser.setMtg_sn(mtg_sn);
			insertuser.setUser_sn(user);
			
			service.insertMeetingUser(insertuser);
		}

		rttr.addAttribute("from","modify");
		rttr.addAttribute("getMtg_sn", meeting.getMtg_sn());
		
		return url;
	}
	
	@RequestMapping("/chat")
	public ModelAndView chatTest(String mber_ncnm,String mber_photo,int mtg_sn,int user_sn,String from, ModelAndView mnv) {
		String url = "meeting/webSocketGroupMutiChatting";
		mnv.addObject("from", from);
		mnv.addObject("user_sn", user_sn);
		mnv.addObject("mtg_sn", mtg_sn);
		mnv.addObject("mber_ncnm", mber_ncnm);
		mnv.addObject("mber_photo", mber_photo);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/setMeetingStatus")
	@ResponseBody
	public ResponseEntity<HttpStatus> setMeetingStatus(int mtg_sn, String mtg_sttus_code) throws Exception{
		MeetingVO meeting = new MeetingVO();
		meeting.setMtg_sn(mtg_sn);
		meeting.setMtg_sttus_code(mtg_sttus_code);
		
		service.updateMeetingSttus(meeting);
		
		HttpStatus status = HttpStatus.OK;
		ResponseEntity<HttpStatus> entity = new ResponseEntity<>(status);
		
		return entity;
	}
	@RequestMapping("/insertMeetingMem")
	@ResponseBody
	public ResponseEntity<HttpStatus> insertMeetingMem(int mtg_sn, int user_sn, HttpSession session) throws Exception{
		MeetingVO meeting = new MeetingVO();
		meeting.setMtg_sn(mtg_sn);
		meeting.setUser_sn(user_sn);
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		meeting.setMber_ncnm(member.getMber_ncnm());
		
		service.insertMeetingMem(meeting);
		
		HttpStatus status = HttpStatus.OK;
		ResponseEntity<HttpStatus> entity = new ResponseEntity<>(status);
		
		return entity;
	}
	
	@RequestMapping("/deleteMeetingMem")
	@ResponseBody
	public ResponseEntity<String> deleteMeetingMem(int mtg_sn, int user_sn, HttpSession session) throws Exception{
		MeetingVO meeting = new MeetingVO();
		meeting.setMtg_sn(mtg_sn);
		meeting.setUser_sn(user_sn);
		
		service.deleteMeetingMem(meeting);
//		System.out.println(mtg_sn+"///////////////////////////////////");
//		System.out.println(user_sn+"///////////////////////////////////");
		HttpStatus status = HttpStatus.OK;
		ResponseEntity<String> entity = new ResponseEntity<>("ok",status);
		
		return entity;
	}
	
	@RequestMapping("/selectMeetingMember")
	@ResponseBody
	public ResponseEntity<List<MeetingVO>> selectMeetingMember(int mtg_sn) throws Exception{
		List<MeetingVO> memList = service.selectMeetingMember(mtg_sn);
		HttpStatus status = HttpStatus.OK;
		ResponseEntity<List<MeetingVO>> entity = new ResponseEntity<>(memList,status);
		return entity;
	}
	
	@RequestMapping(value="/saveChat",method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> saveChat(@RequestParam("data") String data, HttpSession session) throws Exception{
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(data);
		JSONArray jsonArray = (JSONArray)obj;
		
		System.out.println("jsonArray : " + jsonArray);
		List<ChatVO> chatList = new ArrayList<>();
		String title ="";
		String mtg_sn ="";
		for(int i=0;i<jsonArray.size();i++){
			ChatVO chat = new ChatVO();
			JSONObject listKey = (JSONObject) jsonArray.get(i);
//			System.out.println(listKey);
			//   System.out.println(listKey.get("key"));
			String chatName = String.valueOf(listKey.get("chatName"));
			String msg = String.valueOf(listKey.get("msg"));
			if (!String.valueOf(listKey.get("title")).equals(null)&&!String.valueOf(listKey.get("title")).equals("null")) {
				title = String.valueOf(listKey.get("title"));
			}
			if (!String.valueOf(listKey.get("mtg_sn")).equals(null)&&!String.valueOf(listKey.get("mtg_sn")).equals("null")) {
				mtg_sn = String.valueOf(listKey.get("mtg_sn"));
			}
//			System.out.println("title : " + String.valueOf(listKey.get("title")));
//			System.out.println("mtg : " + String.valueOf(listKey.get("mtg_sn") ));
			
			chat.setChatName(chatName);
			chat.setMsg(msg);
			if (chatName != null && !chatName.equals("null")) {
				chatList.add(chat);
			}
		}


		//공통파일 테이블에 파일 첨부
		String fileName = MakeFileName.toUUIDFileName(title, "$$");
		
		List<CommonAttachVO> attach = new ArrayList<>();
		
		CommonAttachVO common = new CommonAttachVO();
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		common.setFile_nm(fileName+".xlsx");
		common.setFile_job_se_code("3");
		common.setFile_ty("xlxs");
		common.setFlpth("c:/dockhub");
		common.setFile_ordr(0);
		attach.add(common);
		
		int seq = attachService.selectAttachSeqNextVal();
		attachService.insertCommonAttachList(attach,member.getMber_sn(),seq);
		
		MeetingVO meeting = new MeetingVO();
		meeting.setFile_sn(seq);
		meeting.setMtg_sn(Integer.parseInt(mtg_sn));
		service.updateMeetingFile(meeting);
		
		writeNoticeListToFile("c:/dockhub/"+fileName+".xlsx",chatList);
		HttpStatus status = HttpStatus.OK;
		ResponseEntity<String> entity = new ResponseEntity<>("ok",status);
		return entity;
	}
	
	

	
    public static void writeNoticeListToFile(String fileName, List<ChatVO> noticeList) throws Exception{
        Workbook workbook = null;
         
        if(fileName.endsWith("xlsx")){
            workbook = new XSSFWorkbook();
        }else if(fileName.endsWith("xls")){
            workbook = new HSSFWorkbook();
        }else{
            throw new Exception("invalid file name, should be xls or xlsx");
        }
         
        Sheet sheet = workbook.createSheet("cordova");
         
        Iterator<ChatVO> iterator = noticeList.iterator();
         
        int rowIndex = 0;
        int excelname=0; // 처음에는 ID 학번등 고정값을 넣기 위해 사용한 변수
        do{
        	ChatVO chat = iterator.next();
            Row row = sheet.createRow(rowIndex++);
            
            if(excelname==0){ // 처음에 고정값 
                 Cell cell0 = row.createCell(0);
                 cell0.setCellValue("이름");
                 Cell cell1 = row.createCell(1);
                 cell1.setCellValue("내용");
                 excelname++;
                
            }else{  // 다음부터는 순차적으로 값이 들어감 
                 
                 Cell cell0 = row.createCell(0);
                 cell0.setCellValue(chat.getChatName());
                 Cell cell1 = row.createCell(1);
                 cell1.setCellValue(chat.getMsg());
            }
            
        }while(iterator.hasNext());
     
        //lets write the excel data to file now
        FileOutputStream fos = new FileOutputStream(fileName);
        workbook.write(fos);
        fos.close();
        
        System.out.println(fileName + " written successfully");
    }
	
}

	
