package kr.or.ddit.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.command.ProjectRegistCommand;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.FileSaveVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.ProjectInviteVO;
import kr.or.ddit.dto.ProjectVO;
import kr.or.ddit.service.FileSaveService;
import kr.or.ddit.service.ProjectInviteService;
import kr.or.ddit.service.ProjectService;
import kr.or.ddit.util.MakeFileName;
@Controller
@RequestMapping("/myproject")
public class MyprojectController {
	@Autowired
	ProjectInviteService inviteService;
	
	@Autowired
	ProjectService projectService;
	
	@Autowired
	FileSaveService filesaveService;
	
	@Resource(name = "projectPicturePath")
	private String projectPicturePath;
	
	@RequestMapping("/main")
	public ModelAndView pmsproject(SearchCriteria cri, HttpSession session, ModelAndView mnv) throws SQLException {
		String url = "myproject/main";
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String mber_sn = member.getMber_sn();
		List<ProjectInviteVO> inviteList = inviteService.getInviteByMberSn(mber_sn);
//		List<ProjectVO> projectList= projectService.getMberProject(mber_sn);
		List<ProjectVO> markList = projectService.getMarkProject(mber_sn);
		mnv.addObject("markList",markList);
//		mnv.addObject("projectList",projectList);
		mnv.addObject("inviteList",inviteList);
		mnv.setViewName(url);
		return mnv;
	}
	@RequestMapping(value="/getProProject/{getPage}",method=RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> getChatMeeting(HttpSession session,@PathVariable("getPage")int getPage) throws Exception{
		ResponseEntity<Map<String , Object>> entity = null;
		SearchCriteria cri = new SearchCriteria();
		cri.setPage(getPage);
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String mber_sn = member.getMber_sn();
		try {
			Map<String , Object> dataMap= projectService.getMberProject(cri, mber_sn);
			entity = new ResponseEntity<Map<String, Object>>(dataMap,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
	        entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	@RequestMapping(value = "/getPicture", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<byte[]> getPicture(String picture) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String imgPath = this.projectPicturePath;
		try {

			in = new FileInputStream(new File(imgPath, picture));

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);
		} catch (IOException e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
		} finally {
			if(in!=null)in.close();
		}
		return entity;
	}
	
	@RequestMapping("/registForm")
	public ModelAndView registFormProject(ModelAndView mnv, HttpSession session) throws SQLException {
		String url = "myproject/regist";
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		mnv.addObject("member",member);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping(value = "/picture", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> picture(@RequestParam("pictureFile") MultipartFile multi, String oldPicture)
			throws Exception {
		ResponseEntity<String> entity = null;

		String result = "";
		HttpStatus status = null;

		/* 파일저장확인 */
		if ((result = savePicture(oldPicture, multi)) == null) {
			result = "업로드 실패했습니다.!";
			status = HttpStatus.BAD_REQUEST;
		} else {
			status = HttpStatus.OK;

		}

		entity = new ResponseEntity<String>(result, status);

		return entity;
	}
	
	private String savePicture(String oldPicture, MultipartFile multi) throws Exception {
		String fileName = null;

		/* 파일유무확인 */
		if (!(multi == null || multi.isEmpty() || multi.getSize() > 1024 * 1024 * 5)) {

			/* 파일저장폴더설정 */
			String uploadPath = projectPicturePath;
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
	
	@RequestMapping(value = "/regist.do", method = RequestMethod.POST)
	public String regist(HttpSession session, ProjectRegistCommand project) throws SQLException, IOException {
		ProjectVO regProject = project.toProjectVO();
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		regProject.setPrjct_crtr(member.getMber_sn());
		projectService.registPrjct(regProject);
		
		
//		FileSaveVO filesave = new FileSaveVO();
//		filesave.
//		
//		filesaveService.createNode(fileSaveVo);
		String url = "redirect:/myproject/registUser.do";
		return url;
	}
	
	@RequestMapping(value = "/registUser", method = RequestMethod.GET)
	public String registUser(HttpSession session) throws SQLException, IOException {
		String url = "myproject/regist_success";
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		projectService.insertRoll(member.getMber_sn());
		ProjectVO project = new ProjectVO();
		project.setMber_sn(member.getMber_sn());
		projectService.insertPrjctFile(project);
		return url;
	}
	
	@RequestMapping("/inviteRes")
	public String inviteRes(int prjct_invite_sn, String prjct_invite_sttus) throws SQLException{
		String url = "redirect:main.do";
		ProjectInviteVO project = new ProjectInviteVO();
		project.setPrjct_invite_sn(prjct_invite_sn);
		project.setPrjct_invite_sttus(prjct_invite_sttus);
		inviteService.inviteResponse(project);
		return url;
	}
}
