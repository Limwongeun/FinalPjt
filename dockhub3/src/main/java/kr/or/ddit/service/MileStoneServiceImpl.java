package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.PageMaker;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dao.IssueDAO;
import kr.or.ddit.dao.MileStoneDAO;
import kr.or.ddit.dto.IssueVO;
import kr.or.ddit.dto.MilestoneVO;

public class MileStoneServiceImpl implements MileStoneService {
	private MileStoneDAO mileStoneDAO;
	private IssueDAO issueDAO;
	
	public void setMileStoneDAO(MileStoneDAO mileStoneDAO) {
		this.mileStoneDAO = mileStoneDAO;
	}
	
	@Override
	public Map<String, Object> getMileStoneList(int prjct_sn, SearchCriteria cri) throws SQLException {
		
		cri.setPerPageNum(5);
		List<MilestoneVO> milestoneList = mileStoneDAO.selectMilestoneCriteria(cri, prjct_sn);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
//		pageMaker.setTotalCount(mileStoneDAO.selectMilestoneCriteriaTotalCount(cri));
		pageMaker.setTotalCount(mileStoneDAO.selectMilestoneCriteriaTotalCount(prjct_sn));
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("milestoneList", milestoneList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> getMileStoneList2(int prjct_sn, SearchCriteria cri) throws SQLException {
		cri.setPerPageNum(5);
		List<MilestoneVO> milestoneList2 = mileStoneDAO.selectMilestoneCriteria2(cri, prjct_sn);
		PageMaker pageMaker2 = new PageMaker();
		pageMaker2.setCri(cri);
//		pageMaker.setTotalCount(mileStoneDAO.selectMilestoneCriteriaTotalCount(cri));
		pageMaker2.setTotalCount(mileStoneDAO.selectMilestoneCriteriaTotalCount2(prjct_sn));
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("milestoneList2", milestoneList2);
		dataMap.put("pageMaker2", pageMaker2);
		
		return dataMap;
	}
	
	
	
	@Override
	public MilestoneVO getMileston(MilestoneVO milestone) throws SQLException {
		MilestoneVO board = mileStoneDAO.selectMilestoneBymile_no(milestone);
//		mileStoneDAO.increaseViewCount(mile_no);
		return board;
	}

	@Override
	public MilestoneVO getMilestoneForModify(MilestoneVO milestone) throws SQLException {
		MilestoneVO board = mileStoneDAO.selectMilestoneBymile_no(milestone);
		return board;
	}

	@Override
	public void regist(MilestoneVO milestone) throws SQLException {
		//int mile_no = mileStoneDAO.getSeqNextValue();
		
		//milestone.setMile_no(mile_no);
		mileStoneDAO.insertMilestone(milestone);
		
	}

	@Override
	public void modify(MilestoneVO milestone) throws SQLException {
		mileStoneDAO.updateMilestone(milestone);
//		System.out.println("수정완료!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
	}

	@Override
	public void remove(int mile_no) throws SQLException {
		mileStoneDAO.deleteMilestone(mile_no);
		
	}

	@Override
	public void modify2(int mile_no) throws SQLException {
		mileStoneDAO.updateMileCode(mile_no);
		
	}

	@Override
	public void modify3(int mile_no) throws SQLException {
		mileStoneDAO.updateMileCode2(mile_no);
		
	}

	@Override
	public List<MilestoneVO> getCloseList(int prjct_sn) throws SQLException {
		List<MilestoneVO> closeList = mileStoneDAO.selectCloseIssue(prjct_sn);
		return closeList;
	}

	@Override
	public List<MilestoneVO> getOpenList(int prjct_sn) throws SQLException {
		List<MilestoneVO> openList = mileStoneDAO.selectOpenIssue(prjct_sn);
		return openList;
	}

	@Override
	public List<IssueVO> getIssueList(int mile_no) throws SQLException {
		List<IssueVO> issueList = mileStoneDAO.selectIssueList(mile_no);
		return issueList;
	}

	@Override
	public List<IssueVO> getCloseIssueList(int mile_no) throws SQLException {
		List<IssueVO> closeList = mileStoneDAO.selectCloseList(mile_no);
		return closeList;
	}

//	@Override
//	public IssueVO getIssueList(int mil_no) throws SQLException {
//		IssueVO list = mileStoneDAO.selectIssue(issue);
//		return list;
//	}
	
	
	

//	@Override
//	public int getMileStoneCount(int mile_no) throws SQLException {
//		int count = mileStoneDAO.selectMilestoneCount(mile_no);
//		return count;
//
//	}
//	@Override
//	public int getMileStoneCount2(int mile_no) throws SQLException {
//		int count = mileStoneDAO.selectMilestoneCount2(mile_no);
//		return count;
//		
//	}


	
	

}
