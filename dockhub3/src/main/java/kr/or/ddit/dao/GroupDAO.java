package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.GroupVO;

public interface GroupDAO {

	//리스트 조회
	List<GroupVO> selectMyGroupList(SearchCriteria cri,int mber_sn) throws SQLException;
	
	//생성
	public void insertGroup (GroupVO group) throws SQLException;
	
	//그룹숫자
	int selectGroupCriteriaTotalCount(int mber_sn) throws SQLException;

	//시퀀스
	int getSeqNextValue() throws SQLException;
}
