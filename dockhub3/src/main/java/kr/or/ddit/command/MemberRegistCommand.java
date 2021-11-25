package kr.or.ddit.command;

import kr.or.ddit.dto.MemberVO;

public class MemberRegistCommand {

	private int mber_sn;
	private String mber_id;
	private String mber_nm;
	private String mber_password;
	private String mber_ncnm;
	private String mber_moblphon_no;
	private String mber_photo;
	private String mber_gitid;
	private String mber_career_code;
	private String[] mber_brthdy;
	private String mber_sexdstn;
	private String mber_repo;
	
	public String getMber_repo() {
		return mber_repo;
	}
	public void setMber_repo(String mber_repo) {
		this.mber_repo = mber_repo;
	}
	public synchronized int getMber_sn() {
		return mber_sn;
	}
	public synchronized void setMber_sn(int mber_sn) {
		this.mber_sn = mber_sn;
	}
	public synchronized String getMber_id() {
		return mber_id;
	}
	public synchronized void setMber_id(String mber_id) {
		this.mber_id = mber_id;
	}
	public synchronized String getMber_nm() {
		return mber_nm;
	}
	public synchronized void setMber_nm(String mber_nm) {
		this.mber_nm = mber_nm;
	}
	public synchronized String getMber_password() {
		return mber_password;
	}
	public synchronized void setMber_password(String mber_password) {
		this.mber_password = mber_password;
	}
	public synchronized String getMber_ncnm() {
		return mber_ncnm;
	}
	public synchronized void setMber_ncnm(String mber_ncnm) {
		this.mber_ncnm = mber_ncnm;
	}
	public synchronized String getMber_moblphon_no() {
		return mber_moblphon_no;
	}
	public synchronized void setMber_moblphon_no(String mber_moblphon_no) {
		this.mber_moblphon_no = mber_moblphon_no;
	}
	public synchronized String getMber_photo() {
		return mber_photo;
	}
	public synchronized void setMber_photo(String mber_photo) {
		this.mber_photo = mber_photo;
	}
	public synchronized String getMber_gitid() {
		return mber_gitid;
	}
	public synchronized void setMber_gitid(String mber_gitid) {
		this.mber_gitid = mber_gitid;
	}
	public synchronized String getMber_career_code() {
		return mber_career_code;
	}
	public synchronized void setMber_career_code(String mber_career_code) {
		this.mber_career_code = mber_career_code;
	}
	public synchronized String[] getMber_brthdy() {
		return mber_brthdy;
	}
	public synchronized void setMber_brthdy(String[] mber_brthdy) {
		this.mber_brthdy = mber_brthdy;
	}
	public synchronized String getMber_sexdstn() {
		return mber_sexdstn;
	}
	public synchronized void setMber_sexdstn(String mber_sexdstn) {
		this.mber_sexdstn = mber_sexdstn;
	}
	
	public MemberVO toMemberVO() {
	
		String mber_brthdy="";
		for (String data : this.mber_brthdy) {
			mber_brthdy += data;
		}
		
		MemberVO member = new MemberVO();
		
		member.setMber_id(mber_id);
		member.setMber_nm(mber_nm);
		member.setMber_password(mber_password);
		member.setMber_ncnm(mber_ncnm);
		member.setMber_moblphon_no(mber_moblphon_no);
		member.setMber_photo(mber_photo);
		member.setMber_gitid(mber_gitid);
		member.setMber_career_code(mber_career_code);
		member.setMber_brthdy(mber_brthdy);
		member.setMber_sexdstn(mber_sexdstn);
		member.setMber_repo(mber_repo);
		
		return member;
	
	}
}