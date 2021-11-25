package kr.or.ddit.dto;

import java.util.Map;

public class KnowhowVO {

	private int knh_no; //노하우 일련 번호
	private String mber_sn; // 작성자
	private String knh_title; // 제목
	private String knh_content; // 내용
	private int knh_likeCnt; // 좋아요
	private String knh_regDate; // 등록 일
	private String knh_updateDate; // 수정일
	private String mber_nm; //멤버 이름
	private String mber_ncnm; //멤버 닉네임
	private Map<String, Object> replyMap; 
	private int likeExist;
	
	public int getLikeExist() {
		return likeExist;
	}
	public void setLikeExist(int likeExist) {
		this.likeExist = likeExist;
	}
	public Map<String, Object> getReplyMap() {
		return replyMap;
	}
	public void setReplyMap(Map<String, Object> replyMap) {
		this.replyMap = replyMap;
	}
	public int getKnh_no() {
		return knh_no;
	}
	public void setKnh_no(int knh_no) {
		this.knh_no = knh_no;
	}
	public String getMber_sn() {
		return mber_sn;
	}
	public void setMber_sn(String mber_sn) {
		this.mber_sn = mber_sn;
	}
	public String getKnh_title() {
		return knh_title;
	}
	public void setKnh_title(String knh_title) {
		this.knh_title = knh_title;
	}
	public String getKnh_content() {
		return knh_content;
	}
	public void setKnh_content(String knh_content) {
		this.knh_content = knh_content;
	}

	public int getKnh_likeCnt() {
		return knh_likeCnt;
	}
	public void setKnh_likeCnt(int knh_likeCnt) {
		this.knh_likeCnt = knh_likeCnt;
	}
	public String getKnh_regDate() {
		return knh_regDate;
	}
	public void setKnh_regDate(String knh_regDate) {
		this.knh_regDate = knh_regDate;
	}
	public String getKnh_updateDate() {
		return knh_updateDate;
	}
	public void setKnh_updateDate(String knh_updateDate) {
		this.knh_updateDate = knh_updateDate;
	}
	public String getMber_nm() {
		return mber_nm;
	}
	public void setMber_nm(String mber_nm) {
		this.mber_nm = mber_nm;
	}
	public String getMber_ncnm() {
		return mber_ncnm;
	}
	public void setMber_ncnm(String mber_ncnm) {
		this.mber_ncnm = mber_ncnm;
	}
	
	
	
	
	
	
}
