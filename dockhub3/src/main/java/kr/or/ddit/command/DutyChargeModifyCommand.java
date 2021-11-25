package kr.or.ddit.command;

import kr.or.ddit.dto.DutyChargeVO;

public class DutyChargeModifyCommand {

	private int unit_job_sn;
	private int user_sn;
	private String unit_job_nm;
	private String unit_job_bgnde;
	private String unit_job_endde;
	private int unit_job_pro;
	
	public int getUnit_job_sn() {
		return unit_job_sn;
	}
	public void setUnit_job_sn(int unit_job_sn) {
		this.unit_job_sn = unit_job_sn;
	}
	public int getUser_sn() {
		return user_sn;
	}
	public void setUser_sn(int user_sn) {
		this.user_sn = user_sn;
	}
	public String getUnit_job_nm() {
		return unit_job_nm;
	}
	public void setUnit_job_nm(String unit_job_nm) {
		this.unit_job_nm = unit_job_nm;
	}
	public String getUnit_job_bgnde() {
		return unit_job_bgnde;
	}
	public void setUnit_job_bgnde(String unit_job_bgnde) {
		this.unit_job_bgnde = unit_job_bgnde;
	}
	public String getUnit_job_endde() {
		return unit_job_endde;
	}
	public void setUnit_job_endde(String unit_job_endde) {
		this.unit_job_endde = unit_job_endde;
	}
	public int getUnit_job_pro() {
		return unit_job_pro;
	}
	public void setUnit_job_pro(int unit_job_pro) {
		this.unit_job_pro = unit_job_pro;
	}
	
	public DutyChargeVO toDutyChargeVO() {
		DutyChargeVO duty = new DutyChargeVO();

		duty.setUnit_job_sn(this.unit_job_sn);
		duty.setUser_sn(this.user_sn);
		duty.setUnit_job_nm(this.unit_job_nm);
		duty.setUnit_job_bgnde(this.unit_job_bgnde);
		duty.setUnit_job_endde(this.unit_job_endde);
		duty.setUnit_job_pro(this.unit_job_pro);
		
		return duty;
	}
	
}
