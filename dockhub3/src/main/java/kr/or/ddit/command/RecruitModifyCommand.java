package kr.or.ddit.command;

import kr.or.ddit.dto.RecruitVO;

public class RecruitModifyCommand extends RecruitRegistCommand {
	
	String pblanc_sn;
	String modify;
		
	public String getModify() {
		return modify;
	}

	public void setModify(String modify) {
		this.modify = modify;
	}

	public String getPblanc_sn() {
		return pblanc_sn;
	}

	public void setPblanc_sn(String pblanc_sn) {
		this.pblanc_sn = pblanc_sn;
	}

	public RecruitVO toRecruitVO() {
		RecruitVO recruit = super.toRecruitVO();
		recruit.setPblanc_sn(Integer.parseInt(pblanc_sn));
		
		return recruit;
	}
}
	
	
	
	
