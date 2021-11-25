package kr.or.ddit.command;

import kr.or.ddit.dto.MeetingVO;

public class MeetingModifyCommand extends MeetingRegistCommand {
	
	String mtg_title;
	String mtg_content;
	String mtg_date;
	
	
	public String getMtg_title() {
		return mtg_title;
	}

	public void setMtg_title(String mtg_title) {
		this.mtg_title = mtg_title;
	}

	public String getMtg_content() {
		return mtg_content;
	}

	public void setMtg_content(String mtg_content) {
		this.mtg_content = mtg_content;
	}

	public String getMtg_date() {
		return mtg_date;
	}

	public void setMtg_date(String mtg_date) {
		this.mtg_date = mtg_date;
	}

	
	
	
	public MeetingVO toMeetingVO(){
		MeetingVO meeting = super.toMeetingVO();
		
		meeting.setMtg_title(mtg_title);
		meeting.setMtg_content(mtg_content);
		meeting.setMtg_date(mtg_date);
		
		return meeting;
		
	}
	
}
