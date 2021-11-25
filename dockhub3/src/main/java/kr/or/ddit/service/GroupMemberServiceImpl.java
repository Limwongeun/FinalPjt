package kr.or.ddit.service;

import kr.or.ddit.dao.GroupMemberDAO;

public class GroupMemberServiceImpl implements GroupMemberService {

	private GroupMemberDAO groupMemberDAO;
	public void setGroupMemberDAO(GroupMemberDAO groupMemberDAO) {
		this.groupMemberDAO = groupMemberDAO;
	}
	
}
