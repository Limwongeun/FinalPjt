package kr.or.ddit.command;

import kr.or.ddit.dto.MemberScheduleVO;

public class MemberScheduleRegistCommand {

	private String mber_schdul_bgnde;
	private String mber_schdul_endde;
	private String mber_schdul_nm;
	private String mber_schdul_cn;
	private String mber_schdul_color;
	private String mber_sn;
	private String mber_allday;
	
	public String getMber_sn() {
		return mber_sn;
	}
	public void setMber_sn(String mber_sn) {
		this.mber_sn = mber_sn;
	}
	public String getMber_schdul_bgnde() {
		return mber_schdul_bgnde;
	}
	public void setMber_schdul_bgnde(String mber_schdul_bgnde) {
		this.mber_schdul_bgnde = mber_schdul_bgnde;
	}
	public String getMber_schdul_endde() {
		return mber_schdul_endde;
	}
	public void setMber_schdul_endde(String mber_schdul_endde) {
		this.mber_schdul_endde = mber_schdul_endde;
	}
	public String getMber_schdul_nm() {
		return mber_schdul_nm;
	}
	public void setMber_schdul_nm(String mber_schdul_nm) {
		this.mber_schdul_nm = mber_schdul_nm;
	}
	public String getMber_schdul_cn() {
		return mber_schdul_cn;
	}
	public void setMber_schdul_cn(String mber_schdul_cn) {
		this.mber_schdul_cn = mber_schdul_cn;
	}
	public String getMber_schdul_color() {
		return mber_schdul_color;
	}
	public void setMber_schdul_color(String mber_schdul_color) {
		this.mber_schdul_color = mber_schdul_color;
	}
	public String getMber_allday() {
		return mber_allday;
	}
	public void setMber_allday(String mber_allday) {
		this.mber_allday = mber_allday;
	}
	
	public MemberScheduleVO toMemberScheduleVO() {
		MemberScheduleVO memSche = new MemberScheduleVO();
		memSche.setMber_schdul_bgnde(this.mber_schdul_bgnde);
		memSche.setMber_schdul_endde(this.mber_schdul_endde);
		memSche.setMber_schdul_nm(this.mber_schdul_nm);
		memSche.setMber_schdul_cn(this.mber_schdul_cn);
		memSche.setMber_schdul_color(this.mber_schdul_color);
		memSche.setMber_sn(this.mber_sn);
		memSche.setMber_allday(mber_allday);
		return memSche;
	}
	
}
