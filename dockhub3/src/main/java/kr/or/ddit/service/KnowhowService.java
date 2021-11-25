package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.KnowhowVO;

public interface KnowhowService {

	//리스트 조회
	Map<String, Object> getList(SearchCriteria cri, String mber_sn) throws SQLException;
	
	//작성
	void regist(KnowhowVO knowhow) throws SQLException;
	
	//수정 상세
	KnowhowVO getKnowhowForModify(int knh_no) throws SQLException;
	
	// 수정
	void modify(KnowhowVO knowhow) throws SQLException;
	
	//삭제
	void remove(int knh_no) throws SQLException;
	
	int getLikeExist(KnowhowVO knowhow) throws SQLException;
	
	void likeKnowhow(KnowhowVO knowhow) throws SQLException;
	
	void cancleLike(KnowhowVO knowhow) throws SQLException;
	
}
