package kr.or.ddit.dto;

public class KnowhowReplyVO {
	private int knowhow_reply_no; // 댓글번호
	private int knh_no; //노하우 번호
	private String knowhow_replyer; // 작성자
	private String knowhow_replytext; // 댓글내용
	private String regdate; // 등록일 
	private String updatedate; //수정일
	private String mber_ncnm; //닉네임
	
	public int getKnowhow_reply_no() {
		return knowhow_reply_no;
	}
	public void setKnowhow_reply_no(int knowhow_reply_no) {
		this.knowhow_reply_no = knowhow_reply_no;
	}
	public int getKnh_no() {
		return knh_no;
	}
	public void setKnh_no(int knh_no) {
		this.knh_no = knh_no;
	}
	public String getKnowhow_replyer() {
		return knowhow_replyer;
	}
	public void setKnowhow_replyer(String knowhow_replyer) {
		this.knowhow_replyer = knowhow_replyer;
	}
	public String getKnowhow_replytext() {
		return knowhow_replytext;
	}
	public void setKnowhow_replytext(String knowhow_replytext) {
		this.knowhow_replytext = knowhow_replytext;
	}
	
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}
	public String getMber_ncnm() {
		return mber_ncnm;
	}
	public void setMber_ncnm(String mber_ncnm) {
		this.mber_ncnm = mber_ncnm;
	}
	
	
}
