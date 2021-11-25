package kr.or.ddit.dto;

import java.time.LocalDate;

public class DutyChargeVO {

	private LocalDate date = LocalDate.now();
	private int unit_job_sn;
	private int user_sn;
	private String unit_job_nm;
	private String unit_job_bgnde;
	private String unit_job_endde;
	private int unit_job_reqre_time;
	private String unit_job_cn;
	private int unit_job_pro;
	private String job_sttus_code; 
	
	private String mber_ncnm;
	private String mber_sn;
	
	private String unit_job_status;
	private String prjct_sj;
	private String mystatus;
	private String myst;
	private int prjct_sn;
	
	private String unit_job_updt_sn;
	private String unit_job_updde;
	private String unit_job_updt_cn;

	public String getJob_sttus_code() {
		return job_sttus_code;
	}
	public void setJob_sttus_code(String job_sttus_code) {
		this.job_sttus_code = job_sttus_code;
	}
	public LocalDate getDate() {
		return date;
	}
	public void setDate(LocalDate date) {
		this.date = date;
	}
	public String getMber_ncnm() {
		return mber_ncnm;
	}
	public void setMber_ncnm(String mber_ncnm) {
		this.mber_ncnm = mber_ncnm;
	}
	public String getMber_sn() {
		return mber_sn;
	}
	public void setMber_sn(String mber_sn) {
		this.mber_sn = mber_sn;
	}
	
	
	public String getUnit_job_status() {
		return unit_job_status;
	}
	public void setUnit_job_status(String unit_job_status) {
		this.unit_job_status = unit_job_status;
	}
	public  int getUnit_job_sn() {
		return unit_job_sn;
	}
	public  void setUnit_job_sn(int unit_job_sn) {
		this.unit_job_sn = unit_job_sn;
	}
	public  int getUser_sn() {
		return user_sn;
	}
	public  void setUser_sn(int user_sn) {
		this.user_sn = user_sn;
	}
	public  String getUnit_job_nm() {
		return unit_job_nm;
	}
	public  void setUnit_job_nm(String unit_job_nm) {
		this.unit_job_nm = unit_job_nm;
	}
	public  String getUnit_job_bgnde() {
		return unit_job_bgnde;
	}
	public  void setUnit_job_bgnde(String unit_job_bgnde) {
		this.unit_job_bgnde = unit_job_bgnde;
	}
	public  String getUnit_job_endde() {
		return unit_job_endde;
	}
	public  void setUnit_job_endde(String unit_job_endde) {
		this.unit_job_endde = unit_job_endde;
	}
	public  int getUnit_job_reqre_time() {
		return unit_job_reqre_time;
	}
	public  void setUnit_job_reqre_time(int unit_job_reqre_time) {
		this.unit_job_reqre_time = unit_job_reqre_time;
	}
	public  String getUnit_job_cn() {
		return unit_job_cn;
	}
	public  void setUnit_job_cn(String unit_job_cn) {
		this.unit_job_cn = unit_job_cn;
	}
	public  int getUnit_job_pro() {
		return unit_job_pro;
	}
	public  void setUnit_job_pro(int unit_job_pro) {
		this.unit_job_pro = unit_job_pro;
	}
	public String getPrjct_sj() {
		return prjct_sj;
	}
	public void setPrjct_sj(String prjct_sj) {
		this.prjct_sj = prjct_sj;
	}
	public String getMystatus() {
		return mystatus;
	}
	public void setMystatus(String mystatus) {
		this.mystatus = mystatus;
	}
	public String getMyst() {
		return myst;
	}
	public void setMyst(String myst) {
		this.myst = myst;
	}
	public int getPrjct_sn() {
		return prjct_sn;
	}
	public void setPrjct_sn(int prjct_sn) {
		this.prjct_sn = prjct_sn;
	}
	public String getUnit_job_updt_sn() {
		return unit_job_updt_sn;
	}
	public void setUnit_job_updt_sn(String unit_job_updt_sn) {
		this.unit_job_updt_sn = unit_job_updt_sn;
	}
	public String getUnit_job_updde() {
		return unit_job_updde;
	}
	public void setUnit_job_updde(String unit_job_updde) {
		this.unit_job_updde = unit_job_updde;
	}
	public String getUnit_job_updt_cn() {
		return unit_job_updt_cn;
	}
	public void setUnit_job_updt_cn(String unit_job_updt_cn) {
		this.unit_job_updt_cn = unit_job_updt_cn;
	}
	
}
