package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.GroupInviteVO;

public interface GroupInviteDAO {

	//받은 초대 조회
	List<GroupInviteVO> selectGroupInviteList(int mber_sn) throws SQLException;
	
	//초대 수락,거절 업데이트
	void inviteResponse(GroupInviteVO group) throws SQLException;
	
	// 초대수락시 projectUser에 추가
	void insertInviteUser(GroupInviteVO group) throws SQLException;
	
	// 그룹 초대 정보 가져오기
	GroupInviteVO getGroupInvite(int group_invite_sn) throws SQLException;


}
