package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.GroupInviteVO;

public class GroupInviteDAOImpl implements GroupInviteDAO {

	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<GroupInviteVO> selectGroupInviteList(int mber_sn) throws SQLException {
		
		List<GroupInviteVO> inviteList = session.selectList("GroupInvite-Mapper.selectInviteList",mber_sn);
		return inviteList;
	}
	
	@Override
	public void inviteResponse(GroupInviteVO group) throws SQLException {
		session.update("GroupInvite-Mapper.inviteResponse",group);
	}
	
	@Override
	public void insertInviteUser(GroupInviteVO group) throws SQLException {
		session.insert("GroupInvite-Mapper.insertInviteUser",group);
	}
	
	@Override
	public GroupInviteVO getGroupInvite(int group_invite_sn) throws SQLException {
		return session.selectOne("GroupInvite-Mapper.getGroupInvite",group_invite_sn);
	}
}
