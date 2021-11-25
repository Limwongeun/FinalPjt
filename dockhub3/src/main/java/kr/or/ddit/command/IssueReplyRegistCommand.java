package kr.or.ddit.command;

import java.util.Date;

import kr.or.ddit.dto.IssueReplyVO;

public class IssueReplyRegistCommand {
	private int issue_sn;
	private String issue_reply_content;
	private String mber_ncnm;
	private String issue_replyer;
	private String user_sn;
	private String mber_sn;
	private String prjct_sn; 
	
	
	public String getUser_sn() {
		return user_sn;
	}
	public void setUser_sn(String user_sn) {
		this.user_sn = user_sn;
	}
	public String getMber_sn() {
		return mber_sn;
	}
	public void setMber_sn(String mber_sn) {
		this.mber_sn = mber_sn;
	}
	public String getIssue_replyer() {
		return issue_replyer;
	}
	public void setIssue_replyer(String issue_replyer) {
		this.issue_replyer = issue_replyer;
	}
	public int getIssue_sn() {
		return issue_sn;
	}
	public void setIssue_sn(int issue_sn) {
		this.issue_sn = issue_sn;
	}
	public String getIssue_reply_content() {
		return issue_reply_content;
	}
	public void setIssue_reply_content(String issue_reply_content) {
		this.issue_reply_content = issue_reply_content;
	}
	public String getMber_ncnm() {
		return mber_ncnm;
	}
	public void setMber_ncnm(String mber_ncnm) {
		this.mber_ncnm = mber_ncnm;
	}
	public String getPrjct_sn() {
		return prjct_sn;
	}
	public void setPrjct_sn(String prjct_sn) {
		this.prjct_sn = prjct_sn;
	}
	public IssueReplyVO toIssueReplyVO() {
		IssueReplyVO reply = new IssueReplyVO();
		reply.setIssue_sn(issue_sn);
		reply.setMber_sn(mber_sn);
		reply.setUser_sn(user_sn);
		reply.setMber_ncnm(mber_ncnm);
		reply.setIssue_replyer(issue_replyer);
		reply.setIssue_reply_content(issue_reply_content);
		reply.setIssue_reply_regdate(new Date());
		reply.setIssue_reply_updatedate(new Date());
		reply.setPrjct_sn(prjct_sn);
		
		return reply;
	}
	
	
}	
