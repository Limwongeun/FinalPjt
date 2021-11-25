package kr.or.ddit.dto;

import java.util.List;

public class ProjectVO {
	private int prjct_sn;
	private String prjct_sj;
	private String prjct_cn;
	private String prjct_bgnde;
	private String prjct_endde;
	private String prjct_actvty_sttus_code;
	private String prjct_othbc_at_code;
	private String prjct_crtr;
	private String prjct_creat_on;
	private int prjct_scrap_co;
	private int prjctr_like_co;
	private String prjct_photo;
	private int group_sn;
	private int team_sn;
	private String prjct_gitid;
	private String prjct_repo;
	private String prjct_job_type_code;
	//쓰려고 만든거
	private String prjct_ing;
	private int user_cnt;
	private int prjct_author_code;
	private String mber_sn;
	private int issuePro;
	private int dutyPro;
	private List<MemberVO> memList;
	private int rownum;
	
	public String getPrjct_job_type_code() {
		return prjct_job_type_code;
	}

	public void setPrjct_job_type_code(String prjct_job_type_code) {
		this.prjct_job_type_code = prjct_job_type_code;
	}

	public List<MemberVO> getMemList() {
		return memList;
	}

	public void setMemList(List<MemberVO> memList) {
		this.memList = memList;
	}

	public int getIssuePro() {
		return issuePro;
	}

	public int getDutyPro() {
		return dutyPro;
	}

	public void setIssuePro(int issuePro) {
		this.issuePro = issuePro;
	}

	public void setDutyPro(int dutyPro) {
		this.dutyPro = dutyPro;
	}

	public int getPrjct_author_code() {
		return prjct_author_code;
	}

	public String getMber_sn() {
		return mber_sn;
	}

	public void setMber_sn(String mber_sn) {
		this.mber_sn = mber_sn;
	}

	public void setPrjct_author_code(int prjct_author_code) {
		this.prjct_author_code = prjct_author_code;
	}

	public int getUser_cnt() {
		return user_cnt;
	}
	public void setUser_cnt(int user_cnt) {
		this.user_cnt = user_cnt;
	}
	public String getPrjct_ing() {
		return prjct_ing;
	}
	public void setPrjct_ing(String prjct_ing) {
		this.prjct_ing = prjct_ing;
	}
	public int getPrjct_sn() {
		return prjct_sn;
	}
	public void setPrjct_sn(int prjct_sn) {
		this.prjct_sn = prjct_sn;
	}
	public String getPrjct_sj() {
		return prjct_sj;
	}
	public void setPrjct_sj(String prjct_sj) {
		this.prjct_sj = prjct_sj;
	}
	public String getPrjct_cn() {
		return prjct_cn;
	}
	public void setPrjct_cn(String prjct_cn) {
		this.prjct_cn = prjct_cn;
	}
	public String getPrjct_bgnde() {
		return prjct_bgnde;
	}
	public void setPrjct_bgnde(String prjct_bgnde) {
		this.prjct_bgnde = prjct_bgnde;
	}
	public String getPrjct_endde() {
		return prjct_endde;
	}
	public void setPrjct_endde(String prjct_endde) {
		this.prjct_endde = prjct_endde;
	}

	public String getPrjct_actvty_sttus_code() {
		return prjct_actvty_sttus_code;
	}
	public String getPrjct_othbc_at_code() {
		return prjct_othbc_at_code;
	}
	public void setPrjct_actvty_sttus_code(String prjct_actvty_sttus_code) {
		this.prjct_actvty_sttus_code = prjct_actvty_sttus_code;
	}
	public void setPrjct_othbc_at_code(String prjct_othbc_at_code) {
		this.prjct_othbc_at_code = prjct_othbc_at_code;
	}
	public String getPrjct_crtr() {
		return prjct_crtr;
	}
	public void setPrjct_crtr(String prjct_crtr) {
		this.prjct_crtr = prjct_crtr;
	}
	public String getPrjct_creat_on() {
		return prjct_creat_on;
	}
	public void setPrjct_creat_on(String prjct_creat_on) {
		this.prjct_creat_on = prjct_creat_on;
	}
	public int getPrjct_scrap_co() {
		return prjct_scrap_co;
	}
	public void setPrjct_scrap_co(int prjct_scrap_co) {
		this.prjct_scrap_co = prjct_scrap_co;
	}
	public int getPrjctr_like_co() {
		return prjctr_like_co;
	}
	public void setPrjctr_like_co(int prjctr_like_co) {
		this.prjctr_like_co = prjctr_like_co;
	}
	public String getPrjct_photo() {
		return prjct_photo;
	}
	public void setPrjct_photo(String prjct_photo) {
		this.prjct_photo = prjct_photo;
	}
	public int getGroup_sn() {
		return group_sn;
	}
	public void setGroup_sn(int group_sn) {
		this.group_sn = group_sn;
	}
	public int getTeam_sn() {
		return team_sn;
	}
	public void setTeam_sn(int team_sn) {
		this.team_sn = team_sn;
	}
	public String getPrjct_gitid() {
		return prjct_gitid;
	}
	public void setPrjct_gitid(String prjct_gitid) {
		this.prjct_gitid = prjct_gitid;
	}
	public String getPrjct_repo() {
		return prjct_repo;
	}
	public void setPrjct_repo(String prjct_repo) {
		this.prjct_repo = prjct_repo;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	
	
	
}




