package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.IssueVO;
import kr.or.ddit.dto.MilestoneVO;

public class MileStoneDAOImpl implements MileStoneDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	
	@Override
	public List<MilestoneVO> selectMilestoneCriteria(SearchCriteria cri, int prjct_sn) throws SQLException {
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit); 
		
		List<MilestoneVO> milestoneList = session.selectList("Milestone-Mapper.selectSearchMilestoneList",prjct_sn,rowBounds);
		
		return milestoneList;
	}
	
	@Override
	public List<MilestoneVO> selectMilestoneCriteria2(SearchCriteria cri, int prjct_sn) throws SQLException {
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit); 
		
		List<MilestoneVO> milestoneList2 = session.selectList("Milestone-Mapper.selectSearchMilestoneList2",prjct_sn,rowBounds);
		
		return milestoneList2;
	}
	
	@Override
	public int selectMilestoneCriteriaTotalCount(int prjct_sn) throws SQLException {
		int count = session.selectOne("Milestone-Mapper.selectSearchMilestoneListCount",prjct_sn);
		return count;

	}
//	@Override
//	public int selectMilestoneCriteriaTotalCount(SearchCriteria cri, int prjct_sn) throws SQLException {
//		int count = session.selectOne("Milestone-Mapper.selectSearchMilestoneListCount",cri);
//		return count;
//
//	}
//	@Override
//	public int selectMilestoneCount(int mile_no) throws SQLException {
//		int count = session.selectOne("Milestone-Mapper.selectCount",mile_no);
//		return count;
//		
//	}
//	
//	@Override
//	public int selectMilestoneCount2(int mile_no) throws SQLException {
//		int count = session.selectOne("Milestone-Mapper.selectCount2",mile_no);
//		return count;
//	}
//	
	@Override
	public MilestoneVO selectMilestoneBymile_no(MilestoneVO milestone1) throws SQLException {
//		MilestoneVO milestone=session.selectOne("Milestone-Mapper.selectMilestoneBymile_no",mile_no);
		MilestoneVO milestone=session.selectOne("Milestone-Mapper.selectMilestoneBymile_no",milestone1);
		return milestone;
	}
	@Override
	public void insertMilestone(MilestoneVO milestone) throws SQLException {
		session.insert("Milestone-Mapper.insertMilestone",milestone);
	}
	@Override
	public void updateMilestone(MilestoneVO milestone) throws SQLException {
		session.update("Milestone-Mapper.updateMilestone",milestone);
		
	}
	@Override
	public void deleteMilestone(int mile_no) throws SQLException {
		session.update("Milestone-Mapper.deleteMilestone",mile_no);
	}

	@Override
	public void updateMileCode(int mile_no) throws SQLException {
		session.update("Milestone-Mapper.updateMileCode",mile_no);
	}

	@Override
	public void updateMileCode2(int mile_no) throws SQLException {
		session.update("Milestone-Mapper.updateMileCode2",mile_no);
	}


	@Override
	public List<MilestoneVO> selectCloseIssue(int prjct_sn) throws SQLException {
		List<MilestoneVO> closeList = session.selectList("Milestone-Mapper.selectCloseIssue", prjct_sn);
		return closeList;
	}


	@Override
	public List<MilestoneVO> selectOpenIssue(int prjct_sn) throws SQLException {
		List<MilestoneVO> openList = session.selectList("Milestone-Mapper.selectOpenIssue", prjct_sn);
		return openList;
	}


	@Override
	public int selectMilestoneCriteriaTotalCount2(int prjct_sn) throws SQLException {
		int count = session.selectOne("Milestone-Mapper.selectSearchMilestoneListCount2",prjct_sn);
		return count;
	}


	@Override
	public List<IssueVO> selectIssueList(int mile_no) throws SQLException {
		List<IssueVO> issueList = session.selectList("Issue-Mapper.selectIssueList", mile_no);
		return issueList;
	}


	@Override
	public List<IssueVO> selectCloseList(int mile_no) throws SQLException {
		List<IssueVO> closeList = session.selectList("Issue-Mapper.selectCloseList", mile_no);
		return closeList;
	}





/*	@Override
	public void increaseViewCount(int mile_no) throws SQLException {
		session.update("Milestone-Mapper.increaseViewCount", mile_no);
		
	}*/


}
