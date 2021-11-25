package kr.or.ddit.controller;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.command.ReplyModifyCommand;
import kr.or.ddit.command.ReplyRegistCommand;
import kr.or.ddit.command.ReplyRemoveCommand;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.KnowhowReplyVO;
import kr.or.ddit.service.KnowhowReplyService;

@RestController
@RequestMapping("/knowhowReplies")
public class KnowhowReplyController {

	@Autowired
	KnowhowReplyService service;
	
	@RequestMapping(value="/{knh_no}/{page}", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> knowhowReplyList(@PathVariable("knh_no") int knh_no, @PathVariable("page") int page)
																			throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		page += 1;
		SearchCriteria cri = new SearchCriteria();
		cri.setPage(page);
		
		try {
			Map<String, Object> dataMap = service.getAsyncioReplyList(knh_no, cri);
			entity = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> regist(@RequestBody ReplyRegistCommand cmd) throws Exception{
		System.out.println("ㅇㅇ");
		KnowhowReplyVO reply = cmd.toKnowhowReplyVO();
		int page = cmd.getPage();
		SearchCriteria cri = new SearchCriteria();
		cri.setPerPageNum(page * 5);
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			Map<String, Object> dataMap = service.registKnowhowReply(reply, cri);
			entity = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.PUT)
	public ResponseEntity<Map<String, Object>> modify(@RequestBody ReplyModifyCommand cmd) throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		
		KnowhowReplyVO reply = cmd.toKnowhowReplyVO();
		int page = cmd.getPage();
		SearchCriteria cri = new SearchCriteria();
		cri.setPerPageNum(page * 5);
		
		try {
			Map<String, Object> modifyData = service.modifyKnowhowReply(reply, cri);
			entity = new ResponseEntity<Map<String,Object>>(modifyData, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	@RequestMapping(value="/remove", method=RequestMethod.DELETE)
	public ResponseEntity<Map<String, Object>> remove(@RequestBody ReplyRemoveCommand cmd) throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		
		KnowhowReplyVO reply = cmd.toKnowhowReplyVO();
		int page = cmd.getPage();
		SearchCriteria cri = new SearchCriteria();
		cri.setPerPageNum(page * 5);
		
		try {
			Map<String, Object> removeData = service.removeKnowhowReply(reply, cri);
			entity = new ResponseEntity<Map<String,Object>>(removeData, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
}
