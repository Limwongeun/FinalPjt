package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.GroupInviteDAO;
import kr.or.ddit.dto.GroupInviteVO;

public class GroupInviteServiceImpl implements GroupInviteService {
	
	private GroupInviteDAO groupInviteDAO;
	public void setGroupInviteDAO(GroupInviteDAO groupInviteDAO) {
		this.groupInviteDAO = groupInviteDAO;
	}
	
	@Override
	public Map<String, Object> getInviteList(int mber_sn) throws SQLException {
		Map<String, Object> inviteMap =new HashMap<String, Object>();
		
		List<GroupInviteVO> inviteList = groupInviteDAO.selectGroupInviteList(mber_sn);
		System.out.println(inviteList+"inviteList테스트");
		inviteMap.put("inviteList", inviteList);
		
		return inviteMap;
	}

	@Override
	public void inviteResponse(GroupInviteVO group) throws SQLException {
		groupInviteDAO.inviteResponse(group);
		int group_invite_sn = group.getGroup_invite_sn();
		String group_invite_sttus = group.getGroup_invite_sttus();
		if(group_invite_sttus.equals("1")) {
			GroupInviteVO insertVO = groupInviteDAO.getGroupInvite(group_invite_sn);
			groupInviteDAO.insertInviteUser(insertVO);
		}
	}
}
