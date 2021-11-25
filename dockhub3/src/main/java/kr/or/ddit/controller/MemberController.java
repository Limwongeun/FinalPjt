package kr.or.ddit.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.command.MemberModifyCommand;
import kr.or.ddit.command.MemberRegistCommand;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.service.MemberService;
import kr.or.ddit.util.MakeFileName;

@Controller
@RequestMapping("/member")
public class MemberController {

	private ModelAndView mav = new ModelAndView();
	
	@Autowired
	private MemberService msvc;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	@RequestMapping(value="/registForm", method=RequestMethod.POST)
	public String registForm() {
		
		String url = "member/regist";
		return url;
	}
	
	@RequestMapping(value="/M_join", method=RequestMethod.GET)
	public ModelAndView mJoin(@ModelAttribute MemberVO member) {
		return mav;
	}
	
	@RequestMapping(value="/loginForm", method=RequestMethod.GET)
	public String loginForm() {
		return "M_Login";
	}

	@RequestMapping(value = "/regist.do", method = RequestMethod.POST)
	public String regist(MemberRegistCommand member) throws SQLException, IOException {
		String url = "member/regist_success";

		MemberVO memberVO = member.toMemberVO();
		
		msvc.regist(memberVO);

		return url;
	}
	
	@RequestMapping("/idCheck")
	@ResponseBody
	public ResponseEntity<String> idCheck(String mber_ncnm) throws Exception {
		ResponseEntity<String> entity = null;

		try {
			MemberVO member = msvc.getMemberByNm(mber_ncnm);
			if (member != null) {
				entity = new ResponseEntity<String>("duplicated", HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>("", HttpStatus.OK);
			}
		} catch (SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}
	
	
	
	
	@Resource(name = "picturePath")
	private String picturePath;

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
	
	@RequestMapping(value = "/getPictureById/{id}",method=RequestMethod.GET, 
			produces = "text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<byte[]> getPictureById(@PathVariable("id") String id) 
																throws Exception {
		String picture = msvc.getMember(id).getMber_photo();
		
		return  getPicture(picture);
	}
	
	@RequestMapping(value = "/getPictureBySn/{sn}",method=RequestMethod.GET, 
			produces = "text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<byte[]> getPictureBySn(@PathVariable("sn") String mber_sn) 
			throws Exception {
		String picture = msvc.getMemberSn(mber_sn).getMber_photo();
		
		return  getPicture(picture);
	}
	
	
	@RequestMapping(value= "/detail", method = RequestMethod.GET)
	public String detail( Model model,HttpSession session) throws SQLException{
		
		String url = "member/memberDetail";
		
		MemberVO sessionMember = (MemberVO) session.getAttribute("loginUser");
		String mber_sn = sessionMember.getMber_sn();
		MemberVO member = msvc.getMemberDetail(mber_sn);
		model.addAttribute("member",member);
		
		return url;
	}
	
	@RequestMapping(value="modifyForm")
	public ModelAndView modifyForm(ModelAndView mnv, String mber_sn) throws Exception{
		String url = "member/memberModify";
		System.out.println(mber_sn);
		MemberVO member = msvc.getMemberDetail(mber_sn);
		System.out.println("asd:" + member);
		mnv.addObject("member",member);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/modify", method = RequestMethod.POST)
	public String modifyPost(MemberModifyCommand modifyReq, HttpSession session,RedirectAttributes rttr) throws Exception{
		String url="redirect:/member/detail.do";
		
		MemberVO member = modifyReq.toParseMember();
		// 신규 파일 변경 및 기존 파일 삭제
		String fileName = savePicture(modifyReq.getOldPhoto(), modifyReq.getMber_photo());
		member.setMber_photo(fileName);
		
		//파일변경 없을 시 기존 파일명 유지
		if (modifyReq.getMber_photo().isEmpty()) {
			member.setMber_photo(modifyReq.getOldPhoto());
		}
		
		//DB 내용 수정
		msvc.modify(member);
		
		rttr.addFlashAttribute("parentReload",false);
		
		//로그인 유저 세션 업로드
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		System.out.println("세션" + loginUser.getMber_id());
		System.out.println("멤버" + member.getMber_id());
		
		if (loginUser != null && member.getMber_id().equals(loginUser.getMber_id())) {
			session.setAttribute("loginUser", member);
			rttr.addFlashAttribute("parentReload",true);
		}
		rttr.addAttribute("mber_id",member.getMber_id());
		rttr.addAttribute("from","modify");
		
		rttr.addFlashAttribute("member",msvc.getMember(modifyReq.getMber_id()));
		
		return url;
	}
	
}
