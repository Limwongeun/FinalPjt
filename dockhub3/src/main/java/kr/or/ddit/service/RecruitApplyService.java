package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.RecruitApplyVO;

public interface RecruitApplyService {
	
	//내가 신청한 공고 목록
	List<RecruitApplyVO> myRecruitApplyList(String mber_sn) throws SQLException;
	
	//참여 신청을 위한 참여 신청 여부 조회
	int selectApplyByMberPrjct(RecruitApplyVO recruitApply) throws SQLException;
	
	//공고 참여 신청
	void insertRecruitApply(RecruitApplyVO recruitApply) throws SQLException;
	
	//내가 신청한 공고 목록 조회
	Map<String, Object> selectApplyRecruitList(String pblanc_sport_man_sn, SearchCriteria cri) throws SQLException;
	
	//내가 작성한 공고 신청자 목록 조회
	Map<String, Object> myRecruitApplyListByPblancSn(int pblanc_sn, SearchCriteria cri) throws SQLException;
	
	//내가 작성한 공고 면접 목록 조회
	Map<String, Object> recruitMeetingListByPblancSn(String mber_sn, SearchCriteria cri) throws SQLException;
	
	//내가 작성한 공고 면접 결과 목록 조회
	Map<String, Object> meetingResultList(String mber_sn, SearchCriteria cri) throws SQLException;
	
	//내가 신청한 면접 목록 조회
	Map<String, Object> applyMeetingListByMberSn(String mber_sn,SearchCriteria cri) throws SQLException;
	
	//내가 신청한 공고의 면접 결과 목록 조회
	Map<String, Object> myMeetingResultList(String mber_sn,SearchCriteria cri) throws SQLException;
	
	//공고 신청 내역 상세보기
	RecruitApplyVO selectApplyByPblancSportSn(int pblanc_sport_sn) throws SQLException;	
	
	// 서류 거절 업데이트
	void updateApplyRefuse(int pblanc_sport_sn)throws SQLException;
	
	//서류 합격 면접 시간 업데이트
	void updateMeetingTime(RecruitApplyVO recruitApply) throws SQLException;
	
	//면접 완료 상태 업데이트
	void updateMeetingEnd(int pblanc_sport_sn) throws SQLException;
	
	//면접 불합격 상태 업데이트
	void updateRefuseRecruit(int pblanc_sport_sn) throws SQLException;

	//면접 합격 상태 업데이트
	void updateAcceptRecruit(int pblanc_sport_sn) throws SQLException;
}
