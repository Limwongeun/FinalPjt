package kr.or.ddit.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.josephoconnell.html.HTMLInputFilter;

import kr.or.ddit.command.RecruitApplyCommand;
import kr.or.ddit.command.RecruitModifyCommand;
import kr.or.ddit.command.RecruitRegistCommand;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.CommonAttachVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.ProjectUserVO;
import kr.or.ddit.dto.RecruitApplyVO;
import kr.or.ddit.dto.RecruitVO;
import kr.or.ddit.service.CommonAttachService;
import kr.or.ddit.service.ProjectUserService;
import kr.or.ddit.service.RecruitApplyService;
import kr.or.ddit.service.RecruitService;
import kr.or.ddit.util.GetAttachesAsMultipartFiles;

@Controller
@RequestMapping("/notification")
public class RecruitController {
	
	@Autowired
	private RecruitService service;
	
	@Autowired
	private CommonAttachService attachService;
	
	@Autowired
	private ProjectUserService userService;
	
	@Autowired
	private RecruitApplyService recruitApplyService;
	
	@Resource(name = "fileUploadPath")
	private String fileUploadPath;
	
	@RequestMapping("/list")
	public ModelAndView list(SearchCriteria cri,ModelAndView mnv) throws Exception{
		
		String url = "recruit/list";
		
		Map<String, Object> dataMap = service.getList(cri);
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;
		
	}
	
