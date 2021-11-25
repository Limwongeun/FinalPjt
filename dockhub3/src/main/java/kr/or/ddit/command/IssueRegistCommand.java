package kr.or.ddit.command;

import kr.or.ddit.dto.IssueVO;

public class IssueRegistCommand {
	private int unit_job_sn;
	private int mile_no;
	private int issue_wrter;
	private String issue_title;
	private String issue_content;
	private String issue_ipcr_se_code;
	
	public int getUnit_job_sn() {
		return unit_job_sn;
	}
	public void setUnit_job_sn(int unit_job_sn) {
		this.unit_job_sn = unit_job_sn;
	}
	public int getMile_no() {
		return mile_no;
	}
	public void setMile_no(int mile_no) {
		this.mile_no = mile_no;
	}
	public int getIssue_wrter() {
		return issue_wrter;
	}
	public void setIssue_wrter(int issue_wrter) {
		this.issue_wrter = issue_wrter;
	}
	public String getIssue_title() {
		return issue_title;
	}
	public void setIssue_title(String issue_title) {
		this.issue_title = issue_title;
	}
	public String getIssue_content() {
		return issue_content;
	}
	public void setIssue_content(String issue_content) {
		this.issue_content = issue_content;
	}
	public String getIssue_ipcr_se_code() {
		return issue_ipcr_se_code;
	}
	public void setIssue_ipcr_se_code(String issue_ipcr_se_code) {
		this.issue_ipcr_se_code = issue_ipcr_se_code;
	}
	
	public IssueVO toIssueVO() {
		IssueVO issue = new IssueVO();
		issue.setUnit_job_sn(this.unit_job_sn);
		issue.setMile_no(this.mile_no);
		issue.setIssue_wrter(this.issue_wrter);
		issue.setIssue_title(this.issue_title);
		issue.setIssue_content(this.issue_content);
		issue.setIssue_ipcr_se_code(this.issue_ipcr_se_code);
		
		return issue;
		
		
	}
	
}
