package kr.or.ddit.dto;

import java.util.Date;

public class CommonAttachVO {
	private int file_sn;
	private int file_ordr;
	private String file_wrter;
	private String file_nm;
	private String flpth;
	private String file_ty;
	private long file_size;
	private Date file_rgsde;
	private String file_job_se_code;
	public int getFile_sn() {
		return file_sn;
	}
	public int getFile_ordr() {
		return file_ordr;
	}
	public String getFile_wrter() {
		return file_wrter;
	}
	public String getFile_nm() {
		return file_nm;
	}
	public String getFlpth() {
		return flpth;
	}
	public String getFile_ty() {
		return file_ty;
	}

	public Date getFile_rgsde() {
		return file_rgsde;
	}
	public String getFile_job_se_code() {
		return file_job_se_code;
	}
	public void setFile_sn(int file_sn) {
		this.file_sn = file_sn;
	}
	public void setFile_ordr(int file_ordr) {
		this.file_ordr = file_ordr;
	}
	public void setFile_wrter(String file_wrter) {
		this.file_wrter = file_wrter;
	}
	public void setFile_nm(String file_nm) {
		this.file_nm = file_nm;
	}
	public void setFlpth(String flpth) {
		this.flpth = flpth;
	}
	public void setFile_ty(String file_ty) {
		this.file_ty = file_ty;
	}

	public long getFile_size() {
		return file_size;
	}
	public void setFile_size(long file_size) {
		this.file_size = file_size;
	}
	public void setFile_rgsde(Date file_rgsde) {
		this.file_rgsde = file_rgsde;
	}
	public void setFile_job_se_code(String file_job_se_code) {
		this.file_job_se_code = file_job_se_code;
	}
	
	
}
