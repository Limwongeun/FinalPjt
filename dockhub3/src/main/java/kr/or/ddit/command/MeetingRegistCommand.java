package kr.or.ddit.command;

import java.util.List;

import kr.or.ddit.dto.MeetingVO;

public class MeetingRegistCommand {

	private int prjct_sn;
	private String mtg_date;
	private String mtg_title;
	private String mtg_content;
	private int file_sn;
	private String mtg_sttus_code;
	private String mtg_type_code;
	List<Integer> user;


	public List<Integer> getUser() {
		return user;
	}
	public void setUser(List<Integer> user) {
		this.user = user;
	}
	public String getMtg_type_code() {
		return mtg_type_code;
	}
	public void setMtg_type_code(String mtg_type_code) {
		this.mtg_type_code = mtg_type_code;
	}
	public int getPrjct_sn() {
		return prjct_sn;
	}
	public void setPrjct_sn(int prjct_sn) {
		this.prjct_sn = prjct_sn;
	}
	public String getMtg_date() {
		return mtg_date;
	}
	public void setMtg_date(String mtg_date) {
		this.mtg_date = mtg_date;
	}
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
	public int getFile_sn() {
		return file_sn;
	}
	public void setFile_sn(int file_sn) {
		this.file_sn = file_sn;
	}
	public String getMtg_sttus_code() {
		return mtg_sttus_code;
	}
	public void setMtg_sttus_code(String mtg_sttus_code) {
		this.mtg_sttus_code = mtg_sttus_code;
	}
	
	public MeetingVO toMeetingVO()  {
		MeetingVO meeting = new MeetingVO();
		meeting.setPrjct_sn(this.prjct_sn);
//		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
//		Date date = transFormat.parse(mtg_date);
		meeting.setMtg_type_code(this.mtg_type_code);
		meeting.setMtg_date(this.mtg_date);
		meeting.setMtg_title(this.mtg_title);
		meeting.setMtg_content(this.mtg_content);
		meeting.setFile_sn(this.file_sn);
		meeting.setMtg_sttus_code(this.mtg_sttus_code);
		
		return meeting;
	}
}
