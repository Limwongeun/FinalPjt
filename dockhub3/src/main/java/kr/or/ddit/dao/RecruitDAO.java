package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.ProjectVO;
import kr.or.ddit.dto.RecruitVO;

public interface RecruitDAO {

	List<RecruitVO> selectRecruitCriteria(SearchCriteria cri) throws SQLException; 

	List<RecruitVO> selectRecruitCriteria2(SearchCriteria cri) throws SQLException;

	List<RecruitVO> selectRecruitCriteria3(SearchCriteria cri) throws SQLException;
	
	int selectRecruitCriteriaTotalCount(SearchCriteria cri) throws SQLException;
	
	RecruitVO selectRecruitBypblanc_sn(int pblanc_sn) throws SQLException;
	
	void increaseViewCount(int pblanc_sn) throws SQLException;
	
	void insertRecruit (RecruitVO recruit) throws SQLException;
	
	public List<ProjectVO> selectProjectByMbersnList (String mber_sn) throws SQLException;
	
	void updateRecruit (RecruitVO recruit) throws SQLException;
	
	void deleteRecruit (int pblanc_sn) throws SQLException;
	
	//시퀀스
	int getSeqNextValue() throws SQLException;
	
	// 내가 작성한 공고 목록 조회
	List<RecruitVO> selectMyRecruitList(String pblanc_wrter, SearchCriteria cri) throws SQLException; 
	
	//내가 작성한 공고 목록 갯수 조회
	int selectMyRecruitCnt(String pblanc_wrter) throws SQLException;


}
