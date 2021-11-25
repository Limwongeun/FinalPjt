package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.GroupMemberVO;

public interface GroupMemberDAO {

	public void insertChief (GroupMemberVO groupMember) throws SQLException;

	//Chief 조회
	List<GroupMemberVO> selectChief(SearchCriteria cri) throws SQLException;
	
	//시퀀스
	int getSeqNextValue() throws SQLException;
}
