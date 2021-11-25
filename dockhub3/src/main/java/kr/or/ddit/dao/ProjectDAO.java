package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.ProjectVO;

public interface ProjectDAO {
	//프로젝트 번호로 프로젝트 가져오기
	ProjectVO selectPrjctBySn(int sn) throws SQLException;
	
	//프로젝트 구성원 수 가져오기
	int selectUserCnt(int sn) throws SQLException;
	
	//프로젝트 권한 가져오기
	int selectPrjctAuthor(ProjectVO project) throws SQLException;
	
	//프로젝트 수정
	void updateProject(ProjectVO project) throws SQLException;
	
	//프로젝트 좋아요 여부 가져오기
	int getLike(ProjectVO project) throws SQLException;
	
	//프로젝트 좋아요 등록하기
	void likePrj(ProjectVO project) throws SQLException;
	
	//프로젝트 좋아요 취소하기
	void deletePrj(ProjectVO project) throws SQLException;
	
	//프로젝트 북마크 여부 가져오기
	int getMark(ProjectVO project) throws SQLException;
	
	//프로젝트 북마크 등록하기
	void markPrj(ProjectVO project) throws SQLException;
	
	//프로젝트 북마크 취소하기
	void deleteMarkPrj(ProjectVO project) throws SQLException;
	
	//프로젝트 진행률 가져오기
	ProjectVO getPro(int prjct_sn) throws SQLException;
	
	//개인이 진행하고 있는 프로젝트 가져오기
	List<ProjectVO> getMberProject(SearchCriteria cri, String mber_sn) throws SQLException;
//	List<ProjectVO> getMberProject(String mber_sn) throws SQLException;
	List<ProjectVO> getMberProject2(String mber_sn) throws SQLException;
	
	//개인 프로젝트 갯수 가져오기
	int mberPrjctCnt(String mber_sn) throws SQLException;
	
	//회원이 북마크한 프로젝트
	List<ProjectVO> getMarkProject(String mber_sn) throws SQLException;

	void registPrjct(ProjectVO project) throws SQLException;
	
	void insertPL() throws SQLException;
	void insertAA() throws SQLException;
	void insertTA() throws SQLException;
	void insertDA() throws SQLException;
	void insertUA() throws SQLException;
	void insertBA() throws SQLException;
	void insertAnuse() throws SQLException;
	void insertPrjctUser(String mber_sn) throws SQLException;
	
	//프로젝트 생성시 상위 폴더 생성
	void insertPrjctFile(ProjectVO project) throws SQLException;
	
	// 검색을 위한 프로젝트 목록
	List<String> getPrjctSjForSearch() throws SQLException; 
	
	//검색한 프로젝트 목록
	List<ProjectVO> selectSearchProjectList(SearchCriteria cri) throws SQLException;
	
	int selectSearchProjectListCount(SearchCriteria cri) throws SQLException;
}











