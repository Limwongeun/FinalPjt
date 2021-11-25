package kr.or.ddit.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.command.DutyChargeModifyCommand;
import kr.or.ddit.command.DutyChargeRegistCommand;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.DutyChargeVO;
import kr.or.ddit.service.DutyChargeService;

@Controller
@RequestMapping("/pmsDuty")
public class DutyChargeController {
	
	@Autowired
	private DutyChargeService service;
	
	
	@RequestMapping("/dutycharge")
	public ModelAndView list(SearchCriteria cri,ModelAndView mnv,int prjct_sn) throws Exception{
		String url = "dutycharge/gantt";
		
		List<DutyChargeVO> userList = service.getUserList(prjct_sn);
		mnv.addObject("prjct_sn", prjct_sn);
		mnv.addObject("userList", userList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/modify")
	public ModelAndView modify(DutyChargeModifyCommand dmc, int prjct_sn) throws Exception{
		ModelAndView mnv = new ModelAndView();
		DutyChargeVO dutyChargeVO = dmc.toDutyChargeVO();
		service.modify(dutyChargeVO);
		mnv.addObject("prjct_sn", prjct_sn);
		mnv.setViewName("dutycharge/modify_success");
		
		return mnv;
	}
	
	
	@RequestMapping("/regist")
	public ModelAndView regist(int prjct_sn, DutyChargeRegistCommand registReq) throws Exception{
		
		ModelAndView mnv = new ModelAndView();
		mnv.addObject("prjct_sn", prjct_sn);
		mnv.setViewName("dutycharge/regist_success");
		DutyChargeVO dutycharge = registReq.toDutyChargeVO();
		service.regist(dutycharge);
		
		return mnv;
	}
	
	@RequestMapping("/remove")
	public ModelAndView remove(int prjct_sn, int unit_job_sn) throws Exception {
		ModelAndView mnv = new ModelAndView();
		mnv.addObject("prjct_sn", prjct_sn);
		mnv.setViewName("dutycharge/remove_success");
		service.remove(unit_job_sn);
		
		return mnv;
	}
	
	@RequestMapping("/list")
	@ResponseBody
	public ResponseEntity<List<DutyChargeVO>> selectList(int prjct_sn) throws SQLException {
		List<DutyChargeVO> dutyList = service.getList(prjct_sn);
		ResponseEntity<List<DutyChargeVO>> entity = null;
		HttpStatus status = HttpStatus.OK;
		entity = new ResponseEntity<List<DutyChargeVO>>(dutyList, status);
		
		return entity;
	}
	
	
}
