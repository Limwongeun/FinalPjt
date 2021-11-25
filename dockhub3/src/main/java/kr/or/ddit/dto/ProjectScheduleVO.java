package kr.or.ddit.dto;

public class ProjectScheduleVO {

	private int prjct_schdul_sn; // 프로젝트 일정 일련번호
	private int prjct_sn; //프로젝트 일련번호
	private int user_sn; // 유저 일련번호
	private int mber_sn;
	private String prjct_schdul_bgnde; //프로젝트 일정 시작일
	private String prjct_schdul_endde; //프로젝트 일정 종료일
	private String prjct_schdul_nm; // 프로젝트 일정 이름
	private String prjct_schdul_cn; // 프로젝트 일정 내용
	private String prjct_schdul_color; //일정 색상
	private String prjct_allday;
	
	
	public int getPrjct_schdul_sn() {
		return prjct_schdul_sn;
	}
	public void setPrjct_schdul_sn(int prjct_schdul_sn) {
		this.prjct_schdul_sn = prjct_schdul_sn;
	}
	public int getPrjct_sn() {
		return prjct_sn;
	}
	public void setPrjct_sn(int prjct_sn) {
		this.prjct_sn = prjct_sn;
	}
	public int getUser_sn() {
		return user_sn;
	}
	public void setUser_sn(int user_sn) {
		this.user_sn = user_sn;
	}
	public String getPrjct_schdul_bgnde() {
		return prjct_schdul_bgnde;
	}
	public void setPrjct_schdul_bgnde(String prjct_schdul_bgnde) {
		this.prjct_schdul_bgnde = prjct_schdul_bgnde;
	}
	public String getPrjct_schdul_endde() {
		return prjct_schdul_endde;
	}
	public void setPrjct_schdul_endde(String prjct_schdul_endde) {
		this.prjct_schdul_endde = prjct_schdul_endde;
	}
	public String getPrjct_schdul_nm() {
		return prjct_schdul_nm;
	}
	public void setPrjct_schdul_nm(String prjct_schdul_nm) {
		this.prjct_schdul_nm = prjct_schdul_nm;
	}
	public String getPrjct_schdul_cn() {
		return prjct_schdul_cn;
	}
	public void setPrjct_schdul_cn(String prjct_schdul_cn) {
		this.prjct_schdul_cn = prjct_schdul_cn;
	}
	public String getPrjct_schdul_color() {
		return prjct_schdul_color;
	}
	public void setPrjct_schdul_color(String prjct_schdul_color) {
		this.prjct_schdul_color = prjct_schdul_color;
	}
	public int getMber_sn() {
		return mber_sn;
	}
	public void setMber_sn(int mber_sn) {
		this.mber_sn = mber_sn;
	}
	public String getPrjct_allday() {
		return prjct_allday;
	}
	public void setPrjct_allday(String prjct_allday) {
		this.prjct_allday = prjct_allday;
	}
	
	
	
}
