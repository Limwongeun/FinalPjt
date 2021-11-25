package kr.or.ddit.command;

import kr.or.ddit.dto.KnowhowReplyVO;

public class ReplyRegistCommand {
	
	private int knh_no;
	private String knowhow_replyer;
	private String knowhow_replytext;
	private int page;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
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
	
	public KnowhowReplyVO toKnowhowReplyVO() {
		KnowhowReplyVO reply = new KnowhowReplyVO();

		reply.setKnh_no(this.knh_no);
		reply.setKnowhow_replyer(this.knowhow_replyer);
		reply.setKnowhow_replytext(this.knowhow_replytext);
		
		return reply;
		
	}
	
}
