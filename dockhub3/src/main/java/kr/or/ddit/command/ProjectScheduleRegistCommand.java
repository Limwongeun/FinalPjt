package kr.or.ddit.command;

import kr.or.ddit.dto.ProjectScheduleVO;

public class ProjectScheduleRegistCommand {

	private int prjct_sn;
	private int user_sn;
	private String prjct_schdul_bgnde;
	private String prjct_schdul_endde;
	private String prjct_schdul_nm;
	private String prjct_schdul_cn;
	private String prjct_schdul_color;
	private int mber_sn;
	private String prjct_allday;
	


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


	

	public int getMber_sn() {
		return mber_sn;
	}



	public void setMber_sn(int mber_sn) {
		this.mber_sn = mber_sn;
	}



	public void setPrjct_schdul_color(String prjct_schdul_color) {
		this.prjct_schdul_color = prjct_schdul_color;
	}
	
	
	
	
	public String getPrjct_allday() {
		return prjct_allday;
	}



	public void setPrjct_allday(String prjct_allday) {
		this.prjct_allday = prjct_allday;
	}



	public ProjectScheduleVO toProjectScheduleVO() {
		ProjectScheduleVO projectSchedule = new ProjectScheduleVO();
		projectSchedule.setPrjct_schdul_bgnde(prjct_schdul_bgnde);
		projectSchedule.setPrjct_schdul_cn(prjct_schdul_cn);
		projectSchedule.setPrjct_schdul_color(prjct_schdul_color);
		projectSchedule.setPrjct_schdul_endde(prjct_schdul_endde);
		projectSchedule.setPrjct_schdul_nm(prjct_schdul_nm);
		projectSchedule.setPrjct_sn(prjct_sn);
		projectSchedule.setUser_sn(user_sn);
		projectSchedule.setMber_sn(mber_sn);
		projectSchedule.setPrjct_allday(prjct_allday);
		return projectSchedule;
	}

	
}
