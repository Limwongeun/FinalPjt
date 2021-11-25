package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.ProjectInviteVO;

public interface ProjectInviteService {

	//프로젝트 초대 대기상태인 사람조회
	List<ProjectInviteVO> getProjectInvite(int sn, String prjct_invite_sttus) throws SQLException;
	
	//프로젝트 초대 거절상태인 사람조회
	List<ProjectInviteVO> getProjectInviteRefuse(int sn, String prjct_invite_sttus) throws SQLException;

	//프로젝트 프로필 조회
	ProjectInviteVO selectProjectProfile(ProjectInviteVO projectInviteVO) throws SQLException;

	//프로젝트 초대할 사람 조회
	List<ProjectInviteVO> selectProjectInviteUser(ProjectInviteVO projectInviteVO, SearchCriteria cri) throws SQLException;
	
	//프로젝트 초대
	void insertPjtUser(ProjectInviteVO project) throws SQLException;

	//초대 목록 조회
	List<ProjectInviteVO> getInviteByMberSn(String mber_sn) throws SQLException;	
	
	//초대 응답
	void inviteResponse(ProjectInviteVO project) throws SQLException;
	
	//프로젝트초대할 유저 건수
	int selectProjectInviteUserCnt(ProjectInviteVO project) throws SQLException;
}
