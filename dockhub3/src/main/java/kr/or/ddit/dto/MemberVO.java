package kr.or.ddit.dto;

public class MemberVO {
	
	private String mber_sn;
	private String mber_ncnm;
	private String mber_id;
	private String mber_password;
	private String mber_nm;
	private String mber_repo;
	private String mber_moblphon_no;
	private String mber_regist_de;
	private String mber_last_conect_on;
	private String mber_brthdy;
	private String mber_sexdstn;
	private String mber_gitid;
	private String mber_career_code;
	private String mber_sttus_code;
	private String mber_author_code;
	private String mber_photo;
	private String mber_sttus;
	
	private String user_sn;
	
	
	
	public String getUser_sn() {
		return user_sn;
	}

	public void setUser_sn(String user_sn) {
		this.user_sn = user_sn;
	}

	public String getMber_sttus() {
		if (this.mber_author_code==null || this.mber_author_code.equals("")) {
			mber_sttus = "ROLE_USER";
			return mber_sttus;
		}else if (this.mber_author_code.equals("0")) {
			mber_sttus = "ROLE_ADMIN";
			return mber_sttus; 
		}else{
			mber_sttus = "ROLE_USER";
			return mber_sttus;
		}
	}

	public void setMber_sttus(String mber_sttus) {
		if(mber_sttus==null) mber_sttus="";
		this.mber_sttus = mber_sttus;
	}

	public MemberVO() {
		// TODO Auto-generated constructor stub
	}

	public MemberVO(String mber_sn, String mber_ncnm, String mber_id, String mber_password, String mber_nm,
			String mber_repo, String mber_moblphon_no, String mber_regist_de, String mber_last_conect_on,
			String mber_brthdy, String mber_sexdstn, String mber_gitid, String mber_career_code, String mber_sttus_code,
			String mber_author_code, String mber_photo) {
		super();
		this.mber_sn = mber_sn;
		this.mber_ncnm = mber_ncnm;
		this.mber_id = mber_id;
		this.mber_password = mber_password;
		this.mber_nm = mber_nm;
		this.mber_repo = mber_repo;
		this.mber_moblphon_no = mber_moblphon_no;
		this.mber_regist_de = mber_regist_de;
		this.mber_last_conect_on = mber_last_conect_on;
		this.mber_brthdy = mber_brthdy;
		this.mber_sexdstn = mber_sexdstn;
		this.mber_gitid = mber_gitid;
		this.mber_career_code = mber_career_code;
		this.mber_sttus_code = mber_sttus_code;
		this.mber_author_code = mber_author_code;
		this.mber_photo = mber_photo;
	}

	public String getMber_sn() {
		return mber_sn;
	}

	public void setMber_sn(String mber_sn) {
		this.mber_sn = mber_sn;
	}

	public String getMber_ncnm() {
		return mber_ncnm;
	}

	public void setMber_ncnm(String mber_ncnm) {
		this.mber_ncnm = mber_ncnm;
	}

	public String getMber_id() {
		return mber_id;
	}

	public void setMber_id(String mber_id) {
		this.mber_id = mber_id;
	}

	public String getMber_password() {
		return mber_password;
	}

	public void setMber_password(String mber_password) {
		this.mber_password = mber_password;
	}

	public String getMber_nm() {
		return mber_nm;
	}

	public void setMber_nm(String mber_nm) {
		this.mber_nm = mber_nm;
	}

	public String getMber_repo() {
		return mber_repo;
	}

	public void setMber_repo(String mber_repo) {
		this.mber_repo = mber_repo;
	}

	public String getMber_moblphon_no() {
		return mber_moblphon_no;
	}

	public void setMber_moblphon_no(String mber_moblphon_no) {
		this.mber_moblphon_no = mber_moblphon_no;
	}

	public String getMber_regist_de() {
		return mber_regist_de;
	}

	public void setMber_regist_de(String mber_regist_de) {
		this.mber_regist_de = mber_regist_de;
	}

	public String getMber_last_conect_on() {
		return mber_last_conect_on;
	}

	public void setMber_last_conect_on(String mber_last_conect_on) {
		this.mber_last_conect_on = mber_last_conect_on;
	}

	public String getMber_brthdy() {
		return mber_brthdy;
	}

	public void setMber_brthdy(String mber_brthdy) {
		this.mber_brthdy = mber_brthdy;
	}

	public String getMber_sexdstn() {
		return mber_sexdstn;
	}

	public void setMber_sexdstn(String mber_sexdstn) {
		this.mber_sexdstn = mber_sexdstn;
	}

	public String getMber_gitid() {
		return mber_gitid;
	}

	public void setMber_gitid(String mber_gitid) {
		this.mber_gitid = mber_gitid;
	}

	public String getMber_career_code() {
		return mber_career_code;
	}

	public void setMber_career_code(String mber_career_code) {
		this.mber_career_code = mber_career_code;
	}

	public String getMber_sttus_code() {
		return mber_sttus_code;
	}

	public void setMber_sttus_code(String mber_sttus_code) {
		this.mber_sttus_code = mber_sttus_code;
	}

	public String getMber_author_code() {
		return mber_author_code;
	}

	public void setMber_author_code(String mber_author_code) {
		this.mber_author_code = mber_author_code;
	}

	public String getMber_photo() {
		return mber_photo;
	}

	public void setMber_photo(String mber_photo) {
		this.mber_photo = mber_photo;
	}
	
	
	
}




