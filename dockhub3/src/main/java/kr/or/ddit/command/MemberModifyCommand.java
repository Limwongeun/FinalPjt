package kr.or.ddit.command;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.dto.MemberVO;

public class MemberModifyCommand {

	private String mber_nm; //이름
	private String mber_ncnm; //닉네임
	private String mber_password; //비밀번호
	private String mber_repo; //깃허브
	private String[] mber_brthdy; //생일
	private String mber_sexdstn; //성별
	private String mber_career_code; //경력
	private String mber_moblphon_no; //휴대폰
	private String mber_sttus_code; //상태코드
	private MultipartFile mber_photo; //사진
	private String oldPhoto; //이전 사진 
	private String uploadPhoto; //변경된 사진
	private int mber_sn;
	private String mber_id;
	
	public String getMber_sttus_code() {
		return mber_sttus_code;
	}
	public void setMber_sttus_code(String mber_sttus_code) {
		this.mber_sttus_code = mber_sttus_code;
	}
	public String getMber_id() {
		return mber_id;
	}
	public void setMber_id(String mber_id) {
		this.mber_id = mber_id;
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
	public String getMber_password() {
		return mber_password;
	}
	public void setMber_password(String mber_password) {
		this.mber_password = mber_password;
	}
	public String getMber_repo() {
		return mber_repo;
	}
	public void setMber_repo(String mber_repo) {
		this.mber_repo = mber_repo;
	}
	public String[] getMber_brthdy() {
		return mber_brthdy;
	}
	public void setMber_brthdy(String[] mber_brthdy) {
		this.mber_brthdy = mber_brthdy;
	}
	public String getMber_sexdstn() {
		return mber_sexdstn;
	}
	public void setMber_sexdstn(String mber_sexdstn) {
		this.mber_sexdstn = mber_sexdstn;
	}
	public String getMber_career_code() {
		return mber_career_code;
	}
	public void setMber_career_code(String mber_career_code) {
		this.mber_career_code = mber_career_code;
	}
	public String getMber_moblphon_no() {
		return mber_moblphon_no;
	}
	public void setMber_moblphon_no(String mber_moblphon_no) {
		this.mber_moblphon_no = mber_moblphon_no;
	}

	
	public MultipartFile getMber_photo() {
		return mber_photo;
	}
	public void setMber_photo(MultipartFile mber_photo) {
		this.mber_photo = mber_photo;
	}
	public String getOldPhoto() {
		return oldPhoto;
	}
	public void setOldPhoto(String oldPhoto) {
		this.oldPhoto = oldPhoto;
	}
	public String getUploadPhoto() {
		return uploadPhoto;
	}
	public void setUploadPhoto(String uploadPhoto) {
		this.uploadPhoto = uploadPhoto;
	}
	public int getMber_sn() {
		return mber_sn;
	}
	public void setMber_sn(int mber_sn) {
		this.mber_sn = mber_sn;
	}
	
	public MemberVO toParseMember() {
		MemberVO member = new MemberVO();
		
		String mber_brthdy = "";
		for (String data : this.mber_brthdy) {
			mber_brthdy += data;
		}
		member.setMber_id(mber_id);
		member.setMber_nm(mber_nm);
		member.setMber_ncnm(mber_ncnm);
		member.setMber_password(mber_password);
		member.setMber_repo(mber_repo);
		member.setMber_brthdy(mber_brthdy);
		member.setMber_sexdstn(mber_sexdstn);
		member.setMber_career_code(mber_career_code);
		member.setMber_sttus_code(mber_sttus_code);
		member.setMber_moblphon_no(mber_moblphon_no);
		member.setMber_sn(String.valueOf(mber_sn));
		return member;
	}
}
