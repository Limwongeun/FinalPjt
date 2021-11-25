package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.dto.GroupInviteVO;

public interface GroupInviteService {
	
	//리스트 조회
	Map<String, Object> getInviteList(int mber_sn) throws SQLException;
	
	//초대 응답
	void inviteResponse(GroupInviteVO group) throws SQLException;
}