	@RequestMapping("/myList")
	public ModelAndView myList(ModelAndView mnv, HttpSession session) throws Exception{
		
		String url = "recruit/myRegistList";
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String mber_sn = member.getMber_sn();
		mnv.addObject("mber_sn",mber_sn);
		mnv.setViewName(url);
		return mnv;
		
	}
	
	
	@RequestMapping("/detail")
	public ModelAndView detail(int pblanc_sn,
							   @RequestParam(defaultValue="") String from,
							   HttpServletRequest request,
							   ModelAndView mnv , HttpSession session) throws SQLException{
		String url="recruit/detail";
		
		RecruitVO recruit = null;
		
		if(from.equals("list")) {
			recruit = service.getRecruit(pblanc_sn);
			url="redirect:/notification/detail.do?pblanc_sn="+pblanc_sn;
		}else {
			recruit = service.getRecruitForModify(pblanc_sn);
		}
		
		int file_sn = recruit.getFile_sn();
		List<CommonAttachVO> attachList = null;
		if (file_sn != 0) {
			attachList =  attachService.selectAttachByFileSn(file_sn);
			for (CommonAttachVO commonAttachVO : attachList) {
				
				String file_nm = commonAttachVO.getFile_nm().split("\\$\\$")[1];
				commonAttachVO.setFile_nm(file_nm);
				
			}
		}
		
		mnv.addObject("attachList",attachList);
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String mber_sn = member.getMber_sn();
		mnv.addObject("mber_sn",mber_sn);
		mnv.addObject("recruit",recruit);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/registForm")
	public ModelAndView registForm(ModelAndView mnv, HttpSession session) throws Exception {
		String url = "recruit/regist";
		
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		
		String mber_sn = member.getMber_sn();
		
		Map<String, Object> dataMap = service.getProject(mber_sn);
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping(value = "/regist" , method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public String regist(RecruitRegistCommand recruitReq,HttpServletRequest request, RedirectAttributes rttr) throws Exception{
	
		String url = "redirect:/notification/list.do";
		
		RecruitVO recruit = recruitReq.toRecruitVO();
//		System.out.println(recruitReq.getUploadFile().get(0).getName());
		if (!recruitReq.getUploadFile().get(0).getName().equals("uploadFile")) {
			System.out.println(recruitReq.getUploadFile());
			
			List<CommonAttachVO> commonAttachList 
			= GetAttachesAsMultipartFiles.commonSave(recruitReq.getUploadFile(), fileUploadPath, "2");
			int seq = attachService.selectAttachSeqNextVal();
			attachService.insertCommonAttachList(commonAttachList,recruitReq.getPblanc_wrter(),seq);
			
			recruit.setFile_sn(seq);
		}
		recruit.setPblanc_sj(HTMLInputFilter.htmlSpecialChars(recruit.getPblanc_sj()));
		
		service.regist(recruit);

		rttr.addFlashAttribute("from","regist");
		
		return url;
	}
	
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(ModelAndView mnv, int pblanc_sn) throws Exception{
		String url = "recruit/modify";
		
		RecruitVO recruit = service.getRecruitForModify(pblanc_sn);
		int file_sn = recruit.getFile_sn();
		List<CommonAttachVO> attachList = null;
		if (file_sn != 0) {
			attachList =  attachService.selectAttachByFileSn(file_sn);
			for (CommonAttachVO commonAttachVO : attachList) {
				
				String file_nm = commonAttachVO.getFile_nm().split("\\$\\$")[1];
				commonAttachVO.setFile_nm(file_nm);
				
			}
		}
		
		mnv.addObject("attachList",attachList);
		mnv.addObject("recruit",recruit);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/modify")
	public String modifyPost(RecruitModifyCommand modifyReq,HttpServletRequest request, RedirectAttributes rttr) throws Exception{
		String url = "redirect:/notification/detail.do";
		
		//파일 삭제 저장 추가
		
		RecruitVO recruit = modifyReq.toRecruitVO();
		//XSS 해야함
		String modify = modifyReq.getModify();
		//수정시 파일 삭제하고 새로운 파일 저장
		if (modify.equals("modify")) {
			int file_sn = modifyReq.getFile_sn();
			attachService.deleteAttachByFileSn(file_sn);
			int seq = attachService.selectAttachSeqNextVal();
			List<CommonAttachVO> commonAttachList 
			= GetAttachesAsMultipartFiles.commonSave(modifyReq.getUploadFile(), fileUploadPath, "2");
			attachService.insertCommonAttachList(commonAttachList,modifyReq.getPblanc_wrter(),seq);
			
			recruit.setFile_sn(seq);
		}
		service.modify(recruit);
		rttr.addAttribute("from","modify");
		rttr.addAttribute("pblanc_sn", recruit.getPblanc_sn());
		
		return url;
	}
	
	@RequestMapping("/remove")
	public String remove(int pblanc_sn, RedirectAttributes rttr) throws Exception{
		String url = "redirect:/notification/list.do";
		
		service.remove(pblanc_sn);
		
		rttr.addFlashAttribute("from","remove");
		rttr.addAttribute("pblanc_sn",pblanc_sn);
		
		return url;
	}
	
	@RequestMapping("/joinRecruit")
	@ResponseBody
	public ResponseEntity<String> joinRecruit(int prjct_sn, int pblanc_sn, HttpSession session)throws SQLException{
		ResponseEntity<String> entity = null;
		try {
			ProjectUserVO project = new ProjectUserVO();
			project.setPrjct_sn(prjct_sn);
			MemberVO member = (MemberVO) session.getAttribute("loginUser");
			project.setMber_sn(member.getMber_sn());
			//유저번호 가져오기
			int user_sn = userService.selectUserByMberPrjct(project);
			if (user_sn != 0) { //이미 참여중인 프로젝트
				entity = new ResponseEntity<String>("duplicated",HttpStatus.OK);
			}else {
				//참여 신청 여부 확인
				RecruitApplyVO recruitApply = new RecruitApplyVO();
				recruitApply.setPblanc_sn(pblanc_sn);
				recruitApply.setPblanc_sport_man_sn(member.getMber_sn());
				int pblanc_spory_man_sn = recruitApplyService.selectApplyByMberPrjct(recruitApply);
				if (pblanc_spory_man_sn != 0 ) {
					entity = new ResponseEntity<String>("apply",HttpStatus.OK);
				}else {
					entity = new ResponseEntity<String>("",HttpStatus.OK);
				}
			}
		} catch (SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping("/applyForm")
	public ModelAndView applyForm(SearchCriteria cri,ModelAndView mnv, int pblanc_sn) throws Exception{
		
		String url = "recruit/applyForm";
		
		RecruitVO recruit = service.getRecruitForModify(pblanc_sn);
		mnv.addObject("recruit", recruit);
		mnv.setViewName(url);
		return mnv;
		
	}
	
	@RequestMapping(value="/apply", method = RequestMethod.POST)
	public String regist(RecruitApplyCommand commandReq, HttpSession session) throws SQLException, IOException {
		System.out.println(commandReq.getPblanc_sport_role());
		String url = "recruit/apply_success";
		RecruitApplyVO recruit = commandReq.toRecruitApplyVO();
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		recruit.setPblanc_sport_man_sn(member.getMber_sn());
		
		recruitApplyService.insertRecruitApply(recruit);
		return url;
	}
	
	@RequestMapping("/myMeeting")
	public ModelAndView myMeeting(ModelAndView mnv, HttpSession session) throws Exception{
		
		String url = "recruit/myApplyList";
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String mber_sn = member.getMber_sn();
		mnv.addObject("mber_sn",mber_sn);
		mnv.setViewName(url);
		return mnv;
		
	}
	
	
}
