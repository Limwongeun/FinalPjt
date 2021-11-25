package kr.or.ddit.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.josephoconnell.html.HTMLInputFilter;

import kr.or.ddit.command.IssueReplyModifyCommand;
import kr.or.ddit.command.IssueReplyRegistCommand;
import kr.or.ddit.command.PageMaker;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.IssueReplyVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.service.IssueReplyService;

@RestController
@RequestMapping("/replies")
public class IssueReplyController {

	@Autowired
	IssueReplyService service;
	
	@RequestMapping(value="/{issue_sn}/{page}", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> knowhowReplyList(@PathVariable("issue_sn") int issue_sn, @PathVariable("page") int page) throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		SearchCriteria cri = new SearchCriteria();
		cri.setPage(page);
		
		try {
			Map<String, Object> dataMap = service.getReplyList(issue_sn, cri);
			entity = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody IssueReplyRegistCommand replyReq, HttpSession session)	
														throws Exception {
		
		ResponseEntity<String> entity=null;
		
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		IssueReplyVO reply = replyReq.toIssueReplyVO();
		reply.setMber_sn(member.getMber_sn());
		reply.setIssue_reply_content(HTMLInputFilter.htmlSpecialChars(reply.getIssue_reply_content()));
		try {
			service.registReply(reply);

			SearchCriteria cri = new SearchCriteria();

			Map<String, Object> dataMap = service.getReplyList(reply.getIssue_sn(),cri);
			PageMaker pageMaker = (PageMaker) dataMap.get("pageMaker");
			int realEndPage = pageMaker.getRealEndPage();

			entity = new ResponseEntity<String>(realEndPage+"",HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),
					HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
		
	}
	
	@RequestMapping(value = "/{issue_reply_no}", method = { RequestMethod.PUT,RequestMethod.PATCH })
	public ResponseEntity<String> modify(@PathVariable("issue_reply_no") int issue_reply_no,
										 @RequestBody IssueReplyModifyCommand modifyReq)
												 					throws Exception {
		ResponseEntity<String> entity = null;
		
		IssueReplyVO reply = modifyReq.toIssueReplyVO();
		reply.setIssue_reply_no(issue_reply_no);
		System.out.println("111111111111111111111" + reply.getIssue_reply_no());
		System.out.println("222222222222222222222" + modifyReq.getIssue_reply_content());
		try {
			service.modifyReply(reply);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		
		return entity;
	}
	@RequestMapping(value="/{issue_sn}/{issue_reply_no}/{page}",method=RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("issue_reply_no") int issue_reply_no,
										 @PathVariable("issue_sn") int issue_sn,
										 @PathVariable("page") int page) throws Exception{
		
		ResponseEntity<String> entity=null;
		
		try{
			service.removeReply(issue_reply_no);
			
			SearchCriteria cri= new SearchCriteria();
						
			Map<String,Object> dataMap=service.getReplyList(issue_sn, cri);
			PageMaker pageMaker = (PageMaker)dataMap.get("pageMaker");
			
			int realEndPage=pageMaker.getRealEndPage();
			if(page>realEndPage){page=realEndPage;}
			
			
			entity=new ResponseEntity<String>(""+page,HttpStatus.OK);
		}catch(SQLException e){
			e.printStackTrace();
			entity=new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
}
