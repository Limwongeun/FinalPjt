package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.IssueVO;
import kr.or.ddit.dto.MilestoneVO;

public interface MileStoneService {
	
	Map<String, Object> getMileStoneList(int prjct_sn,SearchCriteria cri) throws SQLException;

	Map<String, Object> getMileStoneList2(int prjct_sn,SearchCriteria cri) throws SQLException;
	
	List<MilestoneVO> getCloseList(int prjct_sn) throws SQLException;
	
	List<MilestoneVO> getOpenList(int prjct_sn) throws SQLException;
	
	MilestoneVO getMileston(MilestoneVO milestone) throws SQLException;
	
	MilestoneVO getMilestoneForModify(MilestoneVO milestone) throws SQLException; 
	
	void regist(MilestoneVO milestone) throws SQLException;
	
	void modify(MilestoneVO milestone) throws SQLException;
	
	void modify2(int mile_no) throws SQLException;
	
	void modify3(int mile_no) throws SQLException;
	
	void remove(int mile_no) throws SQLException;

	List<IssueVO> getIssueList(int mile_no) throws SQLException;

	List<IssueVO> getCloseIssueList(int mile_no) throws SQLException;
	
//	int getMileStoneCount(int mile_no)throws SQLException;
//
//	int getMileStoneCount2(int mile_no) throws SQLException;

	
}
