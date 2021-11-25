package kr.or.ddit.command;

import kr.or.ddit.dto.ProjectScheduleVO;

public class ProjectScheduleModifyCommand extends ProjectScheduleRegistCommand{
	private int prjct_schdul_sn;

	public int getPrjct_schdul_sn() {
		return prjct_schdul_sn;
	}

	public void setPrjct_schdul_sn(int prjct_schdul_sn) {
		this.prjct_schdul_sn = prjct_schdul_sn;
	}
	
	public ProjectScheduleVO toProjectScheduleVO() {
		ProjectScheduleVO projectSchedule = super.toProjectScheduleVO();
		projectSchedule.setPrjct_schdul_sn(prjct_schdul_sn);
		
		return projectSchedule;
	}
}
