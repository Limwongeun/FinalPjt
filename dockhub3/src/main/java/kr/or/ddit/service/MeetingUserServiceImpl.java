package kr.or.ddit.service;

import java.sql.SQLException;

import kr.or.ddit.dao.MeetingUserDAO;
import kr.or.ddit.dto.MeetingUserVO;

public class MeetingUserServiceImpl implements MeetingUserService{

	private MeetingUserDAO meetingUserDAO;
	public void setMeetingUserDAO(MeetingUserDAO meetingUserDAO) {
		this.meetingUserDAO = meetingUserDAO;
	}
	

}
