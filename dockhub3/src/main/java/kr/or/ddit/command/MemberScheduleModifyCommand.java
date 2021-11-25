package kr.or.ddit.command;

import kr.or.ddit.dto.MemberScheduleVO;

public class MemberScheduleModifyCommand extends MemberScheduleRegistCommand{
	private String mber_schdul_sn;
	
	

	public String getMber_schdul_sn() {
		return mber_schdul_sn;
	}

	public void setMber_schdul_sn(String mber_schdul_sn) {
		this.mber_schdul_sn = mber_schdul_sn;
	}
	
	public MemberScheduleVO toMemberScheduleVO() {
		MemberScheduleVO memberSchedule = super.toMemberScheduleVO();
		memberSchedule.setMber_schdul_sn(Integer.parseInt(mber_schdul_sn));
		memberSchedule.setMber_schdul_bgnde(super.getMber_schdul_bgnde());
		memberSchedule.setMber_schdul_endde(super.getMber_schdul_endde());
		
		return memberSchedule;
	}
}
