package kr.or.ddit.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.command.ProjectModifyCommand;
import kr.or.ddit.dto.FileSaveVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.ProjectUserVO;
import kr.or.ddit.dto.ProjectVO;
import kr.or.ddit.service.DutyChargeService;
import kr.or.ddit.service.IssueService;
import kr.or.ddit.service.ProjectService;
import kr.or.ddit.service.ProjectUserService;
import kr.or.ddit.util.MakeFileName;

@Controller
@RequestMapping("/pmsproject")
public class PmsPjtController {
	
	@Autowired
	private ProjectService service;
	
	@Autowired
	private DutyChargeService dutyService;
	
	@Autowired
	private IssueService issueService;
	
	@Autowired
	private ProjectUserService userService;

	@RequestMapping("/dash")
	public ModelAndView dash(HttpSession session, int prjct_sn, ModelAndView mnv) throws SQLException{
		String url="pmsproject/dash";
		ProjectVO project = null;
		//System.out.println(prjct_sn);
		project = service.getProject(prjct_sn);
		
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String mber_sn = member.getMber_sn();
		ProjectVO likeProject = new ProjectVO();
		likeProject.setMber_sn(mber_sn);
		likeProject.setPrjct_sn(prjct_sn);
		int likeprjct = service.getLike(likeProject);
		int markprjct = service.getMark(likeProject);
		List<String> issueStatus = issueService.getIssueStatus(prjct_sn);
		List<String> dutyStatus = dutyService.getDutyStatus(prjct_sn);
		List<ProjectUserVO> userList = userService.getDashUserByPrjct(prjct_sn);
		ProjectVO projectPro = service.getPro(prjct_sn);
		int eee = 0;
		int ddd = 0;
		int ppp = 0;
		int www = 0;
		for (String duty : dutyStatus) {
			if (duty.equals("종료")) {
				eee +=1;
			}else if(duty.equals("지연")) {
				ddd+=1;
			}else if(duty.equals("진행")) {
				ppp+=1;
			}else if(duty.equals("대기")) {
				www+=1;
			}
		}
		
		int ooo = 0;
		int ccc = 0;
		for (String issue : issueStatus) {
			if (issue.equals("1")) {
				ooo +=1;
			}else if(issue.equals("0")) {
				ccc+=1;
			}
		}
		mnv.addObject("projectPro",projectPro);
		mnv.addObject("userList",userList);
		mnv.addObject("ooo", ooo);
		mnv.addObject("ccc", ccc);
		mnv.addObject("eee", eee);
		mnv.addObject("ddd", ddd);
		mnv.addObject("ppp", ppp);
		mnv.addObject("www", www);
		mnv.addObject("markprjct",markprjct);
		mnv.addObject("likeprjct",likeprjct);
		mnv.addObject("project",project);
		mnv.setViewName(url);
		return mnv;
	}

	
	@RequestMapping("/info")
	public ModelAndView pmsproject(int prjct_sn, ModelAndView mnv, HttpSession session) throws SQLException {
		String url="pmsproject/info";
		ProjectVO project = null;
		project = service.getProject(prjct_sn);
		int cnt = service.selectUserCnt(prjct_sn);
		project.setUser_cnt(cnt);
		
		//유저 정보 가져오기-> for편집권한
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		project.setMber_sn(member.getMber_sn());
		int author = service.selectPrjctAuthor(project);
		mnv.addObject("author", author);
		mnv.addObject("project",project);
		mnv.setViewName(url);
		return mnv;
	}
	@RequestMapping("/recruitInfo")
	public ModelAndView pmsprojectInfo(int prjct_sn, ModelAndView mnv, HttpSession session) throws SQLException {
		String url="pmsproject/recruitInfo";
		ProjectVO project = null;
		project = service.getProject(prjct_sn);
		int cnt = service.selectUserCnt(prjct_sn);
		project.setUser_cnt(cnt);
		
		//유저 정보 가져오기-> for편집권한
		mnv.addObject("project",project);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/file")
	public ModelAndView fileSave(HttpSession session, int prjct_sn,String from,  ModelAndView mnv) throws Exception{
		String url = "file/file_save";
		ProjectVO project = null;
		//System.out.println(prjct_sn);
		if (from != null) {
			mnv.addObject("from",from);
		}
		
		project = service.getProject(prjct_sn);
		
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		project.setMber_sn(member.getMber_sn());
		int author = service.selectPrjctAuthor(project);
		mnv.addObject("author", author);
		mnv.addObject("mber_sn", member.getMber_sn());
		mnv.addObject("project",project);
		mnv.setViewName(url);
		return mnv;
	
	}
	
	@RequestMapping("/issue")
	public ModelAndView issue(int prjct_sn, ModelAndView mnv, HttpSession session) throws Exception{
		String url = "issue/main";
		
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String mber_sn = member.getMber_sn();
		
		mnv.addObject("prjct_sn", prjct_sn);
		mnv.addObject("mber_sn", mber_sn);
		mnv.setViewName(url);
		return mnv;
	
	}
	
	@RequestMapping("/projectModifyForm")
	public ModelAndView modifyForm(ModelAndView mnv,int prjct_sn) throws Exception{
		String url = "pmsproject/projectModify";
		//System.out.println(prjct_sn);
		ProjectVO project = service.getProject(prjct_sn);
		//System.out.println("asd:" + project);
		
		mnv.addObject("project",project);
		mnv.addObject("prjct_sn",prjct_sn);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/projectModify", method = RequestMethod.POST)
	public String modifyPost(ProjectModifyCommand modifyReq,HttpSession session, RedirectAttributes rttr) throws Exception{
		String url = "redirect:/pmsproject/info.do";
		
		ProjectVO project = modifyReq.toProject();
		System.out.println(project.getPrjct_cn());
		System.out.println(project.getPrjct_author_code());
		System.out.println(project.getPrjct_actvty_sttus_code());
		System.out.println(project.getPrjct_endde());
		System.out.println(project.getPrjct_photo());
		System.out.println(project.getPrjct_sj());
		System.out.println(project.getPrjct_sn());
		
		String fileName = savePicture(modifyReq.getOldPhoto(), modifyReq.getPrjct_photo());
		System.out.println("filename: "+fileName);
		project.setPrjct_photo(fileName);
		
		//파일변경 없을 시 기존 파일명 유지
		if (modifyReq.getPrjct_photo().isEmpty()) {
			project.setPrjct_photo(modifyReq.getOldPhoto());
		}
		
		service.modify(project);
		
		rttr.addFlashAttribute("parentReload", false);
		rttr.addAttribute("prjct_sn",project.getPrjct_sn());
		rttr.addFlashAttribute("from", "modify");
		
		
		return url;
	}
	
	@Resource(name = "projectPicturePath")
	private String picturePath;
	
	private String savePicture(String oldPicture, MultipartFile multi) throws Exception {
		String fileName = null;

		/* 파일유무확인 */
		if (!(multi == null || multi.isEmpty() || multi.getSize() > 1024 * 1024 * 5)) {

			/* 파일저장폴더설정 */
			String uploadPath = picturePath;
			fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
			File storeFile = new File(uploadPath, fileName);

			storeFile.mkdirs();

			// local HDD 에 저장.
			multi.transferTo(storeFile);

			if (oldPicture != null && !oldPicture.isEmpty()) {
				File oldFile = new File(uploadPath, oldPicture);
				if (oldFile.exists()) {
					oldFile.delete();
				}
			}
		}
//		System.out.println(fileName);
		return fileName;
	}
	
	
	
	@RequestMapping(value="/likePrjct",method=RequestMethod.POST)
	public ResponseEntity<Integer> likePrjct(HttpSession session, int likeNum, int prjct_sn) throws Exception{
		ProjectVO project = new ProjectVO();
		project.setPrjct_sn(prjct_sn);
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		project.setMber_sn(member.getMber_sn());
		
		if (likeNum==0) {
			service.likePrj(project);
		}else if (likeNum==1) {
			service.deletePrj(project);
		}
		ProjectVO projectCnt = service.getProject(prjct_sn);
		int likeCnt = projectCnt.getPrjctr_like_co();
		System.out.println(likeCnt);
		HttpStatus status = HttpStatus.OK;
		ResponseEntity<Integer> entity = new ResponseEntity<Integer>(likeCnt, status);
		
		return entity;
		
		
	}
	
	
	@RequestMapping(value="/markPrjct",method=RequestMethod.POST)
	public ResponseEntity<Integer> markPrjct(HttpSession session, int likeNum, int prjct_sn) throws Exception{
		ProjectVO project = new ProjectVO();
		project.setPrjct_sn(prjct_sn);
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		project.setMber_sn(member.getMber_sn());
		
		if (likeNum==0) {
			service.markPrj(project);
		}else if (likeNum==1) {
			service.deleteMarkPrj(project);
		}
		ProjectVO projectCnt = service.getProject(prjct_sn);
		int likeCnt = projectCnt.getPrjct_scrap_co();
		
		HttpStatus status = HttpStatus.OK;
		ResponseEntity<Integer> entity = new ResponseEntity<Integer>(likeCnt, status);
		
		return entity;
		
		
	}
	
	@RequestMapping(value = "/getPicture", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<byte[]> getPicture(String picture) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String imgPath = this.picturePath;
		try {

			in = new FileInputStream(new File(imgPath, picture));

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), 
					HttpStatus.CREATED);
		} catch (IOException e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
		} finally {
			if(in!=null)in.close();
		}
		return entity;
	}
	
	@RequestMapping("/prjctSjList")
	@ResponseBody
	public ResponseEntity<List<String>> prjctSjList() throws Exception{
		ResponseEntity<List<String>> entity=null;
		try {
					
			List<String> prjctSjList = service.getPrjctSjForSearch();
						
			entity  = new ResponseEntity<List<String>>(prjctSjList,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<List<String>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return entity;
		
	}
}












