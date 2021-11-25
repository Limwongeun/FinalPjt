package kr.or.ddit.dto;

public class GroupInviteVO {

	
	private int group_invite_sn;	//	그룹초대일련번호
	private String group_invite_de;	//그룹초대날짜
	private String group_invite_res_de;//그룹초대응답날짜
	private String group_invite_sttus;//그룹초대상태 0:대기, 1:승인, 2:거절
	private int group_sn;//그룹일련번호
	private int mber_sn;//	회원 일련번호
	private String group_chief; //치프
	private String group_nm;
	private String group_count;
	private String group_job_type_code;
	public int getGroup_invite_sn() {
		return group_invite_sn;
	}
	public void setGroup_invite_sn(int group_invite_sn) {
		this.group_invite_sn = group_invite_sn;
	}
	public String getGroup_invite_de() {
		return group_invite_de;
	}
	public void setGroup_invite_de(String group_invite_de) {
		this.group_invite_de = group_invite_de;
	}
	public String getGroup_invite_res_de() {
		return group_invite_res_de;
	}
	public void setGroup_invite_res_de(String group_invite_res_de) {
		this.group_invite_res_de = group_invite_res_de;
	}
	
	public String getGroup_invite_sttus() {
		return group_invite_sttus;
	}
	public void setGroup_invite_sttus(String group_invite_sttus) {
		this.group_invite_sttus = group_invite_sttus;
	}
	public int getGroup_sn() {
		return group_sn;
	}
	public void setGroup_sn(int group_sn) {
		this.group_sn = group_sn;
	}
	public int getMber_sn() {
		return mber_sn;
	}
	public void setMber_sn(int mber_sn) {
		this.mber_sn = mber_sn;
	}
	public String getGroup_chief() {
		return group_chief;
	}
	public void setGroup_chief(String group_chief) {
		this.group_chief = group_chief;
	}
	public String getGroup_nm() {
		return group_nm;
	}
	public void setGroup_nm(String group_nm) {
		this.group_nm = group_nm;
	}
	public String getGroup_count() {
		return group_count;
	}
	public void setGroup_count(String group_count) {
		this.group_count = group_count;
	}
	public String getGroup_job_type_code() {
		return group_job_type_code;
	}
	public void setGroup_job_type_code(String group_job_type_code) {
		this.group_job_type_code = group_job_type_code;
	}
	

	
	
	
}
