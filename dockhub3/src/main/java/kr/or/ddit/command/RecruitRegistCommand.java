package kr.or.ddit.command;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.dto.RecruitVO;

public class RecruitRegistCommand {
	
	private String pblanc_sj;
	private String pblanc_wrter;
	private String pblanc_cn;
	private int prjct_sn;
	private String pblanc_bgnde;
	private String pblanc_clos_de;
	private int file_sn;
	private List<MultipartFile> uploadFile;
	
	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getPblanc_sj() {
		return pblanc_sj;
	}
	public void setPblanc_sj(String pblanc_sj) {
		this.pblanc_sj = pblanc_sj;
	}
	public String getPblanc_wrter() {
		return pblanc_wrter;
	}
	public void setPblanc_wrter(String pblanc_wrter) {
		this.pblanc_wrter = pblanc_wrter;
	}
	public int getFile_sn() {
		return file_sn;
	}
	public void setFile_sn(int file_sn) {
		this.file_sn = file_sn;
	}
	public String getPblanc_cn() {
		return pblanc_cn;
	}
	public void setPblanc_cn(String pblanc_cn) {
		this.pblanc_cn = pblanc_cn;
	}
	public int getPrjct_sn() {
		return prjct_sn;
	}
	public void setPrjct_sn(int prjct_sn) {
		this.prjct_sn = prjct_sn;
	}
	public String getPblanc_bgnde() {
		return pblanc_bgnde;
	}
	public void setPblanc_bgnde(String pblanc_bgnde) {
		this.pblanc_bgnde = pblanc_bgnde;
	}
	public String getPblanc_clos_de() {
		return pblanc_clos_de;
	}
	public void setPblanc_clos_de(String pblanc_clos_de) {
		this.pblanc_clos_de = pblanc_clos_de;
	}
	
	
	public RecruitVO toRecruitVO() {
		RecruitVO recruit = new RecruitVO();
		recruit.setPblanc_sj(pblanc_sj);
		recruit.setPblanc_wrter(pblanc_wrter);
		recruit.setPblanc_cn(pblanc_cn);
		recruit.setPrjct_sn(prjct_sn);
		recruit.setPblanc_bgnde(pblanc_bgnde);
		recruit.setPblanc_clos_de(pblanc_clos_de);
		
		return recruit;
		}
	}
	
	
	
	
