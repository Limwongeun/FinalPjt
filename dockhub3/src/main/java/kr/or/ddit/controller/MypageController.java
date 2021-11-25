package kr.or.ddit.controller;

import java.sql.SQLException;
import java.util.List;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.DutyChargeVO;
import kr.or.ddit.dto.IssueVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.ProjectVO;
import kr.or.ddit.service.DutyChargeService;
import kr.or.ddit.service.IssueService;
import kr.or.ddit.service.MemberScheduleService;
import kr.or.ddit.service.MyDutyChargeService;
import kr.or.ddit.service.MyFileService;
import kr.or.ddit.service.MyIssueService;
import kr.or.ddit.service.MypageService;
import kr.or.ddit.service.ProjectService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private MyFileService myfileService;
	
	@Autowired
	private MyDutyChargeService myDutyChargeService;
	
	@Autowired
	ProjectService projectService;
	
	@Autowired
	private MemberScheduleService scheduleService;
	
	@Autowired
	private MyIssueService myIssueService;
	
	@Autowired
	private IssueService issueService;

	@Autowired
	private DutyChargeService dutyService;
	
	@RequestMapping("/main")
	public ModelAndView pmsproject(SearchCriteria cri, HttpSession session, ModelAndView mnv) throws SQLException {
		String url = "mypage/main";
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String mber_sn = member.getMber_sn();
		
		
		int projectCount = mypageService.selectProjectCount(mber_sn);
		int issueCount = mypageService.selectIssueCount(mber_sn);
		int issueOpen = mypageService.selectIssueOpen(mber_sn);
		int issueClose = mypageService.selectIssueClose(mber_sn);
		int selectDutychargeCount = mypageService.selectDutychargeCount(mber_sn);
		int selectFileCount = mypageService.selectFileCount(mber_sn);
//		List<ProjectVO> projectList= projectService.getMberProject(mber_sn);
		List<ProjectVO> projectList=projectService.getMberProject2(mber_sn);
		Map<String,Object> sechduleList = scheduleService.selectList(mber_sn);
		Map<String,Object> commingDate = scheduleService.commingScheList(mber_sn);
		List<String> issueStatus = issueService.getMberIssueStatus(mber_sn);
		List<String> dutyStatus = dutyService.getMberDutyStatus(mber_sn);
		mnv.addObject("commingDate",commingDate);
		mnv.addObject("sechduleList",sechduleList);
		mnv.addObject("projectCount",projectCount);
		mnv.addObject("issueCount", issueCount);
		mnv.addObject("issueOpen", issueOpen);
		mnv.addObject("issueClose", issueClose);
		mnv.addObject("selectDutychargeCount", selectDutychargeCount);
		mnv.addObject("selectFileCount", selectFileCount);
		mnv.addObject("projectList", projectList);
		
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
		
		
		
		mnv.addObject("ooo", ooo);
		mnv.addObject("ccc", ccc);
		mnv.addObject("eee", eee);
		mnv.addObject("ddd", ddd);
		mnv.addObject("ppp", ppp);
		mnv.addObject("www", www);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/filesave")
	public ModelAndView fileSave( String from,  ModelAndView mnv) throws Exception{
		String url = "mypage/myfile_save";
		//System.out.println(prjct_sn);
		if (from != null) {
			mnv.addObject("from",from);
		}
		
		mnv.setViewName(url);
		return mnv;
	
	}
	
	@RequestMapping(value = "/repository", method = RequestMethod.GET)
	public ModelAndView selectRepositoryList(ModelAndView mnv, HttpSession session){
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String mber_sn = member.getMber_sn();
		List<MemberVO> repo_url = mypageService.selectRepo(mber_sn);
		mnv.addObject("repo_url", repo_url);
		mnv.setViewName("mypage/repository");
		return mnv;
	}
	
	@RequestMapping(value = "/repo", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<MemberVO>> selectRepoUrl(HttpSession session) {
		ResponseEntity<List<MemberVO>> entity = null;
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String mber_sn = member.getMber_sn();
		try {
			List<MemberVO> repoList = mypageService.selectRepo(mber_sn);
			HttpStatus status = HttpStatus.OK;
			System.out.println(member.getMber_repo());
			if(member.getMber_repo() == null || member.getMber_repo().length() == 0) {
				status = HttpStatus.BAD_REQUEST;
			}
			entity = new ResponseEntity<List<MemberVO>>(repoList, status);
		} catch (Exception e) {
		} 
		return entity;
	}
	
	
	@RequestMapping("/remove.do")
	public String deleteRepository(HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String mber_sn = member.getMber_sn();
		mypageService.removeRepository(mber_sn);
		return "mypage/repository";
	}
	
	@RequestMapping("/regist.do")
	@ResponseBody
	public ResponseEntity<String> registRepository(@RequestParam String repo_url, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String mber_sn = member.getMber_sn();
		ResponseEntity<String> entity = null;
		System.out.println(repo_url);
		member = new MemberVO();
		member.setMber_repo(repo_url);
		member.setMber_sn(mber_sn);
		mypageService.registRepository(member);
		entity = new ResponseEntity<String>("OK", HttpStatus.OK);
		System.out.println("entity : " + entity + "entityStatus : " + entity.getStatusCodeValue());
		return entity;
	}
	
	   @RequestMapping("/list")
	   public ModelAndView list(HttpSession session, SearchCriteria cri, ModelAndView mnv)throws SQLException{
	      String url="mypage/list";      
	      MemberVO member = (MemberVO) session.getAttribute("loginUser");
	      cri.setMber_sn(member.getMber_sn());
	      Map<String,Object> dataMap = myfileService.getFileList(cri);
	      
	      mnv.addObject("dataMap",dataMap);
	      mnv.setViewName(url);
	      
	      return mnv;
	   }
	 
	   @RequestMapping(value = "/dutycharge", method = RequestMethod.GET)
	   public ModelAndView dutychargeList(HttpSession session, SearchCriteria cri, ModelAndView mnv)throws Exception{
		   String url="mydutycharge/list";      
		   MemberVO member = (MemberVO) session.getAttribute("loginUser");
		   
		   cri.setMber_sn(member.getMber_sn());
		   
		   Map<String,Object> dataMap = myDutyChargeService.getDutyChargeList(cri);
		   
		   mnv.addObject("dataMap",dataMap);
		   mnv.setViewName(url);
		   
		   return mnv;
	   }
	   @RequestMapping("/detail")
	   public ModelAndView detailDutyCharge(int unit_job_sn, String from, ModelAndView mnv) throws Exception{
		   String url = "mydutycharge/detail";
		   DutyChargeVO duty = new DutyChargeVO();
		   
		   duty.setUnit_job_sn(unit_job_sn);
		   DutyChargeVO detailDutyCharge = myDutyChargeService.getDetailDutyCharge(duty);
		   
		   mnv.addObject("detailDutyCharge",detailDutyCharge);
		   mnv.setViewName(url);
		   return mnv;
	   }
	   
	   @RequestMapping("/modifyForm")
	   public ModelAndView modifyForm(int unit_job_sn, HttpServletRequest request) throws Exception{
		   ModelAndView mnv = new ModelAndView();
		   DutyChargeVO duty = new DutyChargeVO();
		   
		   duty.setUnit_job_sn(unit_job_sn);
		   DutyChargeVO detailDutyCharge = myDutyChargeService.getDetailDutyCharge(duty);
		   
		   mnv.addObject("detailDutyCharge",detailDutyCharge);
		   mnv.addObject("unit_job_sn",unit_job_sn);
		   mnv.setViewName("mydutycharge/modify");
		   
		return mnv;
	   }
	   
	   @RequestMapping("/modify")
	   public String modify(int unit_job_sn,HttpServletRequest request, RedirectAttributes rttr) throws Exception{
		   String url = "/mydutycharge/modify_success";
		   
		   DutyChargeVO duty = new DutyChargeVO();
		   
		   unit_job_sn = Integer.parseInt(request.getParameter("unit_job_sn"));
		   Integer unit_job_pro = Integer.parseInt(request.getParameter("unit_job_pro"));
		   String unit_job_cn = request.getParameter("unit_job_cn");
		   
		   duty.setUnit_job_sn(unit_job_sn);
		   duty.setUnit_job_pro(unit_job_pro);
		   duty.setUnit_job_cn(unit_job_cn);
		   
		   myDutyChargeService.modifyDutyCharge(duty);
		   
		   return url;
	   }
	   
	   @RequestMapping("/dutyChargeMain")
	   public String dutyChargeMain(HttpServletRequest request, Model model) throws Exception{
		   
		   DutyChargeVO duty = new DutyChargeVO();
		   
		   String unit_job_sn = request.getParameter("unit_job_sn");
		   
		   duty.setUnit_job_sn(Integer.parseInt(unit_job_sn));
		   DutyChargeVO detailDutyCharge = myDutyChargeService.getDetailDutyCharge(duty);
		   
		   model.addAttribute("detailDutyCharge", detailDutyCharge);
		   
		   return "/mydutycharge/dutyChargeMain";
	   }
	   
	   @RequestMapping("/dutyChargeHis")
	   public String dutyChargeHis(HttpServletRequest request, Model model) throws Exception{
		   
		   String unit_job_sn = request.getParameter("unit_job_sn"); 
		   
		   DutyChargeVO duty = new DutyChargeVO();
		   
		   duty.setUnit_job_sn(Integer.parseInt(unit_job_sn));
		   List<DutyChargeVO> dutyChargeHistory = myDutyChargeService.getDutyChargeHistory(duty);
		   
		   model.addAttribute("dutyChargeHistory",dutyChargeHistory);
		   model.addAttribute("unit_job_sn", unit_job_sn);
		   
		   return "/mydutycharge/dutyChargeHis";
		   
	   }
	   
	   @RequestMapping("/issue")
	   public ModelAndView issueList(HttpSession session, SearchCriteria cri, ModelAndView mnv)throws SQLException{
	      String url="myissue/main";      
	      MemberVO member = (MemberVO) session.getAttribute("loginUser");
	      
	      
	      mnv.addObject("mber_sn",member.getMber_sn());
	      mnv.setViewName(url);
	      
	      return mnv;
	   }
	   
	   @RequestMapping(value="/listOpen/{mber_sn}/{filePage}",method=RequestMethod.POST)
		public ResponseEntity<Map<String , Object>> getOpen(@PathVariable("mber_sn")int mber_sn,@PathVariable("filePage")int filePage) throws Exception{
			ResponseEntity<Map<String , Object>> entity = null;
			SearchCriteria cri = new SearchCriteria();
			
			cri.setPage(filePage);
			
			try {
				Map<String , Object> dataMap =myIssueService.selectIssueByMber_sn(mber_sn, cri);
				entity = new ResponseEntity<Map<String, Object>>(dataMap,HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
		         entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		         
			}
			
			return entity;
		}
	   
	   @RequestMapping(value="/listClose/{mber_sn}/{filePage}",method=RequestMethod.POST)
		public ResponseEntity<Map<String , Object>> getClose(@PathVariable("mber_sn")int mber_sn,@PathVariable("filePage")int filePage) throws Exception{
			ResponseEntity<Map<String , Object>> entity = null;
			SearchCriteria cri = new SearchCriteria();
			
			cri.setPage(filePage);
			
			try {
				Map<String , Object> dataMap =myIssueService.selectIssueCloseByMber_sn(mber_sn, cri);
				entity = new ResponseEntity<Map<String, Object>>(dataMap,HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
				
			}
			
			return entity;
		}

	   @RequestMapping("/mydetail")
		public ModelAndView detailIssue(int issue_sn, int prjct_sn,HttpSession session, String from, ModelAndView mnv) throws Exception{
			String url = "issue/detail";
			IssueVO issue = new IssueVO();
			MemberVO member = (MemberVO) session.getAttribute("loginUser");
			String mber_sn = member.getMber_sn();
			issue.setMber_sn(mber_sn);
			issue.setIssue_sn(issue_sn);
			issue.setPrjct_sn(prjct_sn);
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
}
