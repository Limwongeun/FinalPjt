package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.ExclusionVO;
import kr.or.ddit.dto.ProjectUserVO;

public interface ProjectExclusionService {

	// 프로젝트 번호로 제외신청목록 조회
	List<ExclusionVO> selectPrjctExclReqst(int sn) throws SQLException;
	
	// 프로젝트 번호로 제외처리목록 조회
	List<ExclusionVO> selectPrjctExclProcess(int sn) throws SQLException;
	
	// 프로젝트 제외 수락 후 인수인계할 사람 조회
	List<ExclusionVO> selectProjectExclAcceptList(ExclusionVO exclusionVO) throws SQLException;
	
	// 프로젝트 제외신청 수락(인수인계기간 및 인수인계자 업데이트)
	void updateProjectExclAccep(ExclusionVO exclProject) throws SQLException;
	
	// 프로젝트 제외 반려 이유
	ExclusionVO updateProjectRefuseReason(ExclusionVO exclusionVO) throws SQLException;
	
	// 프로젝트 수락된 구성원 상세조회(PL기준)
	ExclusionVO selectProjectExclAcceptDetail(ExclusionVO user) throws SQLException;

	// 구성원일때 제외신청 상세화면
	List<ExclusionVO> selectPrjctExclProcessUser(ProjectUserVO author) throws SQLException;
	
	// 프로젝트 수락된 구성원 상세조회(구성원기준)
	ExclusionVO selectProjectExclAcceptUserDetail(ExclusionVO detail) throws SQLException;
	
	// 구성원일때 제외 신청이유
	ExclusionVO insertProjectExclReason(ExclusionVO exclUser) throws SQLException;
	
	// 구성원 제외 신청목록 상세화면
	ExclusionVO selectExclUserDetail(ExclusionVO detail) throws SQLException;
}
