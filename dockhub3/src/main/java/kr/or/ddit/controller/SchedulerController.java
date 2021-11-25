package kr.or.ddit.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.command.MemberScheduleModifyCommand;
import kr.or.ddit.command.MemberScheduleRegistCommand;
import kr.or.ddit.dto.MemScheduleNotificationVO;
import kr.or.ddit.dto.MemberScheduleVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.service.MemScheduleNotificationService;
import kr.or.ddit.service.MemberScheduleService;

@Controller
@RequestMapping("/mypage/scheduler")
public class SchedulerController {
	
	@Autowired
	private MemberScheduleService service;
	
	@Autowired
	private MemScheduleNotificationService notificationService;
	
	@RequestMapping("")
	public ModelAndView list(ModelAndView mnv,HttpSession session) throws Exception{
		String url = "scheduler/list";
		
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		
		String mber_sn = member.getMber_sn();
		System.out.println(mber_sn);
		Map<String,Object> dataMap = service.selectList(mber_sn);
		Map<String,Object> commingDate = service.commingScheList(mber_sn);
		System.out.println(commingDate+"asdasd");
		if(!dataMap.isEmpty()) {
			mnv.addObject("dataMap",dataMap);
			mnv.addObject("commingDate",commingDate);
			mnv.setViewName(url);
		}else {
			
		}
		//System.out.println(dataMap.toString());
		return mnv;
		
	}
	
	@RequestMapping("/registForm")
	public ModelAndView registForm(ModelAndView mnv) throws Exception{
		String url = "scheduler/registForm";
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value = "/regist", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public String regist(MemberScheduleRegistCommand registReq,HttpServletRequest request,RedirectAttributes rttr) throws Exception{
		
		String url = "redirect:/mypage/scheduler/";
		
		MemberScheduleVO memberSchedule = registReq.toMemberScheduleVO();
		
		service.regist(memberSchedule);	
		if(memberSchedule.getMber_allday().equals("0")) {
			MemScheduleNotificationVO notification = new MemScheduleNotificationVO();
			notification.setMber_schdul_sn(memberSchedule.getMber_schdul_sn());
			notification.setMber_ntcn_time(memberSchedule.getMber_schdul_bgnde());
			System.out.println(notification.getMber_schdul_sn());
			System.out.println(notification.getMber_ntcn_time());
			notificationService.regist(notification);
		}
		rttr.addFlashAttribute("from","regist");
		
		return url;
	}
	
	@RequestMapping(value = "/detail" )
	public ModelAndView detail( int mber_schdul_sn, ModelAndView mnv) throws Exception{
		String url = "/scheduler/detail";
		
		MemberScheduleVO memberSchedule = null;
		
		memberSchedule = service.getSchedule(mber_schdul_sn);
		
		System.out.println("넘버"+mber_schdul_sn);
		mnv.addObject("mber_schdul_sn",mber_schdul_sn);
		mnv.addObject("memberSchedule",memberSchedule);
		mnv.setViewName(url);
		System.out.println(mnv.getModel());
		System.out.println(mnv.getModelMap());
		System.out.println(mnv.getViewName());
		return mnv;
	}

	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(ModelAndView mnv, int mber_schdul_sn) throws Exception{
		String url = "scheduler/modify";
		
		MemberScheduleVO memberSchedule = service.getSchedule(mber_schdul_sn);
		
		mnv.addObject("memberSchedule", memberSchedule);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/modify")
	public String modifyPost(MemberScheduleModifyCommand modifyReq,HttpServletRequest request,RedirectAttributes rttr) throws Exception{
		String url = "redirect:/mypage/scheduler/detail.do";
		
		MemberScheduleVO memberSchedule = modifyReq.toMemberScheduleVO();
		
		service.modify(memberSchedule);
		
		rttr.addFlashAttribute("from", "modify");
		rttr.addAttribute("mber_schdul_sn", memberSchedule.getMber_schdul_sn());
		
		return url;
	}
	@RequestMapping("/modifyByDrag")
	@ResponseBody
	public ResponseEntity<String> modifyByDrag( MemberScheduleModifyCommand modifyReq) throws Exception{
		ResponseEntity<String> entity = null;
		MemberScheduleVO member = modifyReq.toMemberScheduleVO();
		System.out.println(member.getMber_schdul_sn());
		System.out.println(member.getMber_schdul_bgnde());
		System.out.println(member.getMber_schdul_endde());
		
		try {
			service.modifyByDrag(member);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			
		}
		
		return entity;
	}
	
	@RequestMapping("/remove")
	public String remove(int mber_schdul_sn,RedirectAttributes rttr) throws Exception{
		String url = "redirect:/mypage/scheduler/detail.do";
		
		service.remove(mber_schdul_sn);
		
		rttr.addFlashAttribute("from","remove");
		rttr.addAttribute("mber_schdul_sn",mber_schdul_sn);
		
		return url;
	}
	
}
