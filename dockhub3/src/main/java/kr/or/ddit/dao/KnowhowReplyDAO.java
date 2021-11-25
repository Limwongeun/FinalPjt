package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.KnowhowReplyVO;

public interface KnowhowReplyDAO {

	
	void insertKnowhowReply(KnowhowReplyVO reply) throws SQLException;
	
	List<KnowhowReplyVO> selectKnowhowReplyList(SearchCriteria cri) throws SQLException;

	List<KnowhowReplyVO> selectKnowhowAsyncioReplyList(int knh_no, SearchCriteria cri) throws SQLException;
	
	int selectKnowhowReplySeq() throws SQLException;
	
	int countKnowhowReply(int knh_no) throws SQLException;
	
	void updateKnowhowReply(KnowhowReplyVO reply) throws SQLException;
	
	void deleteKnowhowReply(int knowhow_reply_no) throws SQLException;
}
