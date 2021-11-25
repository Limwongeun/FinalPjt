package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.GroupVO;

public interface GroupService {

	//리스트 조회
	Map<String, Object> getMyGroupList(int mber_sn,SearchCriteria cri) throws SQLException;
	
	//등록
	
	public void regist(GroupVO group) throws SQLException;
	
}
