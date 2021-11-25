package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.PageMaker;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dao.RecruitApplyDAO;
import kr.or.ddit.dto.RecruitApplyVO;

public class RecruitApplyServiceImpl implements RecruitApplyService {

	private RecruitApplyDAO recruitApplyDAO;
	public void setRecruitApplyDAO(RecruitApplyDAO recruitApplyDAO) {
		this.recruitApplyDAO = recruitApplyDAO;
	}
	
	@Override
	public List<RecruitApplyVO> myRecruitApplyList(String mber_sn) throws SQLException {
		return recruitApplyDAO.myRecruitApplyList(mber_sn);
	}

	@Override
	public int selectApplyByMberPrjct(RecruitApplyVO recruitApply) throws SQLException {
		return recruitApplyDAO.selectApplyByMberPrjct(recruitApply);
	}

	@Override
	public void insertRecruitApply(RecruitApplyVO recruitApply) throws SQLException {
		recruitApplyDAO.insertRecruitApply(recruitApply);
	}

	@Override
	public Map<String, Object> selectApplyRecruitList(String pblanc_sport_man_sn, SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		cri.setPerPageNum(5);
		List<RecruitApplyVO> applyRecruitList = recruitApplyDAO.selectApplyRecruitList(pblanc_sport_man_sn, cri);
		
		int cnt = recruitApplyDAO.selectApplyRecruitCnt(pblanc_sport_man_sn);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(cnt);
				
		dataMap.put("applyRecruitList", applyRecruitList);
		dataMap.put("pageMaker", pageMaker);		
		return dataMap;
	}
	
	@Override
	public Map<String, Object> myRecruitApplyListByPblancSn(int pblanc_sn, SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		cri.setPerPageNum(5);
		List<RecruitApplyVO> myRecruitApplyList = recruitApplyDAO.myRecruitApplyListByPblancSn(pblanc_sn, cri);
		
		int cnt = recruitApplyDAO.myRecruitApplyListByPblancSnCnt(pblanc_sn);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(cnt);
				
		dataMap.put("myRecruitApplyList", myRecruitApplyList);
		dataMap.put("pageMaker", pageMaker);		
		return dataMap;
	}

	@Override
	public Map<String, Object> recruitMeetingListByPblancSn(String mber_sn, SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		cri.setPerPageNum(5);
		List<RecruitApplyVO> recruitMeetingList = recruitApplyDAO.recruitMeetingListByPblancSn(mber_sn, cri);
		
		int cnt = recruitApplyDAO.recruitMeetingListByPblancSnCnt(mber_sn);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(cnt);
				
		dataMap.put("recruitMeetingList", recruitMeetingList);
		dataMap.put("pageMaker", pageMaker);		
		return dataMap;
	}

	@Override
	public Map<String, Object> meetingResultList(String mber_sn, SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		cri.setPerPageNum(5);
		List<RecruitApplyVO> meetingResultList = recruitApplyDAO.meetingResultList(mber_sn, cri);
		
		int cnt = recruitApplyDAO.meetingResultListCnt(mber_sn);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(cnt);
				
		dataMap.put("meetingResultList", meetingResultList);
		dataMap.put("pageMaker", pageMaker);		
		return dataMap;
	}

	@Override
	public Map<String, Object> applyMeetingListByMberSn(String mber_sn, SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		cri.setPerPageNum(5);
		List<RecruitApplyVO> applyMeetingList = recruitApplyDAO.applyMeetingListByMberSn(mber_sn, cri);
		
		int cnt = recruitApplyDAO.applyMeetingListByMberSnCnt(mber_sn);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(cnt);
				
		dataMap.put("applyMeetingList", applyMeetingList);
		dataMap.put("pageMaker", pageMaker);		
		return dataMap;
	}

	@Override
	public Map<String, Object> myMeetingResultList(String mber_sn, SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		cri.setPerPageNum(5);
		List<RecruitApplyVO> myMeetingResultList = recruitApplyDAO.myMeetingResultList(mber_sn, cri);
		
		int cnt = recruitApplyDAO.myMeetingResultListCnt(mber_sn);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(cnt);
				
		dataMap.put("myMeetingResultList", myMeetingResultList);
		dataMap.put("pageMaker", pageMaker);		
		return dataMap;
	}
	@Override
	public RecruitApplyVO selectApplyByPblancSportSn(int pblanc_sport_sn) throws SQLException {
		return recruitApplyDAO.selectApplyByPblancSportSn(pblanc_sport_sn);
	}

	@Override
	public void updateApplyRefuse(int pblanc_sport_sn) throws SQLException {
		recruitApplyDAO.updateApplyRefuse(pblanc_sport_sn);
	}

	@Override
	public void updateMeetingTime(RecruitApplyVO recruitApply) throws SQLException {
		recruitApplyDAO.updateMeetingTime(recruitApply);
	}

	@Override
	public void updateMeetingEnd(int pblanc_sport_sn) throws SQLException {
		recruitApplyDAO.updateMeetingEnd(pblanc_sport_sn);
	}

	@Override
	public void updateRefuseRecruit(int pblanc_sport_sn) throws SQLException {
		recruitApplyDAO.updateRefuseRecruit(pblanc_sport_sn);
	}

	@Override
	public void updateAcceptRecruit(int pblanc_sport_sn) throws SQLException {
		recruitApplyDAO.updateAcceptRecruit(pblanc_sport_sn);
	}

	

}
