package kr.or.ddit.dto;

import java.util.List;

public class MeetingVO {

	
	private int mtg_sn; // 회의 일련번호
	private int prjct_sn; // 프로젝트 번호
	private int user_sn; // 회원 일련번호
	private String mtg_date; // 일시
	private String mtg_title; // 제목
	private String mtg_content; //내용
	private int file_sn; //파일 번호
	private String mtg_sttus_code; // 회의상태
	private String mtg_type_code;
	private int mtg_reg_user;
	private String mber_sn;
	private String mber_ncnm;
	private List<MemberVO> memList;
	private String mtg_ip;
	
	public String getMtg_ip() {
		return mtg_ip;
	}
	public void setMtg_ip(String mtg_ip) {
		this.mtg_ip = mtg_ip;
	}
	public List<MemberVO> getMemList() {
		return memList;
	}
	public void setMemList(List<MemberVO> memList) {
		this.memList = memList;
	}
	public String getMber_ncnm() {
		return mber_ncnm;
	}
	public void setMber_ncnm(String mber_ncnm) {
		this.mber_ncnm = mber_ncnm;
	}
	public String getMber_sn() {
		return mber_sn;
	}
	public void setMber_sn(String mber_sn) {
		this.mber_sn = mber_sn;
	}
	public int getMtg_reg_user() {
		return mtg_reg_user;
	}
	public void setMtg_reg_user(int mtg_reg_user) {
		this.mtg_reg_user = mtg_reg_user;
	}
	public String getMtg_type_code() {
		return mtg_type_code;
	}
	public void setMtg_type_code(String mtg_type_code) {
		this.mtg_type_code = mtg_type_code;
	}
	public int getMtg_sn() {
		return mtg_sn;
	}
	public void setMtg_sn(int mtg_sn) {
		this.mtg_sn = mtg_sn;
	}
	public int getPrjct_sn() {
		return prjct_sn;
	}
	public void setPrjct_sn(int prjct_sn) {
		this.prjct_sn = prjct_sn;
	}
	public String getMtg_date() {
		return mtg_date;
	}
	public void setMtg_date(String mtg_date) {
		this.mtg_date = mtg_date;
	}
	public String getMtg_title() {
		return mtg_title;
	}
	public void setMtg_title(String mtg_title) {
		this.mtg_title = mtg_title;
	}
	public String getMtg_content() {
		return mtg_content;
	}
	public void setMtg_content(String mtg_content) {
		this.mtg_content = mtg_content;
	}
	public int getFile_sn() {
		return file_sn;
	}
	public void setFile_sn(int file_sn) {
		this.file_sn = file_sn;
	}
	public String getMtg_sttus_code() {
		return mtg_sttus_code;
	}
	public void setMtg_sttus_code(String mtg_sttus_code) {
		this.mtg_sttus_code = mtg_sttus_code;
	}
	public int getUser_sn() {
		return user_sn;
	}
	public void setUser_sn(int user_sn) {
		this.user_sn = user_sn;
	}
	
	
}
