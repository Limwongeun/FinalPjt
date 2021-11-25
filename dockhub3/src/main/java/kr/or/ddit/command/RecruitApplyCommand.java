package kr.or.ddit.command;

import kr.or.ddit.dto.RecruitApplyVO;

public class RecruitApplyCommand {
	
	private int pblanc_sn;
	private int pblanc_sport_role;
	private String content;
	private String pblanc_apply_meeting_time;
	public int getPblanc_sn() {
		return pblanc_sn;
	}

	public int getPblanc_sport_role() {
		return pblanc_sport_role;
	}


	public String getContent() {
		return content;
	}

	public void setPblanc_sn(int pblanc_sn) {
		this.pblanc_sn = pblanc_sn;
	}

	public void setPblanc_sport_role(int pblanc_sport_role) {
		this.pblanc_sport_role = pblanc_sport_role;
	}

	public String getPblanc_apply_meeting_time() {
		return pblanc_apply_meeting_time;
	}

	public void setPblanc_apply_meeting_time(String pblanc_apply_meeting_time) {
		this.pblanc_apply_meeting_time = pblanc_apply_meeting_time;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public RecruitApplyVO toRecruitApplyVO() {
		RecruitApplyVO recruitApply = new RecruitApplyVO();
		recruitApply.setPblanc_sn(this.pblanc_sn);
		recruitApply.setPblanc_apply_meeting_time(this.pblanc_apply_meeting_time);
		recruitApply.setPblanc_sport_cn(this.content);
		recruitApply.setPblanc_sport_role(this.pblanc_sport_role);
		return recruitApply;
	}
}
	
	
	
	
