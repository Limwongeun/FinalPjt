package kr.or.ddit.command;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.dto.FileSaveVO;

public class FileSaveCommand {
	private List<MultipartFile> uploadFile;
	private int nodeId;
	private int prjct_sn;
//	
//	public int getUnit_job_sn() {
//		return unit_job_sn;
//	}
//
//	public void setUnit_job_sn(int unit_job_sn) {
//		this.unit_job_sn = unit_job_sn;
//	}

	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}

	public int getNodeId() {
		return nodeId;
	}

	public int getPrjct_sn() {
		return prjct_sn;
	}

	public void setNodeId(int nodeId) {
		this.nodeId = nodeId;
	}

	public void setPrjct_sn(int prjct_sn) {
		this.prjct_sn = prjct_sn;
	}

	public FileSaveVO toFileSaveVO() {
		FileSaveVO file = new FileSaveVO();
		file.setUpper_file_sn(this.nodeId);
		file.setPrjct_sn(prjct_sn);
		return file;
	}
}
