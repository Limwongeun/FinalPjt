package kr.or.ddit.controller;

import java.sql.SQLException;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.command.KnowhowRegistCommand;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.KnowhowVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.service.KnowhowReplyService;
import kr.or.ddit.service.KnowhowService;

@Controller
@RequestMapping("/knowhow")
public class KnowhowController {
	
	@Autowired
	private KnowhowService service;
	
	@Autowired
	private KnowhowReplyService replyService;
	
	
	@RequestMapping("/list")
	public ModelAndView list(SearchCriteria cri, ModelAndView mnv, HttpSession session) throws Exception{
				
		String url = "knowhow/list";
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String mber_sn = member.getMber_sn();
		cri.setPage(1);
		Map<String, Object> dataMap = service.getList(cri, mber_sn);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		// 2페이지 불러올 키값 설정
		String listKey = UUID.randomUUID().toString();

		// 2페이지 준비
		Thread thread = new Thread() {
			@Override
			public void run() {
				cri.setPage(2);
				System.out.println("------------ 키 값 : " + listKey +" ------------------");
				Map<String, Object> nextPageMap;
				
				try {
					int page = 2;
					nextPageMap = service.getList(cri, mber_sn);
					session.setAttribute("page", page);
					session.setAttribute("key", listKey);
					session.setAttribute(listKey, nextPageMap);
					System.out.println("--------------- 맵 사이즈 : " + nextPageMap.size() + " -----------------");
				} catch (SQLException e) {
					e.printStackTrace();
				} 
				
				System.out.println("----------- 2페이지 로딩 완료 ------------");
			}
		};
		thread.start();
		
		return mnv;
		
	}
	
	
	
	@RequestMapping("/registForm")
	public ModelAndView registForm(ModelAndView mnv) throws Exception {
		String url = "knowhow/regist";
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping(value = "/regist" , method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public String regist(KnowhowRegistCommand registReq,HttpServletRequest request, RedirectAttributes rttr) throws Exception{
		
		String url = "redirect:/knowhow/list.do";
		
		KnowhowVO knowhow = registReq.toKnowhowVO();
		System.out.println("test1:"+knowhow.getMber_sn());
		//knowhow.setKnh_title((String)request.getAttribute("XSSknh_title"));
		service.regist(knowhow);
		System.out.println(knowhow.getKnh_title());
		System.out.println(knowhow.getKnh_content());
		System.out.println(knowhow.getMber_sn());
		
		rttr.addFlashAttribute("from","regist");
		
		return url;
	}
	
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(int knh_no,ModelAndView mnv) throws Exception{
		String url="knowhow/modify";
		
		KnowhowVO knowhow = service.getKnowhowForModify(knh_no);
		
		mnv.addObject("knowhow",knowhow);
		mnv.setViewName(url);
		
		return mnv;
		
	}
	
	
	
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public String modifyPost(//KnowhowModifyCommand modifyReq,
								KnowhowVO knowhow,
						     HttpServletRequest request,
							 RedirectAttributes rttr)throws Exception{
		String url = "knowhow/modify_success";
		
		
		service.modify(knowhow);
		
		
		return url;
	}
	
	
	@RequestMapping(value="/remove",method=RequestMethod.GET)
	public String remove(int knh_no,RedirectAttributes rttr) throws Exception{
		String url="redirect:/knowhow/list.do";
		
		service.remove(knh_no);
		
		rttr.addFlashAttribute("from","remove");
		rttr.addAttribute("knh_no",knh_no);
		
		return url;
	}
	
	@RequestMapping(value="/{knh_no}/{page}", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> knowhowReplyList(@PathVariable("knh_no") int knh_no, @PathVariable("page") int page)
																			throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		
		SearchCriteria cri = new SearchCriteria();
		cri.setPage(page);
		
		
		try {
			Map<String, Object> replyDataMap = replyService.getAsyncioReplyList(knh_no, cri);
			entity = new ResponseEntity<Map<String,Object>>(replyDataMap,HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}

	@RequestMapping(value="/{page}", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> nextPageList(@PathVariable("page") int page, HttpSession session) throws Exception{
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String mber_sn = member.getMber_sn();
		ResponseEntity<Map<String, Object>> entity = null;
		SearchCriteria cri = new SearchCriteria();
		page += 1;
		String key = (String) session.getAttribute("key");
		int sessionPage = (int) session.getAttribute("page");
		
		// 1번 비교 : 세션 페이지 값과 실제 다음 페이지 번호가 같을 때 DB연동을 하지 않고 세션에 있는 Map 사용
		// 2번 비교 : 세션에 다음 페이지의 맵의 키값이 존재 할 경우에 DB연동을 하지 않고 세션에 있는 Map 사용
		if((page == sessionPage) || (key != null || key == "")) {
			System.out.println("@@@@@@@@@@@@@@@@@@@  제대로 시작 합니다  @@@@@@@@@@@@@@@@@@@@");
			Map<String, Object> nextMap = (Map<String, Object>) session.getAttribute(key);
			System.out.println("@@@@@@@@@@@@@@@@@@@@@ 맵 사이즈 : " + nextMap.size() + " @@@@@@@@@@@@@@@@@@@@@@@@@");
			entity = new ResponseEntity<Map<String, Object>>(nextMap, HttpStatus.OK);
		} else {
			cri.setPage(page);
			
			try {
				Map<String, Object> dataMap = service.getList(cri, mber_sn);
				dataMap.put("page", page);
				entity = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
			} catch (SQLException e) {
				e.printStackTrace();
				entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
		}
		
		Thread thread = new Thread() {
			@Override
			public void run() {
				String key = UUID.randomUUID().toString();
				int page = (int) session.getAttribute("page");
				page += 1;
				cri.setPage(page);
				System.out.println("------------ 키 값 : " + key +" ------------------");
				Map<String, Object> nextPageMap;
				try {
					nextPageMap = service.getList(cri, mber_sn);
					
					String sessionKey = (String) session.getAttribute("key");
					session.removeAttribute("page");
					session.removeAttribute(sessionKey);
					session.removeAttribute("key");
					session.setAttribute("key", key);
					session.setAttribute("page", page);
					session.setAttribute(key, nextPageMap);
					System.out.println("--------------- 맵 사이즈 : " + nextPageMap.size() + " -----------------");
				} catch (SQLException e) {
					e.printStackTrace();
				} 
				System.out.println("----------- "+page+" 페이지 로딩 완료 ------------");
			}
		};
		thread.start();
		
		
		return entity;
	}
	
	@RequestMapping("/like")
	public ResponseEntity<Integer> likeClick(int knh_no, String mber_sn, int likeCnt) {
		ResponseEntity<Integer> entity = null;
		KnowhowVO knowhow = new KnowhowVO();
		knowhow.setKnh_no(knh_no);
		knowhow.setMber_sn(mber_sn);
		try {
			int exist = service.getLikeExist(knowhow);
			if(exist == 1) {
				service.cancleLike(knowhow);
				likeCnt -= 1;
			} else {
				service.likeKnowhow(knowhow);
				likeCnt += 1;
			}
			entity = new ResponseEntity<Integer>(likeCnt, HttpStatus.OK);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return entity;
	}
	
}
