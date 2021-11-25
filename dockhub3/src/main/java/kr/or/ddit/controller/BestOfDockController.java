package kr.or.ddit.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.service.BestOfDockService;

@Controller
@RequestMapping("/bestofdock")
public class BestOfDockController {

	@Autowired BestOfDockService bodService;
	
	@RequestMapping("list")
	public ModelAndView list(ModelAndView mnv) throws Exception{
		String url = "bestofdock/list";
		
		Map<String, Object> memberMap = bodService.bestMemberList();
		Map<String, Object> knowhowMap = bodService.bestKnowhowList();
		Map<String, Object> projectMap = bodService.bestProjectList();
		
		mnv.addObject("projectMap",projectMap);
		mnv.addObject("memberMap",memberMap);
		mnv.addObject("knowhowMap",knowhowMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	
}
