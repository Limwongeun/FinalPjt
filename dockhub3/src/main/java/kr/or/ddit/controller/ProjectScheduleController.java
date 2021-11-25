package kr.or.ddit.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.command.ProjectScheduleModifyCommand;
import kr.or.ddit.command.ProjectScheduleRegistCommand;
import kr.or.ddit.dto.ProjectScheduleNotificationVO;
import kr.or.ddit.dto.ProjectScheduleVO;
import kr.or.ddit.service.MemScheduleNotificationService;
import kr.or.ddit.service.ProjectScheduleService;
import kr.or.ddit.service.ProjectService;

@Controller
@RequestMapping("pmsproject")
public class ProjectScheduleController {

	@Autowired
	private ProjectScheduleService service;
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private MemScheduleNotificationService notificationService;

	@RequestMapping("/scheduleList")
	public ModelAndView list(ModelAndView mnv,int prjct_sn, HttpSession session) throws Exception{
		String url = "pmsproject/scheduleList";
		
		Map<String, Object> dataMap = service.selectProjectList(prjct_sn);
		Map<String, Object> commingDate = service.commingScheList(prjct_sn);
		
		mnv.addObject("dataMap",dataMap);
		mnv.addObject("commingDate",commingDate);
		mnv.addObject("prjct_sn", prjct_sn);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping(value ="/scheduleDetail")
	public ModelAndView detail(int prjct_schdul_sn, ModelAndView mnv) throws Exception{
		String url = "pmsproject/scheduleDetail";
		
		ProjectScheduleVO projectSchedule = null;
		
		projectSchedule = service.getSchedule(prjct_schdul_sn);
		
		mnv.addObject("prjct_schdul_sn",prjct_schdul_sn);
		mnv.addObject("projectSchedule",projectSchedule);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/scheduleRegistForm")
	public ModelAndView registForm(ModelAndView mnv) throws Exception{
		String url= "pmsproject/scheduleRegist";
		mnv.setViewName(url);
		return mnv;
	}
	@RequestMapping(value = "/scheduleRegist", method=RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public String regist(ProjectScheduleRegistCommand registReq, HttpServletRequest request,RedirectAttributes rttr) throws Exception {
		String url = "redirect:/pmsproject/scheduleList";
		
		ProjectScheduleVO projectSchedule = registReq.toProjectScheduleVO();
		service.regist(projectSchedule);
		
		if(projectSchedule.getPrjct_allday().equals("0")) {
			ProjectScheduleNotificationVO notification = new ProjectScheduleNotificationVO();
			notification.setPrjct_schdul_sn(projectSchedule.getPrjct_schdul_sn());
			notification.setPrjct_ntcn_time(projectSchedule.getPrjct_schdul_nm());
			notificationService.projectRegist(notification);
		}
		
		rttr.addFlashAttribute("from","regist");
		rttr.addAttribute("prjct_sn", projectSchedule.getPrjct_sn());
		return url;
	}
	@RequestMapping("/scheduleModifyForm")
	public ModelAndView modifyForm(int prjct_schdul_sn,ModelAndView mnv) throws Exception{
		String url="/pmsproject/scheduleModify";
		
		ProjectScheduleVO projectSchedule = service.getSchedule(prjct_schdul_sn);
		
		mnv.addObject("projectSchedule", projectSchedule);
		mnv.setViewName(url);
		
		return mnv;
	}
	@RequestMapping("scheduleModify")
	public String modifyPost(ProjectScheduleModifyCommand modifyReq,HttpServletRequest request,RedirectAttributes rttr) throws Exception{
		
		String url = "redirect:/pmsproject/scheduleDetail.do";
		
		ProjectScheduleVO projectSchedule = modifyReq.toProjectScheduleVO();
		
		service.modify(projectSchedule);
		
		rttr.addFlashAttribute("from","modify");
		rttr.addAttribute("prjct_schdul_sn", projectSchedule.getPrjct_schdul_sn());
		System.out.println(projectSchedule.getPrjct_schdul_sn());
		
		return url;
	}
	
	@RequestMapping("/scheduleRemove")
	public String remove(int prjct_schdul_sn,RedirectAttributes rttr) throws Exception{
		String url = "redirect:/pmsproject/scheduleDetail.do";
		
		service.remove(prjct_schdul_sn);
		
		rttr.addFlashAttribute("from","remove");
		rttr.addAttribute("prjct_schdul_sn",prjct_schdul_sn);
		
		return url;
	}
	
	@RequestMapping("/modifyByDrag")
	@ResponseBody
	public ResponseEntity<String> modifyByDrag(ProjectScheduleModifyCommand modifyReq) throws Exception{
		
		ResponseEntity<String> entity = null;
		
		ProjectScheduleVO project = modifyReq.toProjectScheduleVO();
		System.out.println(project.getPrjct_schdul_sn());
		System.out.println(project.getPrjct_schdul_bgnde());
		System.out.println(project.getPrjct_schdul_endde());
		
		try {
			service.modifyByDrag(project);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return entity;
	}
}
