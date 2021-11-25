package kr.or.ddit.command;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.dto.KnowhowVO;

public class KnowhowRegistCommand {

	private String knh_title;
	private String knh_content;
	private String mber_sn;
	private List<MultipartFile> uploadFile;
	private String mber_ncnm;
	
	public String getKnh_title() {
		return knh_title;
	}
	public void setKnh_title(String knh_title) {
		this.knh_title = knh_title;
	}
	public String getKnh_content() {
		return knh_content;
	}
	public void setKnh_content(String knh_content) {
		this.knh_content = knh_content;
	}
	public String getMber_sn() {
		return mber_sn;
	}
	public void setMber_sn(String mber_sn) {
		this.mber_sn = mber_sn;
	}
	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	public String getMber_ncmn() {
		return mber_ncnm;
	}
	public void setMber_ncmn(String mber_ncnm) {
		this.mber_ncnm = mber_ncnm;
	}
	
	public KnowhowVO toKnowhowVO() {
		KnowhowVO knowhow = new KnowhowVO();
		knowhow.setKnh_content(knh_content);
		knowhow.setKnh_title(knh_title);
		knowhow.setMber_sn(mber_sn);
		knowhow.setMber_ncnm(mber_ncnm);
		
		return knowhow;
	}
}
