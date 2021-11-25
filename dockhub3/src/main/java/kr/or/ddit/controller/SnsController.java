package kr.or.ddit.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.service.BestOfDockService;
import kr.or.ddit.service.KnowhowService;
import kr.or.ddit.service.RecruitService;

@Controller
@RequestMapping("/sns")
public class SnsController {
	
	@Autowired
	private KnowhowService knowhowservice;
	
	@Autowired
	private RecruitService service;
	
	@Autowired BestOfDockService bodService;

	@RequestMapping("/dash")
	public ModelAndView dash(SearchCriteria cri, ModelAndView mnv, HttpSession session) throws SQLException{
		String url ="sns/dash";
		
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String mber_sn = member.getMber_sn();
		
		Map<String, Object> dataMap = service.getList2(cri);
		Map<String, Object> dataMap3 = service.getList3(cri);
		Map<String, Object> dataMap2 = knowhowservice.getList(cri, mber_sn);
		
		Map<String, Object> memberMap = bodService.bestMemberList();
		Map<String, Object> knowhowMap = bodService.bestKnowhowList();
		Map<String, Object> projectMap = bodService.bestProjectList();
		
		mnv.addObject("projectMap",projectMap);
		mnv.addObject("memberMap",memberMap);
		mnv.addObject("knowhowMap",knowhowMap);
		
		mnv.addObject("dataMap", dataMap);
		mnv.addObject("dataMap2", dataMap2);
		mnv.addObject("dataMap3", dataMap3);
		
		return mnv;
	}
	
	
	
}












