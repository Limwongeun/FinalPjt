package kr.or.ddit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.command.PageMaker;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.ExclusionVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.ProjectInviteVO;
import kr.or.ddit.dto.ProjectUserVO;
import kr.or.ddit.dto.ProjectVO;
import kr.or.ddit.service.ProjectExclusionService;
import kr.or.ddit.service.ProjectInviteService;
import kr.or.ddit.service.ProjectService;
import kr.or.ddit.service.ProjectUserService;

@Controller
@RequestMapping("/pmsproject")
public class PmsPjtUserController {
	
	@Autowired
	private ProjectUserService service;
	
	@Autowired
	private ProjectInviteService projectInviteService;
	
	@Autowired
	private ProjectExclusionService projectExclusionService;
	
	@Autowired 
	private ProjectService projectService;
	
	@RequestMapping("/user")
	public ModelAndView user(HttpSession session , int prjct_sn, String prjct_invite_sttus, ModelAndView mnv) throws Exception{
		List<ProjectUserVO> projectUser = service.getProjectUser(prjct_sn);
		List<ProjectInviteVO> projectInvite = projectInviteService.getProjectInvite(prjct_sn, prjct_invite_sttus);
		List<ProjectInviteVO> refuse = projectInviteService.getProjectInviteRefuse(prjct_sn, prjct_invite_sttus);
		List<ExclusionVO> exclList = projectExclusionService.selectPrjctExclReqst(prjct_sn);
		List<ExclusionVO> exclProcessList = projectExclusionService.selectPrjctExclProcess(prjct_sn);
		
		ProjectUserVO author = new ProjectUserVO();
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		author.setPrjct_sn(prjct_sn);
		author.setMber_sn(member.getMber_sn());
		List<ExclusionVO> exclProcessUser = projectExclusionService.selectPrjctExclProcessUser(author);
		
		String authorUser = service.getProjectUserAuthor(author);
		
		
		mnv.addObject("exclProcessUser", exclProcessUser);
		mnv.addObject("authorUser",authorUser);
		mnv.addObject("exclProcessList",exclProcessList);
		mnv.addObject("exclList",exclList);
		mnv.addObject("refuse",refuse);
		mnv.addObject("prjct_sn",prjct_sn);
		mnv.addObject("prjct_invite_sttus",prjct_invite_sttus);
		mnv.addObject("projectUser",projectUser);
		mnv.addObject("projectInvite",projectInvite);
		if(authorUser.equals("0")) {
			String url="pmsproject/user";
			mnv.setViewName(url);
			
		}else{
			String url="pmsproject/userMember";
			mnv.setViewName(url);
			
		}
		return mnv;
	}
	
	@RequestMapping("/projectProfile")
	public ModelAndView projectProfile(int prjct_sn,String mber_sn, ModelAndView mnv, HttpSession session) throws Exception{
		String url = "pmsproject/projectProfile";
		ProjectInviteVO project = new ProjectInviteVO();
		project.setPrjct_sn(prjct_sn);
		project.setMber_sn(mber_sn);
		ProjectInviteVO projectInvite=projectInviteService.selectProjectProfile(project);
		ProjectVO projectAuthor = new ProjectVO();
		projectAuthor.setPrjct_sn(prjct_sn);
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		projectAuthor.setMber_sn(member.getMber_sn());
		int author = projectService.selectPrjctAuthor(projectAuthor);
		
		mnv.addObject("projectInvite",projectInvite);
		mnv.addObject("author",author);
		mnv.setViewName(url);
		
		return mnv;
	}
	@RequestMapping("/userAuthorChange")
	public String updateUserAuthorChange(String role_sn, String prjct_sn, String mber_sn , ModelAndView mnv, Model model) throws Exception {
//		String url = "pmsproject/userAuthorChangeSuccess";
		ProjectUserVO project = new ProjectUserVO();
		project.setRole_sn(Integer.parseInt(role_sn));
		project.setPrjct_sn(Integer.parseInt(prjct_sn));
		project.setMber_sn(mber_sn);
		ProjectUserVO userAuthorChange = service.updateUserAuthorChange(project);
		
//		mnv.addObject("userAuthorChange",userAuthorChange);
//		mnv.setViewName(url);
		model.addAttribute("userAuthorChange",userAuthorChange);
		model.addAttribute("message", "저장되었습니다.");
		
		return "forward:/pmsproject/projectProfile";
	}
	
