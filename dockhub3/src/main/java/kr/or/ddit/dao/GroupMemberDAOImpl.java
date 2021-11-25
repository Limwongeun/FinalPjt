package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.GroupMemberVO;

public class GroupMemberDAOImpl implements GroupMemberDAO{
	
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public void insertChief(GroupMemberVO groupMember) throws SQLException {
		session.update("Group-Mapper.insertGroupChief",groupMember);
		
	}
	
	@Override
	public List<GroupMemberVO> selectChief(SearchCriteria cri) throws SQLException {

		List<GroupMemberVO> chiefList = session.selectList("Group-Mapper.selectChief",cri);
		return chiefList;
	}
	
	@Override
	public int getSeqNextValue() throws SQLException {
		// TODO Auto-generated method stub
		int group_member_no = session.selectOne("Group-Mapper.selectGroupMemberNext");
		return group_member_no;

	}

}
