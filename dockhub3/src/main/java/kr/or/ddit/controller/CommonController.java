package kr.or.ddit.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.command.FindIdCommand;
import kr.or.ddit.dto.CommonAttachVO;
import kr.or.ddit.dto.MemScheduleNotificationVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.MenuVO;
import kr.or.ddit.service.CommonAttachService;
import kr.or.ddit.service.MemScheduleNotificationService;
import kr.or.ddit.service.MemberService;
import kr.or.ddit.service.MenuService;

@Controller
public class CommonController {

	@Autowired
	private MenuService menuService;

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CommonAttachService commonService;
	
	@Autowired
	private MemScheduleNotificationService notificationService;
	
	@RequestMapping("/index")
	public String index(@RequestParam(defaultValue="M010000")String mCode,String prjct_sn, Model model,HttpSession session)
																throws SQLException{
		String url="common/indexPage";
	
		try {
			List<MenuVO> menuList = menuService.getMainMenuList();			
			MenuVO menu = menuService.getMenuByMcode(mCode);
			/*if (!prjct_sn.equals("4949")) {*/
			model.addAttribute("prjct_sn", prjct_sn);
			/*}*/
			model.addAttribute("menuList",menuList);
			model.addAttribute("menu",menu);
			
			//알림..
			MemberVO member = (MemberVO) session.getAttribute("loginUser");
			
			int mber_sn = Integer.parseInt(member.getMber_sn());
			
			List<MemScheduleNotificationVO> notificationList = notificationService.selectScheduleNotification(mber_sn);
			int cnt = notificationService.selectNewNotificationCount(mber_sn);
			
			model.addAttribute("notificationList",notificationList);
			model.addAttribute("cnt",cnt);
		} catch (SQLException e) {			
			e.printStackTrace();
			url=null;
			//throw e;
		}
		return url;
	}
	
	@RequestMapping("/sns")
	public String sns(@RequestParam(defaultValue="S000000")String mCode,Model model,HttpSession session)
																throws SQLException{
		String url="common/indexPage_sns";
	
		try {
			List<MenuVO> menuList = menuService.getMainMenuList1();			
			MenuVO menu = menuService.getMenuByMcode(mCode);
			
			model.addAttribute("menuList",menuList);
			model.addAttribute("menu",menu);
			
			//알림..
			MemberVO member = (MemberVO) session.getAttribute("loginUser");
			
			int mber_sn = Integer.parseInt(member.getMber_sn());
			
			List<MemScheduleNotificationVO> notificationList = notificationService.selectScheduleNotification(mber_sn);
			int cnt = notificationService.selectNewNotificationCount(mber_sn);
			
			model.addAttribute("notificationList",notificationList);
			model.addAttribute("cnt",cnt);
		} catch (SQLException e) {			
			e.printStackTrace();
			url=null;
			//throw e;
		}
		return url;
	}
	
	@RequestMapping(value="/common/loginForm",method=RequestMethod.GET)
	public String loginForm(@RequestParam(defaultValue="")String error,
							HttpServletResponse response) {
		String url="common/loginForm";
		if(error.equals("1")) {
			response.setStatus(302);
		}
		return url;
	}
	

/*  
 * logined process by spring-security  
 * 
 *   @RequestMapping(value="/common/login",method=RequestMethod.POST)
	public String login(String id, String pwd,HttpServletRequest request,
											  HttpSession session,
											  RedirectAttributes rttr) throws Exception{
		String url="redirect:/index.do?mCode=M010000";
		
		try {
			memberService.login(id, pwd);
			
			//session.setAttribute("loginUser", memberService.getMember(id));
		} catch (NotFoundIDException | InvalidPasswordException e) {
			rttr.addFlashAttribute("message",e.getMessage());
			url="redirect:/common/loginForm.do";
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		
		return url;
	}
	
	@RequestMapping(value="/common/logout",method=RequestMethod.GET)
	public String logout(HttpSession session){
		String url="redirect:/";
		session.invalidate();
		
		return url;
	}
*/
	
