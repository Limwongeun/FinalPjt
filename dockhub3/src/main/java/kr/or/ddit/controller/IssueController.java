package kr.or.ddit.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.IssueVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.service.IssueService;

@Controller
@RequestMapping("/issue")
public class IssueController {
	
	@Autowired
	private IssueService issueService;
	
	/**
	 * @param prjct_sn
	 * @param filePage
	 * @return 
	 * @throws Exception
	 * open 클릭시 목록 출력 + pagination
	 */
	@RequestMapping(value="/listOpen/{prjct_sn}/{filePage}",method=RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> getOpen(@PathVariable("prjct_sn")int prjct_sn,@PathVariable("filePage")int filePage) throws Exception{
		ResponseEntity<Map<String , Object>> entity = null;
		SearchCriteria cri = new SearchCriteria();
		
		cri.setPage(filePage);
		
		try {
			Map<String , Object> dataMap =issueService.selectIssueByPrjctSn(prjct_sn, cri);
			entity = new ResponseEntity<Map<String, Object>>(dataMap,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
	         entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
	         
		}
		
		return entity;
	}
	
	/**
	 * @param prjct_sn
	 * @param filePage
	 * @return
	 * @throws Exception
	 * close 클릭시 목록 출력 + pagination
	 */
	@RequestMapping(value="/listClose/{prjct_sn}/{filePage}",method=RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> getClose(@PathVariable("prjct_sn")int prjct_sn,@PathVariable("filePage")int filePage) throws Exception{
		ResponseEntity<Map<String , Object>> entity = null;
		SearchCriteria cri = new SearchCriteria();
		
		cri.setPage(filePage);
		
		try {
			Map<String , Object> dataMap =issueService.selectIssueCloseByPrjctSn(prjct_sn, cri);
			entity = new ResponseEntity<Map<String, Object>>(dataMap,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			
		}
		
		return entity;
	}
	@RequestMapping("/registForm")
	public ModelAndView registForm(ModelAndView mnv, HttpServletRequest request) throws Exception {
		String url = "issue/regist";
		
		
		String prjct_sn = request.getParameter("prjct_sn");
		
		Map<String, Object> dataMap = issueService.selectDutyCharge(prjct_sn);
		Map<String, Object> mileMap = issueService.selectMileStoneList(prjct_sn);
		
		
		mnv.addObject("dataMap",dataMap);
		mnv.addObject("mileMap", mileMap);
		mnv.addObject("prjct_sn",prjct_sn);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/regist")
	public String registIssue(HttpServletRequest request, HttpSession session, RedirectAttributes rttr) throws Exception{
	
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String mber_sn = member.getMber_sn();
		
		IssueVO issue = new IssueVO();
		
		String unit_job_sn = request.getParameter("unit_job_sn");
		String mile_no = request.getParameter("mile_no");
		String issue_title = request.getParameter("issue_title");
		String issue_content = request.getParameter("issue_content");
		String issue_ipcr_se_code = request.getParameter("issue_ipcr_se_code");
		Integer prjct_sn = Integer.parseInt(request.getParameter("prjct_sn"));
		
		if(unit_job_sn != null && !unit_job_sn.equals("")) {
			issue.setUnit_job_sn(Integer.parseInt(unit_job_sn));
		}
		if(mile_no != null && !mile_no.equals("")) {
			issue.setMile_no(Integer.parseInt(mile_no));
		}
		if(prjct_sn != null && !prjct_sn.equals("")) {
			issue.setPrjct_sn(prjct_sn);
		}
		issue.setIssue_title(issue_title);
		issue.setIssue_content(issue_content);
		issue.setIssue_ipcr_se_code(issue_ipcr_se_code);
		issue.setMber_sn(mber_sn);
		issue.setPrjct_sn(prjct_sn);
		rttr.addFlashAttribute("from","regist");
		
		issueService.registIssue(issue);
		
		return "redirect:/pmsproject/issue.do?prjct_sn="+prjct_sn;
	}
	
	@RequestMapping("/detail")
	public ModelAndView detailIssue(int issue_sn,HttpSession session, String from, ModelAndView mnv) throws Exception{
		String url = "issue/detail";
		IssueVO issue = new IssueVO();
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		System.out.println("세션체크" + member);
		String mber_sn = member.getMber_sn();
		System.out.println("멤버SN체크" + mber_sn);
		issue.setMber_sn(mber_sn);
		issue.setIssue_sn(issue_sn);

		IssueVO detailIssue = issueService.getDetailIssue(issue);
		
		mnv.addObject("detailIssue", detailIssue);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/updateIssueForm")
	public String updateIssueForm(HttpServletRequest request, Model model, @ModelAttribute("IssueVO") IssueVO issue) throws Exception{
		
		IssueVO detailIssue = issueService.getDetailIssue(issue);
		String prjct_sn =  issue.getPrjct_sn()+"";
		
		Map<String, Object> dataMap = issueService.selectDutyCharge(prjct_sn);
		Map<String, Object> mileMap = issueService.selectMileStoneList(prjct_sn);		
		
		model.addAttribute("dataMap",dataMap);
		model.addAttribute("mileMap", mileMap);
		model.addAttribute("detailIssue", detailIssue);
		return "issue/updateIssueForm";
	}
	
	@RequestMapping("/updateIssue")
	public String updateIssue(HttpServletRequest request, Model model, @ModelAttribute("IssueVO") IssueVO issue, RedirectAttributes rttr) throws Exception{
		
		issueService.updateIssue(issue);
		
		rttr.addFlashAttribute("from","update");
		
		return "redirect:/pmsproject/issue.do?prjct_sn="+issue.getPrjct_sn();
	}
	
	@RequestMapping("/deleteIssue")
	public String deleteIssue(HttpServletRequest request, Model model, @ModelAttribute("IssueVO") IssueVO issue, RedirectAttributes rttr) throws Exception{
		
		issueService.deleteIssue(issue);
		
		rttr.addFlashAttribute("from","delete");
		
		return "redirect:/pmsproject/issue.do?prjct_sn="+issue.getPrjct_sn();
		
	}
	
	@RequestMapping("/endIssue")
	public String endIssue(HttpServletRequest request, Model model, @ModelAttribute("IssueVO") IssueVO issue, RedirectAttributes rttr) throws Exception{
		
		issueService.endIssue(issue);
		
		rttr.addFlashAttribute("from","end");
		
		return "redirect:/pmsproject/issue.do?prjct_sn="+issue.getPrjct_sn();
		
	}
	
	@RequestMapping("/reIssue")
	public String reIssue(HttpServletRequest request, Model model, @ModelAttribute("IssueVO") IssueVO issue, RedirectAttributes rttr) throws Exception{
		
		issueService.reIssue(issue);
		
		rttr.addFlashAttribute("from","re");
		
		return "redirect:/pmsproject/issue.do?prjct_sn="+issue.getPrjct_sn();
		
	}
	
	
	
}
