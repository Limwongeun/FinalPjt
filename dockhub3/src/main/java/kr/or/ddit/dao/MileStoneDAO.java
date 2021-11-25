package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.IssueVO;
import kr.or.ddit.dto.MilestoneVO;

public interface MileStoneDAO {

	List<MilestoneVO> selectMilestoneCriteria(SearchCriteria cri, int prjct_sn) throws SQLException; 
	
	List<MilestoneVO> selectMilestoneCriteria2(SearchCriteria cri, int prjct_sn) throws SQLException;
	
	List<MilestoneVO> selectCloseIssue(int prjct_sn) throws SQLException;

	List<MilestoneVO> selectOpenIssue(int prjct_sn) throws SQLException;

//	int selectMilestoneCriteriaTotalCount(SearchCriteria cri, int prjct_sn) throws SQLException;
	int selectMilestoneCriteriaTotalCount(int prjct_sn) throws SQLException;
	int selectMilestoneCriteriaTotalCount2(int prjct_sn) throws SQLException;
	
//	int selectMilestoneCount(int mile_no) throws SQLException;
//	int selectMilestoneCount2(int mile_no) throws SQLException;
	
	
	MilestoneVO selectMilestoneBymile_no(MilestoneVO milestone) throws SQLException;
//	List<MilestoneVO> selectMilestoneBymile_no(SearchCriteria cri, int mile_no) throws SQLException;
	
//	void increaseViewCount(int mile_no) throws SQLException;
	
	void insertMilestone (MilestoneVO milestone) throws SQLException;
	
	void updateMilestone (MilestoneVO milestone) throws SQLException;
	
	void deleteMilestone (int mile_no) throws SQLException;

	void updateMileCode(int mile_no) throws SQLException;
	
	void updateMileCode2(int mile_no) throws SQLException;

	List<IssueVO> selectIssueList(int mile_no) throws SQLException;

	List<IssueVO> selectCloseList(int mile_no) throws SQLException;
	




		
	}
	
	
