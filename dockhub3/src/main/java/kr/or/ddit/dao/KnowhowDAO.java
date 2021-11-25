package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.KnowhowVO;

public interface KnowhowDAO {

	List<KnowhowVO> selectKnowhowCriteria(SearchCriteria cri) throws SQLException;
	
	int selectKnowhowCriteriaTotalCount(SearchCriteria cri) throws SQLException;
	
	void insertKnowhow (KnowhowVO knowhow)throws SQLException;

	//시퀀스
	int getSeqNextValue() throws SQLException;
	
	void updateKnowhow(KnowhowVO knowhow) throws SQLException;
	
	void deleteKnowhow(int knh_no) throws SQLException;
	
	KnowhowVO selectknowhowByKnh_no(int knh_no) throws SQLException;
	
	int getLikeExist(KnowhowVO knowhow) throws SQLException;
	
	void likeKnowhow(KnowhowVO knowhow) throws SQLException;
	
	void cancleLike(KnowhowVO knowhow) throws SQLException;
	
	void updateKnowhowLike(int knh_no) throws SQLException;
	
}
