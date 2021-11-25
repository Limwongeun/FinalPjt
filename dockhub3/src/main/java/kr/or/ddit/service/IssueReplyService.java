package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.IssueReplyVO;

public interface IssueReplyService {
	
	//리스트보기
	Map<String,Object> getReplyList(int issue_sn,SearchCriteria cri)throws SQLException;

	//리스트 개수
	int getReplyListCount(int issue_sn)throws SQLException;
	
	//등록
	void registReply(IssueReplyVO reply)throws SQLException;
	
	//수정
	void modifyReply(IssueReplyVO reply) throws SQLException;
	
	//삭제
	void removeReply(int issue_reply_no) throws SQLException;
	
}
