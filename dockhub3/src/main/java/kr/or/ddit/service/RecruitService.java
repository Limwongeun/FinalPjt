package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.RecruitVO;

public interface RecruitService {
	
	//리스트 조회
	Map<String, Object> getList(SearchCriteria cri) throws SQLException;
	
	Map<String, Object> getList2(SearchCriteria cri) throws SQLException;
	
	Map<String, Object> getList3(SearchCriteria cri) throws SQLException;
	//상세보기
	RecruitVO getRecruit(int pblanc_sn) throws SQLException;

	RecruitVO getRecruitForModify(int pblanc_sn) throws SQLException; 
	
	//프로젝트 조회
	Map<String, Object> getProject(String mber_sn) throws SQLException;
	
	void regist(RecruitVO recruit) throws SQLException;
	
	void modify(RecruitVO recruit) throws SQLException;
	
	void remove(int pblanc_sn) throws SQLException;
	
	// 내가 작성한 공고 목록 조회
	Map<String, Object> selectMyRecruitList(String pblanc_wrter, SearchCriteria cri) throws SQLException;


}
