package kr.or.ddit.command;

import kr.or.ddit.dto.GroupVO;

public class GroupRegistCommand {

	private String group_nm; // 이름
	private String group_actvty_at_code; // 활성여부코드 0:비활성, 1:활성
	private String group_othbc_at_code; // 공개여부코드 0:비공개, 1:공개, 2:그릅원
	private String group_job_type_code; // 작업유형코드 0:오픈소스프로젝트, 1:교육프로젝트, 2:개인프로젝트, 3:작업프로젝트
	private String group_cn; // 그룹 설명
	private int mber_sn;
	
	public String getGroup_nm() {
		return group_nm;
	}
	public void setGroup_nm(String group_nm) {
		this.group_nm = group_nm;
	}
	public String getGroup_actvty_at_code() {
		return group_actvty_at_code;
	}
	public void setGroup_actvty_at_code(String group_actvty_at_code) {
		this.group_actvty_at_code = group_actvty_at_code;
	}
	public String getGroup_othbc_at_code() {
		return group_othbc_at_code;
	}
	public void setGroup_othbc_at_code(String group_othbc_at_code) {
		this.group_othbc_at_code = group_othbc_at_code;
	}
	public String getGroup_job_type_code() {
		return group_job_type_code;
	}
	public void setGroup_job_type_code(String group_job_type_code) {
		this.group_job_type_code = group_job_type_code;
	}
	public String getGroup_cn() {
		return group_cn;
	}
	public void setGroup_cn(String group_cn) {
		this.group_cn = group_cn;
	}
	
	
	public int getMber_sn() {
		return mber_sn;
	}
	public void setMber_sn(int mber_sn) {
		this.mber_sn = mber_sn;
	}
	
	public GroupVO toGroupVO() {
		
		GroupVO group = new GroupVO();
		
		group.setGroup_nm(group_nm);
		group.setGroup_actvty_at_code(group_actvty_at_code);
		group.setGroup_cn(group_cn);
		group.setGroup_job_type_code(group_job_type_code);
		group.setGroup_othbc_at_code(group_othbc_at_code);
		group.setMber_sn(mber_sn);
		return group;
	}
}
