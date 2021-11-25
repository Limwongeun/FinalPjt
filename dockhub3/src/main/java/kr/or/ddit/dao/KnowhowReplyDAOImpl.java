package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.KnowhowReplyVO;

public class KnowhowReplyDAOImpl implements KnowhowReplyDAO{

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public void insertKnowhowReply(KnowhowReplyVO reply) throws SQLException {
		
		session.update("KnowhowReply-Mapper.insertKnowhowReply", reply);
		
	}

	@Override
	public List<KnowhowReplyVO> selectKnowhowReplyList(SearchCriteria cri) throws SQLException {
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<KnowhowReplyVO> knowhowReplyList = session.selectList("KnowhowReply-Mapper.selectKnowhowReplyList", rowBounds);
		
		return knowhowReplyList;
	}

	@Override
	public int selectKnowhowReplySeq() throws SQLException {
		int knowhow_reply_no = session.selectOne("KnowhowReply-Mapper.selectReplySeqNextValue");
		return knowhow_reply_no;
	}

	@Override
	public int countKnowhowReply(int knh_no) throws SQLException {
		int count = session.selectOne("KnowhowReply-Mapper.countKnowohowReply",knh_no);
		return count;
	}

	@Override
	public List<KnowhowReplyVO> selectKnowhowAsyncioReplyList(int knh_no, SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<KnowhowReplyVO> asyncioReplyList = session.selectList("KnowhowReply-Mapper.selectKnowhowAsyncioReplyList", knh_no, rowBounds);
		return asyncioReplyList;
	}

	@Override
	public void updateKnowhowReply(KnowhowReplyVO reply) throws SQLException {
		session.update("KnowhowReply-Mapper.updateKnowhowReply", reply);
	}

	@Override
	public void deleteKnowhowReply(int knowhow_reply_no) throws SQLException {
		session.update("KnowhowReply-Mapper.deleteKnowhowReply", knowhow_reply_no);
	}

}
