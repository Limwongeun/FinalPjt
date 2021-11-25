package kr.or.ddit.command;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.dto.ProjectVO;

public class ProjectModifyCommand {
	
	private int prjct_sn;
	private String prjct_sj;
	private String prjct_cn;
	private String prjct_endde;
	private String prjct_actvty_sttus_code;
	private String prjct_othbc_at_code;
	private MultipartFile prjct_photo; // 사진
	private String oldPhoto; //이전 사진 
	private String uploadPhoto; //변경된 사진
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
	public String getPrjct_endde() {
		return prjct_endde;
	}
	public void setPrjct_endde(String prjct_endde) {
		this.prjct_endde = prjct_endde;
	}
	public String getPrjct_actvty_sttus_code() {
		return prjct_actvty_sttus_code;
	}
	public void setPrjct_actvty_sttus_code(String prjct_actvty_sttus_code) {
		this.prjct_actvty_sttus_code = prjct_actvty_sttus_code;
	}
	public String getPrjct_othbc_at_code() {
		return prjct_othbc_at_code;
	}
	public void setPrjct_othbc_at_code(String prjct_othbc_at_code) {
		this.prjct_othbc_at_code = prjct_othbc_at_code;
	}
	public MultipartFile getPrjct_photo() {
		return prjct_photo;
	}
	public void setPrjct_photo(MultipartFile prjct_photo) {
		this.prjct_photo = prjct_photo;
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


	public ProjectVO toProject() {
		ProjectVO project = new ProjectVO();
		
		project.setPrjct_sn(prjct_sn);
		project.setPrjct_sj(prjct_sj);
		project.setPrjct_cn(prjct_cn);
		project.setPrjct_endde(prjct_endde);
		project.setPrjct_actvty_sttus_code(prjct_actvty_sttus_code);
		project.setPrjct_othbc_at_code(prjct_othbc_at_code);
		
		
		return project;
	}



}
