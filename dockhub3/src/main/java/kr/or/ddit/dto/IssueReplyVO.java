package kr.or.ddit.dto;

import java.util.Date;

public class IssueReplyVO {

	private int issue_reply_no;				// 이슈 댓글 번호
	private int issue_sn;					// 이슈 일련번호
	private Date issue_reply_regdate;		// 이슈 댓글 등록일
	private String issue_reply_content;		// 이슈 댓글 내용
	private Date issue_reply_updatedate;	// 이슈 댓글 수정일
	private String issue_replyer;			// 이슈 작성자
	private String mber_ncnm; 				// 닉네임
	private String user_sn;					// 프로젝트유저 일련번호
	private String mber_sn;					// 멤버 일련번호
	private String prjct_sn;				// 프로젝트 일련번호
	private String mber_photo;				// 회원 사진
	
	public int getIssue_reply_no() {
		return issue_reply_no;
	}
	public void setIssue_reply_no(int issue_reply_no) {
		this.issue_reply_no = issue_reply_no;
	}
	public int getIssue_sn() {
		return issue_sn;
	}
	public void setIssue_sn(int issue_sn) {
		this.issue_sn = issue_sn;
	}

	public Date getIssue_reply_regdate() {
		return issue_reply_regdate;
	}
	public void setIssue_reply_regdate(Date issue_reply_regdate) {
		this.issue_reply_regdate = issue_reply_regdate;
	}
	public String getIssue_reply_content() {
		return issue_reply_content;
	}
	public void setIssue_reply_content(String issue_reply_content) {
		this.issue_reply_content = issue_reply_content;
	}
	public Date getIssue_reply_updatedate() {
		return issue_reply_updatedate;
	}
	public void setIssue_reply_updatedate(Date issue_reply_updatedate) {
		this.issue_reply_updatedate = issue_reply_updatedate;
	}
	public String getMber_ncnm() {
		return mber_ncnm;
	}
	public void setMber_ncnm(String mber_ncnm) {
		this.mber_ncnm = mber_ncnm;
	}
	public String getIssue_replyer() {
		return issue_replyer;
	}
	public void setIssue_replyer(String issue_replyer) {
		this.issue_replyer = issue_replyer;
	}
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
	public String getPrjct_sn() {
		return prjct_sn;
	}
	public void setPrjct_sn(String prjct_sn) {
		this.prjct_sn = prjct_sn;
	}
	public String getMber_photo() {
		return mber_photo;
	}
	public void setMber_photo(String mber_photo) {
		this.mber_photo = mber_photo;
	}
	
	
	
}
