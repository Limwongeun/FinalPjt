package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.PageMaker;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dao.IssueDAO;
import kr.or.ddit.dto.IssueVO;

public class IssueServiceImpl implements IssueService {
	
	private IssueDAO issueDAO;
	public void setIssueDAO(IssueDAO issueDAO) {
		this.issueDAO = issueDAO;
	}
	
	@Override
	public Map<String, Object> selectIssueByPrjctSn(int prjct_sn, SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<IssueVO> issueList = issueDAO.selectIssueByPrjctSn(prjct_sn,cri);
		
		//카운트
		int cnt = issueDAO.issueCnt(prjct_sn);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(cnt);
		
		dataMap.put("issueList", issueList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> selectIssueCloseByPrjctSn(int prjct_sn, SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<IssueVO> issueList = issueDAO.selectIssueCloseByPrjctSn(prjct_sn,cri);
		
		//카운트
		int cnt = issueDAO.issueCloseCnt(prjct_sn);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(cnt);
		
		dataMap.put("issueList", issueList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> selectDutyCharge(String prjct_sn) throws SQLException {
		Map<String, Object> issueMap = new HashMap<String, Object>();
		
		List<IssueVO> dutyChargeList = issueDAO.selectDutyCharge(prjct_sn);
		
		issueMap.put("dutyChargeList",dutyChargeList);
		return issueMap;
	}

	@Override
	public void registIssue(IssueVO issue) throws SQLException {
		issueDAO.registIssue(issue);
	}

	@Override
	public Map<String, Object> selectMileStoneList(String prjct_sn) throws SQLException {
		Map<String, Object> mileMap = new HashMap<String, Object>();
		
		List<IssueVO> mileList = issueDAO.selectMileStoneList(prjct_sn);
		mileMap.put("mileList",mileList);
		
		return mileMap;
	}
	
	@Override
	public List<String> getIssueStatus(int prjct_sn) throws SQLException {
		
		return issueDAO.getIssueStatus(prjct_sn);
	}

	@Override
	public IssueVO getDetailIssue(IssueVO issue) throws SQLException {
		IssueVO issueDetail = issueDAO.getDetailIssue(issue);
		return issueDetail;
	}

	@Override
	public void updateIssue(IssueVO issue) throws SQLException {
		issueDAO.updateIssue(issue);
	}

	@Override
	public void deleteIssue(IssueVO issue) throws SQLException {
		issueDAO.deleteIssue(issue);
	}

	@Override
	public void endIssue(IssueVO issue) throws SQLException{
		issueDAO.endIssue(issue);
	}

	@Override
	public void reIssue(IssueVO issue) throws SQLException {
		issueDAO.reIssue(issue);
		
	}

	@Override
	public List<String> getMberIssueStatus(String mber_sn) throws SQLException {
		return issueDAO.getMberIssueStatus(mber_sn);
	}

}
