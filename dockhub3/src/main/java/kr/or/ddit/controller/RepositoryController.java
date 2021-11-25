package kr.or.ddit.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.ProjectVO;
import kr.or.ddit.dto.RepositoryVO;
import kr.or.ddit.service.ProjectService;
import kr.or.ddit.service.RepositoryService;
@Controller
@RequestMapping(value = "/repo", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
//@RequestMapping("/repo")
public class RepositoryController {

	@Autowired
	private RepositoryService repoService;
	@Autowired
	private ProjectService proService;
	
	@RequestMapping(value = "/repository", method = RequestMethod.GET)
	public ModelAndView selectRepositoryList(ModelAndView mnv, int prjct_sn) throws SQLException{
		List<MemberVO> plInfo = repoService.selectPLInfo(prjct_sn);
		List<RepositoryVO> repo_url = repoService.selectRepo(prjct_sn);
		mnv.addObject("repo_url", repo_url);
		mnv.addObject("plInfo", plInfo.get(0).getMber_ncnm());
		mnv.addObject("prjct_sn", prjct_sn);
//		model.addAttribute("plInfo", plInfo);
		mnv.setViewName("repo/repository");
		ProjectVO project = proService.getProject(prjct_sn);
		System.out.println(project.getPrjct_sj());
		mnv.addObject("project", project);
		return mnv;
	}
	
	@RequestMapping(value = "/repo", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<RepositoryVO>> selectRepoUrl(int prjct_sn) {
		System.out.println(prjct_sn);
		ResponseEntity<List<RepositoryVO>> entity = null;
		try {
			List<RepositoryVO> repoList = repoService.selectRepo(prjct_sn);
			HttpStatus status = HttpStatus.OK;
			entity = new ResponseEntity<List<RepositoryVO>>(repoList, status);
//			System.out.println("repo_url : " + repoList.get(0).getRepo_url());
		} catch (Exception e) {
		} 
		return entity;
	}
	
	
	@RequestMapping("/remove.do")
	public String deleteRepository(int prjct_sn) {
		System.out.println("remove: " + prjct_sn);
		repoService.removeRepository(prjct_sn);
		return "repo/repository";
	}
	
	@RequestMapping("/regist.do")
	@ResponseBody
	public ResponseEntity<String> registRepository(@RequestParam String repo_url, int prjct_sn) {
		ResponseEntity<String> entity = null;
		System.out.println(repo_url);
		RepositoryVO repo = new RepositoryVO();
		repo.setRepo_url(repo_url);
		repo.setPrjct_sn(prjct_sn);
		repoService.registRepository(repo);
		entity = new ResponseEntity<String>("OK", HttpStatus.OK);
//		System.out.println("entity : " + entity + "entityStatus : " + entity.getStatusCodeValue());
		return entity;
	}
}
