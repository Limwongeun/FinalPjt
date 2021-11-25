package kr.or.ddit.command;

import kr.or.ddit.dto.MeetingUserVO;

public class MeetingUserRegistCommand {

	private int mtg_sn;
	private int user_sn;
	public int getMtg_sn() {
		return mtg_sn;
	}
	public void setMtg_sn(int mtg_sn) {
		this.mtg_sn = mtg_sn;
	}
	public int getUser_sn() {
		return user_sn;
	}
	public void setUser_sn(int user_sn) {
		this.user_sn = user_sn;
	}
	
	public MeetingUserVO toMeetingUserVO() {
		MeetingUserVO meetingUser = new MeetingUserVO();
		meetingUser.setMtg_sn(mtg_sn);
		meetingUser.setUser_sn(user_sn);
		
		return meetingUser;
	}
}
