package kr.or.ddit.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.FileSaveVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.RecruitApplyVO;
import kr.or.ddit.dto.RecruitVO;
import kr.or.ddit.service.MemberService;
import kr.or.ddit.service.ProjectUserService;
import kr.or.ddit.service.RecruitApplyService;
import kr.or.ddit.service.RecruitService;

@Controller
@RequestMapping("/myRecruit")
public class MyRecruitController {
	
	@Autowired
	private RecruitService recruitService;
	
	@Autowired
	private RecruitApplyService recruitApplyService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ProjectUserService projectUserService;
	
	@RequestMapping(value="/getMyRecruit/{mber_sn}/{myRecruitPage}",method=RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> getMyRecruit(@PathVariable("mber_sn")String mber_sn,@PathVariable("myRecruitPage")int myRecruitPage) throws Exception{
		ResponseEntity<Map<String , Object>> entity = null;
		SearchCriteria cri = new SearchCriteria();
		
		cri.setPage(myRecruitPage);
		
		try {
			Map<String , Object> dataMap =recruitService.selectMyRecruitList(mber_sn, cri);
			entity = new ResponseEntity<Map<String, Object>>(dataMap,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
	         entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value="/getApplyRecruit/{mber_sn}/{applyRecruitPage}",method=RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> getApplyRecruit(@PathVariable("mber_sn")String mber_sn,@PathVariable("applyRecruitPage")int applyRecruitPage) throws Exception{
		ResponseEntity<Map<String , Object>> entity = null;
		SearchCriteria cri = new SearchCriteria();
		cri.setPage(applyRecruitPage);
		
		try {
			Map<String , Object> dataMap =recruitApplyService.selectApplyRecruitList(mber_sn, cri);
			entity = new ResponseEntity<Map<String, Object>>(dataMap,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
	         entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	
	@RequestMapping("/applyManage")
	public ModelAndView applyManage(int pblanc_sn, ModelAndView mnv , HttpSession session) throws SQLException{
		String url="recruit/applyManage";
		RecruitVO recruit = null;
		
		recruit = recruitService.getRecruitForModify(pblanc_sn);
		
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String mber_sn = member.getMber_sn();
		mnv.addObject("mber_sn",mber_sn);
		mnv.addObject("recruit",recruit);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/getMyRecruitApply/{pblanc_sn}/{myRecruitApplyPage}",method=RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> getMyRecruit(@PathVariable("pblanc_sn")int pblanc_sn,@PathVariable("myRecruitApplyPage")int myRecruitApplyPage) throws Exception{
		ResponseEntity<Map<String , Object>> entity = null;
		SearchCriteria cri = new SearchCriteria();
		
		cri.setPage(myRecruitApplyPage);
		
		try {
			Map<String , Object> dataMap =recruitApplyService.myRecruitApplyListByPblancSn(pblanc_sn, cri);
			entity = new ResponseEntity<Map<String, Object>>(dataMap,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
	         entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value="/getRecruitMeeting/{recruitMeetingPage}",method=RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> getRecruitMeeting(@PathVariable("recruitMeetingPage")int recruitMeetingPage, HttpSession session) throws Exception{
		ResponseEntity<Map<String , Object>> entity = null;
		SearchCriteria cri = new SearchCriteria();
		
		cri.setPage(recruitMeetingPage);
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		try {
			Map<String , Object> dataMap =recruitApplyService.recruitMeetingListByPblancSn(member.getMber_sn(), cri);
			entity = new ResponseEntity<Map<String, Object>>(dataMap,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
	         entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	@RequestMapping(value="/getMeetingResult/{meetingResultPage}",method=RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> getMeetingResult(@PathVariable("meetingResultPage")int meetingResultPage, HttpSession session) throws Exception{
		ResponseEntity<Map<String , Object>> entity = null;
		SearchCriteria cri = new SearchCriteria();
		
		cri.setPage(meetingResultPage);
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		try {
			Map<String , Object> dataMap =recruitApplyService.meetingResultList(member.getMber_sn(), cri);
			entity = new ResponseEntity<Map<String, Object>>(dataMap,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
	         entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	@RequestMapping(value="/getApplyMeeting/{recruitMeetingPage}",method=RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> getApplyMeeting(@PathVariable("recruitMeetingPage")int recruitMeetingPage, HttpSession session) throws Exception{
		ResponseEntity<Map<String , Object>> entity = null;
		SearchCriteria cri = new SearchCriteria();
		
		cri.setPage(recruitMeetingPage);
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		try {
			Map<String , Object> dataMap =recruitApplyService.applyMeetingListByMberSn(member.getMber_sn(), cri);
			entity = new ResponseEntity<Map<String, Object>>(dataMap,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
	         entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	@RequestMapping(value="/getApplyMeetingResult/{meetingResultPage}",method=RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> getApplyMeetingResult(@PathVariable("meetingResultPage")int meetingResultPage, HttpSession session) throws Exception{
		ResponseEntity<Map<String , Object>> entity = null;
		SearchCriteria cri = new SearchCriteria();
		
		cri.setPage(meetingResultPage);
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		try {
			Map<String , Object> dataMap =recruitApplyService.myMeetingResultList(member.getMber_sn(), cri);
			entity = new ResponseEntity<Map<String, Object>>(dataMap,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
	         entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	@RequestMapping("/applyDetail")
	public ModelAndView applyDetail(int pblanc_sport_sn,String from, ModelAndView mnv , HttpSession session) throws SQLException{
		String url="recruit/applyDetail";
		RecruitApplyVO recruitApply = recruitApplyService.selectApplyByPblancSportSn(pblanc_sport_sn);
		String mber_sn = recruitApply.getPblanc_sport_man_sn();
		MemberVO member = memberService.getMemberDetail(mber_sn);
		mnv.addObject("from",from);
		mnv.addObject("recruitApply",recruitApply);
		mnv.addObject("member",member);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/refuseApply",method=RequestMethod.POST)
	public ResponseEntity<HttpStatus> refuseApply(int pblanc_sport_sn) throws Exception{
		recruitApplyService.updateApplyRefuse(pblanc_sport_sn);
		HttpStatus status = HttpStatus.OK;
		ResponseEntity<HttpStatus> entity = new ResponseEntity<>(status);
		return entity;
	}
	
	@RequestMapping(value="/addMeetingDate",method=RequestMethod.POST)
	public ResponseEntity<String> addMeetingDate(int pblanc_sport_sn, String meeting) throws Exception{
		RecruitApplyVO recruitApply = new RecruitApplyVO();
		recruitApply.setPblanc_sport_sn(pblanc_sport_sn);
		recruitApply.setPblanc_meeting_time(meeting);
		recruitApplyService.updateMeetingTime(recruitApply);
		HttpStatus status = HttpStatus.OK;
		ResponseEntity<String> entity = new ResponseEntity<>("OK",status);
		return entity;
	}
	@RequestMapping(value="/updateEndMeeting",method=RequestMethod.POST)
	public ResponseEntity<String> updateEndMeeting(int pblanc_sport_sn) throws Exception{
		recruitApplyService.updateMeetingEnd(pblanc_sport_sn);
		HttpStatus status = HttpStatus.OK;
		ResponseEntity<String> entity = new ResponseEntity<>("OK",status);
		return entity;
	}
	@RequestMapping(value="/refuseRecruit",method=RequestMethod.POST)
	public ResponseEntity<String> refuseRecruit(int pblanc_sport_sn) throws Exception{
		recruitApplyService.updateRefuseRecruit(pblanc_sport_sn);
		HttpStatus status = HttpStatus.OK;
		ResponseEntity<String> entity = new ResponseEntity<>("OK",status);
		return entity;
	}
	@RequestMapping(value="/acceptRecruit",method=RequestMethod.POST)
	public ResponseEntity<String> acceptRecruit(int pblanc_sport_sn) throws Exception{
		recruitApplyService.updateAcceptRecruit(pblanc_sport_sn);
		projectUserService.insertRecruitUser(pblanc_sport_sn);
		HttpStatus status = HttpStatus.OK;
		ResponseEntity<String> entity = new ResponseEntity<>("OK",status);
		return entity;
	}
	
	
}
