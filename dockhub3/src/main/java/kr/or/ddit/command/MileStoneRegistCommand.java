package kr.or.ddit.command;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import kr.or.ddit.dto.MilestoneVO;

public class MileStoneRegistCommand {
	
	private int mile_wrter;
	private String mile_title;
	private String mile_content;
	private String mile_startdate;
	private String mile_enddate;
	private String mile_state_code;
	private int prjct_sn;
	
	
	
	public String getMile_state_code() {
		return mile_state_code;
	}
	public void setMile_state_code(String mile_state_code) {
		this.mile_state_code = mile_state_code;
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
	public String getMile_startdate() {
		return mile_startdate;
	}
	public void setMile_startdate(String mile_startdate) {
		this.mile_startdate = mile_startdate;
	}
	public String getMile_enddate() {
		return mile_enddate;
	}
	public void setMile_enddate(String mile_enddate) {
		this.mile_enddate = mile_enddate;
	}
	
	public int getPrjct_sn() {
		return prjct_sn;
	}
	public void setPrjct_sn(int prjct_sn) {
		this.prjct_sn = prjct_sn;
	}
	public MilestoneVO toMileStoneVO() throws ParseException {
		MilestoneVO mileStone = new MilestoneVO();
		mileStone.setPrjct_sn(prjct_sn);
		
		mileStone.setMile_content(mile_content);
		mileStone.setMile_title(mile_title);
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date start = transFormat.parse(mile_startdate);
		Date end = transFormat.parse(mile_enddate);
		mileStone.setMile_startdate(start);
		mileStone.setMile_enddate(end);
		mileStone.setMile_state_code(mile_state_code);
		
		return mileStone;
	}
	
	
}
