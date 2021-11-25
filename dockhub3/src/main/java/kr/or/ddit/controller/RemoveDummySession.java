package kr.or.ddit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;


@Component("removeDummySession")
public class RemoveDummySession {
	
	@Scheduled(fixedDelay=5000)
	public void removeDummySession() {
//		System.out.println("------------- 더미 세션 지우기 시작 -------------");
		/*System.out.println("--------키 값 : " + session.getAttribute("key") + " ---------");
		String sessionKey = (String) session.getAttribute("key");
		System.out.println("-------- 맵 존재? : " + session.getAttribute(sessionKey) + " ----------" );
		System.out.println("-------- 페이지 값 : " + session.getAttribute("page") + " ----------" );
		session.removeAttribute("key");
		session.removeAttribute("page");
		session.removeAttribute(sessionKey);*/
//		System.out.println("------------- 더미 세션 지우기 완료 -------------");
		
	}
}
