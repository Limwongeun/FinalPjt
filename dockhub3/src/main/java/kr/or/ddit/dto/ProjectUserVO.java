package kr.or.ddit.dto;

public class ProjectUserVO {
	
	private int user_sn;
	private int prjct_sn;
	private int role_sn;
	private String mber_sn;
	private String start_date;
	private String end_date;
	private String mber_photo;
	private String mber_ncnm;
	private String mber_nm;
	private String role_nm;
	private String prjct_author_code;
	private int allDuty;
	private int proDuty;
	private int allIssue;
	private int proIssue;
	
	public String getMber_photo() {
		return mber_photo;
	}
	public void setMber_photo(String mber_photo) {
		this.mber_photo = mber_photo;
	}
	public int getAllDuty() {
		return allDuty;
	}
	public int getProDuty() {
		return proDuty;
	}
	public int getAllIssue() {
		return allIssue;
	}
	public int getProIssue() {
		return proIssue;
	}
	public void setAllDuty(int allDuty) {
		this.allDuty = allDuty;
	}
	public void setProDuty(int proDuty) {
		this.proDuty = proDuty;
	}
	public void setAllIssue(int allIssue) {
		this.allIssue = allIssue;
	}
	public void setProIssue(int proIssue) {
		this.proIssue = proIssue;
	}
	public String getMber_ncnm() {
		return mber_ncnm;
	}
	public void setMber_ncnm(String mber_ncnm) {
		this.mber_ncnm = mber_ncnm;
	}
	public String getMber_nm() {
		return mber_nm;
	}
	public void setMber_nm(String mber_nm) {
		this.mber_nm = mber_nm;
	}
	public String getRole_nm() {
		return role_nm;
	}
	public void setRole_nm(String role_nm) {
		this.role_nm = role_nm;
	}
	public String getPrjct_author_code() {
		return prjct_author_code;
	}
	public void setPrjct_author_code(String prjct_author_code) {
		this.prjct_author_code = prjct_author_code;
	}
	public int getUser_sn() {
		return user_sn;
	}
	public void setUser_sn(int user_sn) {
		this.user_sn = user_sn;
	}
	public int getPrjct_sn() {
		return prjct_sn;
	}
	public void setPrjct_sn(int prjct_sn) {
		this.prjct_sn = prjct_sn;
	}
	public int getRole_sn() {
		return role_sn;
	}
	public void setRole_sn(int role_sn) {
		this.role_sn = role_sn;
	}
	public String getMber_sn() {
		return mber_sn;
	}
	public void setMber_sn(String mber_sn) {
		this.mber_sn = mber_sn;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	
	
	
}
