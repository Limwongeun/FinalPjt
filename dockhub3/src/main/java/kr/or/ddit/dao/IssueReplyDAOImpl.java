package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.IssueReplyVO;

public class IssueReplyDAOImpl implements IssueReplyDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<IssueReplyVO> selectReplyListPage(int issue_sn, SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<IssueReplyVO> replyList = session.selectList("IssueReply-Mapper.selectReplyList", issue_sn, rowBounds);
		return replyList;
	}

	@Override
	public int countReply(int issue_sn) throws SQLException {
		int count = session.selectOne("IssueReply-Mapper.countReply", issue_sn);
		return count;
	}

	@Override
	public int selectReplySeqNextValue() throws SQLException {
		int issue_reply_no = (Integer) session.selectOne("IssueReply-Mapper.selectReplySeqNextValue");
		return issue_reply_no;
	}

	@Override
	public void insertReply(IssueReplyVO reply) throws SQLException {
		session.update("IssueReply-Mapper.insertReply", reply);
	}

	@Override
	public void updateReply(IssueReplyVO reply) throws SQLException {
		session.update("IssueReply-Mapper.updateReply", reply);
	}

	@Override
	public void deleteReply(int issue_reply_no) throws SQLException {
		session.update("IssueReply-Mapper.deleteReply", issue_reply_no);
	}

}
