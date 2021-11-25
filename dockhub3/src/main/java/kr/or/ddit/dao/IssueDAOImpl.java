package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.IssueVO;

public class IssueDAOImpl implements IssueDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<IssueVO> selectIssueByPrjctSn(int prjct_sn, SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<IssueVO> issueList = session.selectList("Issue-Mapper.selectIssueByPrjctSn",prjct_sn,rowBounds);
		return issueList;
	}

	@Override
	public int issueCnt(int prjct_sn) throws SQLException {
		return session.selectOne("Issue-Mapper.selectCnt", prjct_sn);
	}

	@Override
	public List<IssueVO> selectIssueCloseByPrjctSn(int prjct_sn, SearchCriteria cri) throws SQLException{
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<IssueVO> issueList = session.selectList("Issue-Mapper.selectIssueCloseByPrjctSn",prjct_sn,rowBounds);
		return issueList;
	}

	@Override
	public int issueCloseCnt(int prjct_sn) throws SQLException {
		return session.selectOne("Issue-Mapper.selectCloseCnt", prjct_sn);
	}

	@Override
	public List<IssueVO> selectDutyCharge(String prjct_sn) throws SQLException {
		List<IssueVO> dutyChargeList = session.selectList("Issue-Mapper.selectDutyCharge",prjct_sn);
		return dutyChargeList;
	}

	@Override
	public void registIssue(IssueVO issue) throws SQLException {
		try {
			session.update("Issue-Mapper.registIssue",issue);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<IssueVO> selectMileStoneList(String prjct_sn) throws SQLException {
		return session.selectList("Issue-Mapper.selectMileStoneList", prjct_sn);
	}
	
	
	@Override
	public List<String> getIssueStatus(int prjct_sn) throws SQLException {
		return session.selectList("Issue-Mapper.getIssueStatus", prjct_sn);
	}
	
	@Override
	public List<String> getMberIssueStatus(String mber_sn) throws SQLException {
		return session.selectList("Issue-Mapper.getMberIssueStatus", mber_sn);
	}
	@Override
	public IssueVO getDetailIssue(IssueVO issue) throws SQLException {
		IssueVO detailIssue = session.selectOne("Issue-Mapper.getDetailIssue", issue);
		return detailIssue;
	}

	@Override
	public void updateIssue(IssueVO issue) throws SQLException {
		session.update("Issue-Mapper.updateIssue", issue);
	}

	@Override
	public void deleteIssue(IssueVO issue) throws SQLException{
		session.delete("Issue-Mapper.deleteIssue", issue);
	}
	
	@Override
	public void endIssue(IssueVO issue) throws SQLException{
		session.update("Issue-Mapper.endIssue", issue);
	}

	@Override
	public void reIssue(IssueVO issue) throws SQLException {
		session.update("Issue-Mapper.reIssue", issue);
		
	}

}
