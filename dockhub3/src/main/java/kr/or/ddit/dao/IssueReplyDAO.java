package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.IssueReplyVO;
import kr.or.ddit.dto.IssueVO;

public interface IssueReplyDAO {
	
	//리스토보기
	List<IssueReplyVO> selectReplyListPage(int issue_sn, SearchCriteria cri) throws SQLException;

	int countReply(int issue_sn) throws SQLException;
	
	//시퀀스
	int selectReplySeqNextValue() throws SQLException;
	
	//등록
	void insertReply(IssueReplyVO reply) throws SQLException;
	
	//수정
	void updateReply(IssueReplyVO reply) throws SQLException;
	
	//등록
	void deleteReply(int issue_reply_no) throws SQLException;

	
}
