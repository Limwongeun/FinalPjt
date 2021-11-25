package kr.or.ddit.dto;

import java.util.Date;

public class MilestoneVO {
	
	private int mile_no;
	private int mile_wrter;
	private String mile_title;
	private String mile_content;
	private Date mile_startdate;
	private Date mile_enddate;
	private String mile_state_code;
	private String mile_updatetime;
	private String mber_sn;
	private int prjct_sn;
	private int openissue;
	private int closeissue;
	private String issuetitle;

	
	public String getIssuetitle() {
		return issuetitle;
	}
	public void setIssuetitle(String issuetitle) {
		this.issuetitle = issuetitle;
	}
	public int getPrjct_sn() {
		return prjct_sn;
	}
	public void setPrjct_sn(int prjct_sn) {
		this.prjct_sn = prjct_sn;
	}
	public String getMber_sn() {
		return mber_sn;
	}
	public void setMber_sn(String mber_sn) {
		this.mber_sn = mber_sn;
	}
	public int getMile_no() {
		return mile_no;
	}
	public void setMile_no(int mile_no) {
		this.mile_no = mile_no;
	}
	public int getMile_wrter() {
		return mile_wrter;
	}
	public void setMile_wrter(int mile_wrter) {
		this.mile_wrter = mile_wrter;
	}
	public String getMile_title() {
		return mile_title;
	}
	public void setMile_title(String mile_title) {
		this.mile_title = mile_title;
	}
	public String getMile_content() {
		return mile_content;
	}
	public void setMile_content(String mile_content) {
		this.mile_content = mile_content;
	}
	public Date getMile_startdate() {
		return mile_startdate;
	}
	public void setMile_startdate(Date mile_startdate) {
		this.mile_startdate = mile_startdate;
	}
	public Date getMile_enddate() {
		return mile_enddate;
	}
	public void setMile_enddate(Date mile_enddate) {
		this.mile_enddate = mile_enddate;
	}
	public String getMile_state_code() {
		return mile_state_code;
	}
	public void setMile_state_code(String mile_state_code) {
		this.mile_state_code = mile_state_code;
	}
	public String getMile_updatetime() {
		return mile_updatetime;
	}
	public void setMile_updatetime(String mile_updatetime) {
		this.mile_updatetime = mile_updatetime;
	}
	public int getOpenissue() {
		return openissue;
	}
	public void setOpenissue(int cnt) {
		this.openissue = cnt;
	}
	public int getCloseissue() {
		return closeissue;
	}
	public void setCloseissue(int closeissue) {
		this.closeissue = closeissue;
	}
	
	
}
