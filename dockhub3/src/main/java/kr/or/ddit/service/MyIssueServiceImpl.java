package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.PageMaker;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dao.MyIssueDAO;
import kr.or.ddit.dto.IssueVO;

public class MyIssueServiceImpl implements MyIssueService {
	
	private MyIssueDAO myIssueDAO;
	public void setMyIssueDAO(MyIssueDAO myIssueDAO) {
		this.myIssueDAO = myIssueDAO;
	}
	
	
	@Override
	public Map<String, Object> selectIssueByMber_sn(int mber_sn, SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<IssueVO> issueList = myIssueDAO.selectIssueByMber_sn(mber_sn,cri);
		
		//카운트
		int cnt = myIssueDAO.issueCnt(mber_sn);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(cnt);
		
		dataMap.put("issueList", issueList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}


	@Override
	public Map<String, Object> selectIssueCloseByMber_sn(int mber_sn, SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<IssueVO> issueList = myIssueDAO.selectIssueCloseByMber_sn(mber_sn,cri);
		
		//카운트
		int cnt = myIssueDAO.issueCloseCnt(mber_sn);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(cnt);
		
		dataMap.put("issueList", issueList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}



//	@Override
//	public Map<String, Object> selectDutyCharge(String mber_sn) throws SQLException {
//		Map<String, Object> issueMap = new HashMap<String, Object>();
//		
//		List<IssueVO> dutyChargeList = myIssueDAO.selectDutyCharge(mber_sn);
//		
//		issueMap.put("dutyChargeList",dutyChargeList);
//		return issueMap;
//	}
//
//
//	@Override
//	public Map<String, Object> selectMileStoneList(String mber_sn) throws SQLException {
//		Map<String, Object> mileMap = new HashMap<String, Object>();
//		
//		List<IssueVO> mileList = myIssueDAO.selectMileStoneList(mber_sn);
//		mileMap.put("mileList",mileList);
//		
//		return mileMap;
//	}
//
//
//	@Override
//	public void registIssue(IssueVO issue) throws SQLException {
//		myIssueDAO.registIssue(issue);
//	}
	

}
