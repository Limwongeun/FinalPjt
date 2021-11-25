package kr.or.ddit.command;

import java.text.ParseException;

import kr.or.ddit.dto.DutyChargeVO;

public class DutyChargeRegistCommand {

	private int user_sn;
	private String unit_job_nm;
	private String unit_job_bgnde;
	private String unit_job_endde;
	private int unit_job_pro;

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


	public DutyChargeVO toDutyChargeVO() throws ParseException {
		DutyChargeVO dutyCharge = new DutyChargeVO();

		dutyCharge.setUser_sn(user_sn);
		dutyCharge.setUnit_job_nm(unit_job_nm);
		dutyCharge.setUnit_job_bgnde(unit_job_bgnde);
		dutyCharge.setUnit_job_endde(unit_job_endde);
		dutyCharge.setUnit_job_pro(unit_job_pro);

		return dutyCharge;

	}

}
