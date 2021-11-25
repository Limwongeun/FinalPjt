package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.IssueVO;

public class MyIssueDAOImpl implements MyIssueDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<IssueVO> selectIssueByMber_sn(int mber_sn, SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<IssueVO> issueList = session.selectList("MyIssue-Mapper.selectIssueByMber_sn",mber_sn,rowBounds);
		return issueList;
	}
	
	@Override
	public int issueCnt(int mber_sn) throws SQLException {
		return session.selectOne("MyIssue-Mapper.selectCnt", mber_sn);
	}
	
	@Override
	public List<IssueVO> selectIssueCloseByMber_sn(int mber_sn, SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<IssueVO> issueList = session.selectList("MyIssue-Mapper.selectIssueCloseByMber_sn",mber_sn,rowBounds);
		return issueList;
	}
	
	@Override
	public int issueCloseCnt(int mber_sn) throws SQLException {
		return session.selectOne("MyIssue-Mapper.selectCloseCnt", mber_sn);
	}


//	@Override
//	public List<IssueVO> selectDutyCharge(String mber_sn) throws SQLException {
//		List<IssueVO> dutyChargeList = session.selectList("MyIssue-Mapper.selectDutyCharge",mber_sn);
//		return dutyChargeList;
//	}
//
//	@Override
//	public List<IssueVO> selectMileStoneList(String mber_sn) throws SQLException {
//		return session.selectList("MyIssue-Mapper.selectMileStoneList", mber_sn);
//	}
//
//	@Override
//	public void registIssue(IssueVO issue) throws SQLException {
//		try {
//			session.update("MyIssue-Mapper.registIssue",issue);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
	
}