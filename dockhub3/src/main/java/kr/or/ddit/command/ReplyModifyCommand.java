package kr.or.ddit.command;

import kr.or.ddit.dto.KnowhowReplyVO;

public class ReplyModifyCommand {
	private int knh_no;
	private int knowhow_reply_no;
	private String knowhow_replytext;
	private int page;
	
	public int getKnh_no() {
		return knh_no;
	}
	public void setKnh_no(int knh_no) {
		this.knh_no = knh_no;
	}
	public int getKnowhow_reply_no() {
		return knowhow_reply_no;
	}
	public void setKnowhow_reply_no(int knowhow_reply_no) {
		this.knowhow_reply_no = knowhow_reply_no;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getKnowhow_replytext() {
		return knowhow_replytext;
	}
	public void setKnowhow_replytext(String knowhow_replytext) {
		this.knowhow_replytext = knowhow_replytext;
	}
	
	public KnowhowReplyVO toKnowhowReplyVO() {
		KnowhowReplyVO reply = new KnowhowReplyVO();

		reply.setKnh_no(this.knh_no);
		reply.setKnowhow_reply_no(this.knowhow_reply_no);
		reply.setKnowhow_replytext(this.knowhow_replytext);
		
		return reply;
		
	}
	
}