	@RequestMapping("/common/loginTimeout")
	public String loginTimeOut(Model model)throws Exception {
		
		String url="security/sessionOut";
		
		model.addAttribute("message","세션이 만료되었습니다.\\n다시 로그인 하세요!");
		return url;
	}
	
	@RequestMapping("/common/loginExpired")
	public String loginExpired(Model model)throws Exception{
		String url="security/sessionOut";
		
		model.addAttribute("message","중복 로그인이 확인되었습니다.\\n" 
									+ "다시 로그인하면 다른 장치에서 로그인은 취소됩니다.");
		return url;
		
	}
	
	@RequestMapping("/subMenu")
	@ResponseBody
	public ResponseEntity<List<MenuVO>> subMenuToJSON(String mCode) throws Exception {
		ResponseEntity<List<MenuVO>> entity=null;

	
		List<MenuVO> subMenu = null;

		try {
			subMenu = menuService.getSubMenuList(mCode);			
		
			entity  = new ResponseEntity<List<MenuVO>>(subMenu,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<List<MenuVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return entity;
	}
	

	@RequestMapping("/main")
	public String main() {
		String url="common/main";
		return url;
	}
	
	@RequestMapping("/getMcode")
	@ResponseBody
	public ResponseEntity<MenuVO> getMcode(String mName)throws Exception{
		
		ResponseEntity<MenuVO> entity = null;
		
		try {
				MenuVO menu = menuService.getMenuByMname(mName);
				
				entity = new ResponseEntity<MenuVO>(menu, HttpStatus.OK) ;
		}catch(SQLException e) {
				entity = new ResponseEntity<MenuVO>(HttpStatus.INTERNAL_SERVER_ERROR) ;
		}
	
		
		return entity;
	}
	
	//아이디 찾기 폼
	@RequestMapping("/findIdForm")
	public String findIdForm() throws Exception{
		String url = "common/findIdForm";
		return url;
	}
	
	//아이디 찾기
   @RequestMapping(value = "/findId", method=RequestMethod.POST)
   public ModelAndView findId(FindIdCommand regReq, ModelAndView mnv) throws Exception{
      
      MemberVO member = regReq.toMemberVO();
//	      ModelAndView mnv = new ModelAndView();
      List<MemberVO> memList = memberService.findId(member);
//		System.out.println("id:"+member.getMber_nm());
//		System.out.println("phone:"+member.getMber_moblphon_no());
//		System.out.println("id:"+memList.get(0).getMber_id());
      
//	      System.out.println("findId : " + memList.get(0));
      mnv.setViewName("common/findId");
      mnv.addObject("memList", memList);
      
      return mnv;
   }
	//문자전송
	@RequestMapping(value = "/message", method=RequestMethod.POST )
	@ResponseBody
	public String sendSMS(String phoneNum) throws Exception{

        Random rand  = new Random();
        String numStr = "";
        for(int i=0; i<4; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr+=ran;
        }

        //System.out.println("수신자 번호 : " + phoneNum);
        //System.out.println("인증번호 : " + numStr);
        memberService.certifiedPhoneNumber(phoneNum,numStr);
        
        return numStr;
    }
	
	
	@RequestMapping("/getFile")
	public String getFile(int file_sn, int file_ordr,Model model) throws Exception {
		
		String url="downloadFile";
		
		CommonAttachVO commonAttach = new CommonAttachVO();
		commonAttach.setFile_sn(file_sn);
		commonAttach.setFile_ordr(file_ordr);
		
		CommonAttachVO common = commonService.selectAttachForDown(commonAttach);

		model.addAttribute("savedPath", common.getFlpth());
		model.addAttribute("fileName", common.getFile_nm());		
	
		return url;
	}
	
	   @RequestMapping("/updateNotification")
	   @ResponseBody
	   public ResponseEntity<String> updateNotification(int mber_ntcn_sn) throws Exception {
	      System.out.println("mber_ntcn_sn" + mber_ntcn_sn);
	      ResponseEntity<String> entity = null;
	      try {
	    	  notificationService.updateNotification(mber_ntcn_sn);
	         entity = new ResponseEntity<String>(HttpStatus.OK);
	      } catch (SQLException e) {
	         entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
	      }
	      return entity;
	   }
	

	
}