	@RequestMapping("/projectInviteUserList")
	public ModelAndView projectInviteUserList(int prjct_sn, SearchCriteria cri,String search, ModelAndView mnv) throws Exception{
		String url = "pmsproject/projectInviteUserList";
		ProjectInviteVO project = new ProjectInviteVO();
		
		project.setPrjct_sn(prjct_sn);
		project.setSearch(search);
		List<ProjectInviteVO> projectInviteList =projectInviteService.selectProjectInviteUser(project, cri);
		int inviteCnt = projectInviteService.selectProjectInviteUserCnt(project);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(inviteCnt);
		
		
		mnv.addObject("prjct_sn",prjct_sn);
		mnv.addObject("projectInviteList",projectInviteList);
		mnv.addObject("pageMaker", pageMaker);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/insertPjtUser")
	public ModelAndView insertPjtUser(int prjct_sn, String mber_sn, int lastRoleSn, ModelAndView mnv) throws Exception{
		String url = "pmsproject/invite_success";
		ProjectInviteVO project = new ProjectInviteVO();
		
		project.setPrjct_sn(prjct_sn);
		project.setMber_sn(mber_sn);
		project.setRole_sn(lastRoleSn);
		
		projectInviteService.insertPjtUser(project);
		
		mnv.addObject("prjct_sn",prjct_sn);
		mnv.addObject("mber_sn",mber_sn);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/excl_accept")
	public ModelAndView projectExclAcceptList(HttpServletRequest request, int excl_reqst_sn, ModelAndView mnv) throws Exception{
		String url = "pmsproject/excl_accept";
		ExclusionVO exclAccept = new ExclusionVO();
		String user_sn = request.getParameter("user_sn"); //get방식만 가능
		String prjct_sn = request.getParameter("prjct_sn");
		
		exclAccept.setPrjct_sn(Integer.parseInt(prjct_sn));
		exclAccept.setUser_sn(Integer.parseInt(user_sn));
		exclAccept.setExcl_reqst_sn(excl_reqst_sn);
		List<ExclusionVO> projectExclAccept =projectExclusionService.selectProjectExclAcceptList(exclAccept);
		
		mnv.addObject("exclAccept",exclAccept);
		mnv.addObject("projectExclAccept",projectExclAccept);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/updatePjtUserExcl")
	public ModelAndView updateProjectExclAccep(int excl_applcnt,int acptr, String hndvr_period,String mber_sn, int role_sn, int user_sn,  ModelAndView mnv) throws Exception{
		String url = "pmsproject/excl_accept_success";
		ExclusionVO excl = new ExclusionVO();
		
		excl.setExcl_applcnt(excl_applcnt);
		excl.setUser_sn(user_sn);
		excl.setMber_sn(mber_sn);
		excl.setRole_sn(role_sn);
		excl.setAcptr(acptr);
		String period = "";
		period = hndvr_period.split("-")[0]+"/"+hndvr_period.split("-")[1]+"/"+hndvr_period.split("-")[2];
		excl.setHndvr_period(period);
		
		projectExclusionService.updateProjectExclAccep(excl);
		
		mnv.addObject("excl_applcnt",excl_applcnt);
		mnv.addObject("mber_sn", mber_sn);
		mnv.addObject("user_sn", user_sn);
		mnv.addObject("role_sn", role_sn);
		mnv.addObject("acptr",acptr);
		mnv.addObject("hndvr_period",hndvr_period);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/excl_refuseForm")
	public ModelAndView refuseForm(int excl_reqst_sn) {
		ModelAndView mvn = new ModelAndView();
		
		mvn.addObject("excl_reqst_sn", excl_reqst_sn);
		mvn.setViewName("pmsproject/excl_refuse");
		
		return mvn;
	}
	@RequestMapping("/excl_refuse")
	public ModelAndView updateProjectRefuseReason(HttpServletRequest request, ModelAndView mnv) throws Exception{
		String url = "pmsproject/excl_refuse_success";
		ExclusionVO exclRefuse = new ExclusionVO();
		
		String excl_reqst_return_prvonsh = request.getParameter("excl_reqst_return_prvonsh");
		String excl_reqst_return_process_de = request.getParameter("excl_reqst_return_process_de");
		String excl_reqst_sn = request.getParameter("excl_reqst_sn");
		
		exclRefuse.setExcl_reqst_return_prvonsh(excl_reqst_return_prvonsh);
		exclRefuse.setExcl_reqst_return_process_de(excl_reqst_return_process_de);
		exclRefuse.setExcl_reqst_sn(Integer.parseInt(excl_reqst_sn));
		
		ExclusionVO projectExclAccepRefuseReason = projectExclusionService.updateProjectRefuseReason(exclRefuse);
		
		mnv.addObject("exclRefuse",exclRefuse);
		mnv.addObject("projectExclAccepRefuseReason",projectExclAccepRefuseReason);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/updateProjectUser")
	public String updateProjectUser(HttpServletRequest request, Model model) throws Exception{
		
		String prjct_sn = request.getParameter("prjct_sn");
		
		List<ProjectUserVO> projectUser = service.getProjectUser(Integer.parseInt(prjct_sn));
		model.addAttribute("projectUser", projectUser);
		
		return "pmsproject/user_setting";
	}
	
	@RequestMapping("/excl_user_detail")
	public ModelAndView selectExclUserDetail(HttpServletRequest request, ModelAndView mnv) throws Exception{
		String url = "pmsproject/excl_user_detail";
		ExclusionVO detail = new ExclusionVO();
		String excl_reqst_sn = request.getParameter("excl_reqst_sn");
		String user_sn = request.getParameter("user_sn");
//		System.out.println(user_sn);
		detail.setUser_sn(Integer.parseInt(user_sn));
		detail.setExcl_reqst_sn(Integer.parseInt(excl_reqst_sn));
		ExclusionVO exclUserDetail = projectExclusionService.selectExclUserDetail(detail);
		System.out.println(exclUserDetail.getMber_ncnm());
		mnv.addObject("exclUserDetail",exclUserDetail);
		mnv.addObject("detail",detail);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/excl_process_accept_detail")
	public ModelAndView selectProjectExclAcceptDetail(HttpServletRequest request, ModelAndView mnv) throws Exception{
		String url = "pmsproject/excl_process_accept_detail";
		ExclusionVO detail = new ExclusionVO();
		String excl_reqst_sn = request.getParameter("excl_reqst_sn");
		
		detail.setExcl_reqst_sn(Integer.parseInt(excl_reqst_sn));
		ExclusionVO exclProcesDetail = projectExclusionService.selectProjectExclAcceptDetail(detail);
		
		mnv.addObject("exclProcesDetail",exclProcesDetail);
		mnv.addObject("detail",detail);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	/**
	 * 제외신청 상세조회(구성원일때)
	 * @param request
	 * @param mnv
	 * @return 
	 * @throws Exception
	 */
	@RequestMapping("/excl_process_accept_user_detail")
	public ModelAndView selectProjectExclAcceptUserDetail(HttpServletRequest request, ModelAndView mnv) throws Exception{
		String url = "pmsproject/excl_process_accept_user_detail";
		ExclusionVO detail = new ExclusionVO();
		String excl_reqst_sn = request.getParameter("excl_reqst_sn");
		
		detail.setExcl_reqst_sn(Integer.parseInt(excl_reqst_sn));
		ExclusionVO exclProcesDetail = projectExclusionService.selectProjectExclAcceptUserDetail(detail);
		
		mnv.addObject("exclProcesDetail",exclProcesDetail);
		mnv.addObject("detail",detail);
		mnv.setViewName(url);
		
		return mnv;
	}
	@RequestMapping("/excl_userForm")
	public ModelAndView exclUserForm(int prjct_sn) {
		ModelAndView mnv = new ModelAndView();
		
		mnv.addObject("prjct_sn", prjct_sn);
		mnv.setViewName("pmsproject/excl_user");
		
		return mnv;
	}
	
	@RequestMapping("/excl_user")
	public ModelAndView insertProjectExclReason(HttpSession session, HttpServletRequest request,  ModelAndView mnv) throws Exception{
		String url = "pmsproject/excl_user_success";
		ExclusionVO exclUser = new ExclusionVO();

		String excl_prvonsh = request.getParameter("excl_prvonsh");
		int prjct_sn = Integer.parseInt(request.getParameter("prjct_sn"));
		exclUser.setExcl_prvonsh(excl_prvonsh);
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		exclUser.setMber_sn(member.getMber_sn());
		exclUser.setPrjct_sn(prjct_sn);
		
		ExclusionVO projectExclUserReason = projectExclusionService.insertProjectExclReason(exclUser);
		
		mnv.addObject("exclUser",exclUser);
		mnv.addObject("projectExclUserReason",projectExclUserReason);
		mnv.setViewName(url);
		
		return mnv;
	}
		
}



