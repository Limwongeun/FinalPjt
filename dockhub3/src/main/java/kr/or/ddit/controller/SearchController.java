package kr.or.ddit.controller;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.service.ProjectService;

@Controller
@RequestMapping("/search")
public class SearchController {
	@Autowired
	private ProjectService projectService;
	
   @RequestMapping("/searchList")
   public ModelAndView searchList(ModelAndView mnv,SearchCriteria cri, String keyword) throws Exception{

     cri.setSearchType("t");
     cri.setKeyword(keyword);
     cri.setPage(1);
     
	  Map<String,Object> dataMap = projectService.selectSearchProjectList(cri);
	  mnv.addObject("dataMap", dataMap);
	  
      mnv.setViewName("common/searchList");;
      
      return mnv;
   }

	@RequestMapping("/list")
	public ModelAndView list(SearchCriteria cri, ModelAndView mnv)throws SQLException{
		String url="common/searchList";		
		 Map<String,Object> dataMap = projectService.selectSearchProjectList(cri);
		
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
}
