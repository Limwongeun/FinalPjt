package kr.or.ddit.command;

import java.text.ParseException;

import kr.or.ddit.dto.MilestoneVO;

public class MileStoneModifyCommand extends MileStoneRegistCommand {
	
	int mile_no;
	
	public int getMile_no() {
		return mile_no;
	}

	public void setMile_no(int mile_no) {
		this.mile_no = mile_no;
	}

	public MilestoneVO toMilestoneVO() throws ParseException {
		MilestoneVO milestone = super.toMileStoneVO();
		
		milestone.setMile_no(mile_no);
//		System.out.println("ㅇㅁㄴㅇㅁㅇ"+mile_no);
		return milestone;
		}
	
	
}
