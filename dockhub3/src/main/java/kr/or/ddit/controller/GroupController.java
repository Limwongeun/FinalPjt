package kr.or.ddit.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.command.GroupRegistCommand;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.GroupInviteVO;
import kr.or.ddit.dto.GroupVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.service.GroupInviteService;
import kr.or.ddit.service.GroupService;

@Controller
@RequestMapping("/mygroup")
public class GroupController {

	@Autowired GroupService service;
	
	@Autowired GroupInviteService inviteService;
	
	@RequestMapping("/main")
	public ModelAndView list(SearchCriteria cri,ModelAndView mnv,HttpSession session) throws Exception{
		
		String url = "group/list";
		System.out.println("테스트");
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		int mber_sn = Integer.parseInt(member.getMber_sn());
		
		Map<String, Object> dataMap = service.getMyGroupList(mber_sn, cri);
		Map<String, Object> inviteMap = inviteService.getInviteList(mber_sn);
		System.out.println(inviteMap+"asdasdasdasd");
		mnv.addObject("inviteMap",inviteMap);
		mnv.addObject("dataMap",dataMap);
		mnv.addObject("mber_sn",mber_sn);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/registForm")
	public ModelAndView registForm(ModelAndView mnv) throws Exception{
		String url = "group/regist";
		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/regist", method=RequestMethod.POST, produces= "text/plain;charset=utf-8")
	public String regist(GroupRegistCommand registReq,HttpServletRequest request,HttpSession session, RedirectAttributes rttr) throws Exception{
		String url = "redirect:/mygroup/main";
		
		GroupVO group = registReq.toGroupVO();
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		int mber_sn = Integer.parseInt(member.getMber_sn());

		service.regist(group);
		rttr.addFlashAttribute("from","regist");
		rttr.addAttribute("mber_sn",mber_sn);
		
		return url;
	}
	
	@RequestMapping("/inviteRes")
	public String inviteRes(int group_invite_sn, String group_invite_sttus) throws SQLException{
		String url = "redirect:main.do";
		GroupInviteVO group = new GroupInviteVO();
		group.setGroup_invite_sn(group_invite_sn);
		group.setGroup_invite_sttus(group_invite_sttus);
		inviteService.inviteResponse(group);
		
		return url;
		
	}
	
}
