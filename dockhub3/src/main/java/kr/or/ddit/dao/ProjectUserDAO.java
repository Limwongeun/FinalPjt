package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import com.sun.org.apache.bcel.internal.generic.RETURN;

import kr.or.ddit.dto.ProjectUserVO;

public interface ProjectUserDAO {

	//프로젝트 번호로 구성원 조회
	List<ProjectUserVO> getProjectUser(int sn) throws SQLException;

	//구성원탭에서 프로젝트 권한조회
	String getProjectUserAuthor(ProjectUserVO author) throws SQLException;
	
	//프로젝트 프로필에서 권한 업데이트
	ProjectUserVO updateUserAuthorChange(ProjectUserVO project) throws SQLException;
	
	//대시보드에서 구성원 및 진척도
	List<ProjectUserVO> getDashUserByPrjct(int prjct_sn) throws SQLException;
	
	// 프로젝트 참여를 위해 참여 여부 확인
	int selectUserByMberPrjct(ProjectUserVO project) throws SQLException;
	
	// 면접 합격시 프로젝트 유저로 등록
	void insertRecruitUser(int pblanc_sport_sn) throws SQLException;
	
//	//프로젝트에 해당하는 구성원 목록
//	List<ProjectUserVO> selectUserForPrjctSn(int prjct_sn) throws SQLException;
	
	//userSn가져오기
	int selectUserSnByMberPrjct(ProjectUserVO user) throws SQLException;
}	







