package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.command.PageMaker;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.KnowhowReplyVO;

public interface KnowhowReplyService {

	//리스트 
	Map<String, Object> getKnowhowReplyList (SearchCriteria cri) throws SQLException;
	
	Map<String, Object> getAsyncioReplyList (int knh_no, SearchCriteria cri) throws SQLException;
	
	PageMaker getPageMaker(int knh_no, SearchCriteria cri) throws Exception;
	
	// 리스트 개수
	int getKnowhowReplListCount(int knh_no) throws SQLException;
	
	//등록
	Map<String, Object> registKnowhowReply(KnowhowReplyVO reply, SearchCriteria cri) throws SQLException;
	
	// 수정
	Map<String, Object> modifyKnowhowReply(KnowhowReplyVO reply, SearchCriteria cri) throws SQLException;
	
	// 삭제
	Map<String, Object> removeKnowhowReply(KnowhowReplyVO reply, SearchCriteria cri) throws SQLException;
}
