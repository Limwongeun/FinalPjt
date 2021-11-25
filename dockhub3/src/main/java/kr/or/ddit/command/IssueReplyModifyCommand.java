package kr.or.ddit.command;

import kr.or.ddit.dto.IssueReplyVO;

public class IssueReplyModifyCommand {
	private int issue_reply_no;
	private String issue_reply_content;
	
	public int getIssue_reply_no() {
		return issue_reply_no;
	}
	public void setIssue_reply_no(int issue_reply_no) {
		this.issue_reply_no = issue_reply_no;
	}
	public String getIssue_reply_content() {
		return issue_reply_content;
	}
	public void setIssue_reply_content(String issue_reply_content) {
		this.issue_reply_content = issue_reply_content;
	}
	public IssueReplyVO toIssueReplyVO() {
		IssueReplyVO reply = new IssueReplyVO();
		reply.setIssue_reply_no(issue_reply_no);
		reply.setIssue_reply_content(issue_reply_content);
		return reply;
	}
	
	
}	
