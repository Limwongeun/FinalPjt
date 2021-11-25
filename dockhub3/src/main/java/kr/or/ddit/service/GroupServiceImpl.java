package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.PageMaker;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dao.GroupDAO;
import kr.or.ddit.dao.GroupMemberDAO;
import kr.or.ddit.dto.GroupMemberVO;
import kr.or.ddit.dto.GroupVO;

public class GroupServiceImpl implements GroupService{

	private GroupDAO groupDAO;
	public void setGroupDAO(GroupDAO groupDAO) {
		this.groupDAO = groupDAO;
	}
	private GroupMemberDAO groupMemberDAO;
	public void setGroupMemberDAO(GroupMemberDAO groupMemberDAO) {
		this.groupMemberDAO = groupMemberDAO;
	}
	
	
	@Override
	public Map<String, Object> getMyGroupList(int mber_sn,SearchCriteria cri) throws SQLException {

		Map<String, Object> dataMap = new HashMap<String, Object>();
		cri.setMber_sn(String.valueOf( mber_sn ));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(groupDAO.selectGroupCriteriaTotalCount(mber_sn));
		
		List<GroupVO> groupList = groupDAO.selectMyGroupList(cri,mber_sn);
		List<GroupMemberVO> chiefList = groupMemberDAO.selectChief(cri);
		
		dataMap.put("groupList", groupList);
		dataMap.put("chiefList", chiefList);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("mber_sn", mber_sn);
		return dataMap;
	}
	
	@Override
	public void regist(GroupVO group) throws SQLException {

		int group_sn = groupDAO.getSeqNextValue();
		
		group.setGroup_sn(group_sn);
		groupDAO.insertGroup(group);
	
		int group_member_no = groupMemberDAO.getSeqNextValue();
		
		GroupMemberVO groupMember = new GroupMemberVO();
		
		groupMember.setGroup_sn(group_sn);
		groupMember.setMber_sn(group.getMber_sn());
		groupMember.setGroup_member_no(group_member_no);
		
		groupMemberDAO.insertChief(groupMember);
		
	}
}
