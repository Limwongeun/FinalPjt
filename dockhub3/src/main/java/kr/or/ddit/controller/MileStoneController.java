package kr.or.ddit.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.josephoconnell.html.HTMLInputFilter;

import kr.or.ddit.command.IssueRegistCommand;
import kr.or.ddit.command.MileStoneModifyCommand;
import kr.or.ddit.command.MileStoneRegistCommand;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.IssueVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.MilestoneVO;
import kr.or.ddit.service.IssueService;
import kr.or.ddit.service.MileStoneService;

@Controller
@RequestMapping("/mile")
public class MileStoneController {

	@Autowired
	private IssueService issueService;
	
	@Autowired
	private MileStoneService milestoneService;

	@RequestMapping("/main")
	public String main() throws Exception {
		String url = "mile/main";
		return url;
	}

/*	@RequestMapping("/tab1")
	public String tab1() throws Exception {
		String url = "mile/tab1";
		return url;
	}*/
	
//	@RequestMapping("/tab1")
//	public ModelAndView mile(ModelAndView mnv) throws Exception{
//		String url = "mile/list";
//		
//		mnv.setViewName(url);
//		return mnv;
//	
//	}

//	@RequestMapping("/list")
//	public void list(SearchCriteria cri, Model model) throws Exception {
//		
//		Map<String, Object> dataMap = milestoneService.getMileStoneList(cri);
//		model.addAllAttributes(dataMap);
//	}
	
	
	@RequestMapping("/registForm")
	public ModelAndView registForm(ModelAndView mnv, int prjct_sn) {
		String url = "mile/regist";
		
		mnv.setViewName(url);
		mnv.addObject("prjct_sn",prjct_sn);
		return mnv;
	}
	@RequestMapping("/list")
	public ModelAndView list(SearchCriteria cri, String viewOption,  ModelAndView mnv,  int prjct_sn) throws Exception {
		
		String url = "mile/list";
		Map<String, Object> dataMap = milestoneService.getMileStoneList(prjct_sn, cri);
//		List<MilestoneVO> closeList = milestoneService.getCloseList(prjct_sn);
//		List<MilestoneVO> openList = milestoneService.getOpenList(prjct_sn);
//		dataMap.put("closeList", closeList);
//		dataMap.put("openList", openList);
//		dataMap.put("list2", milestoneService.getMileStoneList2(prjct_sn, cri));
//		MilestoneVO mile = (MilestoneVO) dataMap.get("milestoneList");
//		System.out.println(mile.getMile_no());
//		int count = milestoneService.getMileStoneCount(mile.getMile_no());
//		dataMap.put("count", count);
		//mnv.addObject("dataMap2", dataMap2);
		
		if(viewOption==null || "".equals(viewOption)) viewOption = "open";
		
		mnv.addObject("viewOption", viewOption);
		
		mnv.addObject("dataMap", dataMap);
//		mnv.addObject("dataMap2", dataMap2);
		mnv.addObject("prjct_sn",prjct_sn);
		mnv.setViewName(url);
		
		Map<String, Object> dataMap2 = milestoneService.getMileStoneList2(prjct_sn, cri);
		
		mnv.addObject("dataMap2", dataMap2);
		mnv.addObject("prjct_sn",prjct_sn);
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/list2")
	public ModelAndView list2(SearchCriteria cri, ModelAndView mnv,  int prjct_sn) throws Exception {
		
		String url = "mile/list";
		Map<String, Object> dataMap = milestoneService.getMileStoneList(prjct_sn, cri);
		mnv.addObject("dataMap", dataMap);
		mnv.addObject("prjct_sn",prjct_sn);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/regist")
	public String regist(MileStoneRegistCommand regReq, HttpServletRequest request,HttpSession session, RedirectAttributes rttr)
			throws Exception {
		String url = "mile/regist_success";
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		String mber_sn = member.getMber_sn();
		MilestoneVO milestone = regReq.toMileStoneVO();
		milestone.setMile_title(HTMLInputFilter.htmlSpecialChars(milestone.getMile_title()));
		//milestone.setMile_title((String) request.getAttribute("XSStitle"));
		milestone.setMber_sn(mber_sn);
		
//		System.out.println("///////////////////"+ milestone.getMber_sn());
//		System.out.println("///////////////////"+ milestone.getMile_title());
//		System.out.println("///////////////////"+ milestone.getMile_content());
//		
//		System.out.println("///////////////////"+ milestone.getMile_startdate());
//		System.out.println("///////////////////"+ milestone.getMile_enddate());
		milestoneService.regist(milestone);
		rttr.addFlashAttribute("from", "regist");

		return url;
	}
	
//	
//	@RequestMapping("/list2")
//	public ModelAndView list3(SearchCriteria cri, ModelAndView mnv,  int prjct_sn) throws Exception {
//		
//		String url = "mile/list2";
//		Map<String, Object> dataMap = milestoneService.getMileStoneList2(prjct_sn, cri);
//		mnv.addObject("dataMap", dataMap);
//		mnv.addObject("prjct_sn",prjct_sn);
//		mnv.setViewName(url);
//		return mnv;
//	}
//	
	@RequestMapping("/detail")
	public ModelAndView detail(int mile_no, String from, ModelAndView mnv, int prjct_sn)throws SQLException{
		String url="mile/detail";		
		MilestoneVO paraMile = new MilestoneVO();
		paraMile.setMile_no(mile_no);
		paraMile.setPrjct_sn(prjct_sn);
		MilestoneVO milestone = milestoneService.getMilestoneForModify(paraMile);
		//IssueVO issue1 = milestoneService.getIssueList(issue);
		List<IssueVO> issueList = milestoneService.getIssueList(mile_no);
		List<IssueVO> closeList = milestoneService.getCloseIssueList(mile_no);
		
		mnv.addObject("milestone",milestone);		
		mnv.addObject("prjct_sn",prjct_sn);
		mnv.addObject("issueList", issueList);
		mnv.addObject("closeList", closeList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
	
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(ModelAndView mnv, int mile_no, int prjct_sn) throws Exception{
		String url = "mile/modify";
		
		MilestoneVO paraMile = new MilestoneVO();
		paraMile.setMile_no(mile_no);
		paraMile.setPrjct_sn(prjct_sn);
		MilestoneVO milestone = milestoneService.getMileston(paraMile);
		
		System.out.println(milestone);
		mnv.addObject("milestone",milestone);
		mnv.addObject("prjct_sn",prjct_sn);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/modify")
	public String modifyPost(int prjct_sn, int mile_no, MileStoneModifyCommand modifyReq,HttpServletRequest request, RedirectAttributes rttr) throws Exception{
		String url = "redirect:/mile/list?prjct_sn="+prjct_sn;
//		String url = "mile/list";
//		String url = "redirect:/notification/list.do";
		
		MilestoneVO milestone = modifyReq.toMileStoneVO();
		milestone.setMile_no(mile_no);
		System.out.println("마일번호 : " + milestone.getMile_no());
		System.out.println("ㅇㅇㅇㅇ:"+milestone.getMile_state_code());
		milestoneService.modify(milestone);
//		System.out.println("수정");
		rttr.addFlashAttribute("from","modify");
		rttr.addAttribute("getMile_no", milestone.getMile_no());
		
		return url;
	}
	
	
	@RequestMapping(value="/remove",method=RequestMethod.GET)
	public String remove(int mile_no, int prjct_sn, RedirectAttributes rttr) throws Exception{
		String url="redirect:/mile/list?prjct_sn="+prjct_sn;
		
		milestoneService.remove(mile_no);
		rttr.addFlashAttribute("from","remove");
		rttr.addAttribute("mile_no",mile_no);
		
		return url;
	}

	@RequestMapping("/modify2")
	public String modify2(int prjct_sn, int mile_no, RedirectAttributes rttr) throws Exception{
		System.out.println("ㅇㅇ?");
		String url = "redirect:/mile/list.do?prjct_sn="+prjct_sn;
//		String url = "mile/list";
//		String url = "redirect:/notification/list.do";
		System.out.println("마넘 : " + mile_no);
		
		milestoneService.modify2(mile_no);
//		System.out.println("수정");
		rttr.addAttribute("from","modify");
		rttr.addAttribute("getMile_no", mile_no);
		
		return url;
	}	
	
	@RequestMapping("/modify3")
	public String modify3(int prjct_sn, int mile_no, RedirectAttributes rttr) throws Exception{
		String url = "redirect:/mile/list.do?prjct_sn="+prjct_sn;
		milestoneService.modify3(mile_no);
		rttr.addAttribute("from","modify");
		rttr.addAttribute("getMile_no", mile_no);
		
		return url;
	}	
	
	@RequestMapping("/issueRegistForm")
	public ModelAndView issue(String prjct_sn, int mile_no) throws Exception{
		ModelAndView mnv = new ModelAndView();
		
		Map<String, Object> dataMap = issueService.selectDutyCharge(prjct_sn);
		Map<String, Object> mileMap = issueService.selectMileStoneList(prjct_sn);
		
		String mile_title = "";
		
		List<IssueVO> mileList = (List<IssueVO>) mileMap.get("mileList");
		for (int i = 0; i < mileList.size(); i++) {
			if(mileList.get(i).getMile_no() == mile_no) {
				mile_title = mileList.get(i).getMile_title();
			}
		}
		
		mnv.addObject("dataMap",dataMap);
		mnv.addObject("mileMap", mileMap);
		mnv.addObject("mile_title", mile_title);
		mnv.addObject("mile_no", mile_no);
		mnv.addObject("prjct_sn", prjct_sn);
		String url = "mile/issueRegist";
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/issueRegist")
	public String issueRegist(IssueRegistCommand cmd, HttpSession session, int prjct_sn) throws Exception {
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String mber_sn = member.getMber_sn();
		
		IssueVO issue = new IssueVO();
		issue = cmd.toIssueVO();
		issue.setPrjct_sn(prjct_sn);
		issue.setMber_sn(mber_sn);
		issueService.registIssue(issue);
		
		return "mile/issueRegist_success";
	}
	
}
