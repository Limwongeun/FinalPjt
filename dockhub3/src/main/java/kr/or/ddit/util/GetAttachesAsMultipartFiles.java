package kr.or.ddit.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.command.FileSaveCommand;
import kr.or.ddit.dto.CommonAttachVO;
import kr.or.ddit.dto.FileSaveVO;
import kr.or.ddit.dto.MemberVO;

public class GetAttachesAsMultipartFiles {
	
	//지아 파일 보관함!!!!!!!!!!!!!!!!!!!!
	public static List<FileSaveVO> save(FileSaveCommand filesave, String savePath, MemberVO member) 
																		throws Exception{
		List<FileSaveVO> attachList = new ArrayList<FileSaveVO>();
		List<MultipartFile> multiFiles = filesave.getUploadFile();
		
		//저장 -> attachVO -> list.add
		if (multiFiles != null) {
			for (MultipartFile multi : multiFiles) {
				String fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
				File target = new File(savePath,fileName);
				target.mkdirs();
				multi.transferTo(target);
				
				FileSaveVO file = new FileSaveVO();
				file.setFilesize(target.length());
				file.setFilesave_crtr(member.getMber_sn());
				file.setFilesave_pth(savePath);
				file.setFilesave_nm(fileName);
				file.setFilesave_ty(fileName.substring(fileName.lastIndexOf(".")+1));
				file.setPrjct_sn(filesave.getPrjct_sn());
				file.setFilesave_author_code("0");
				if (filesave.getPrjct_sn()==0) {
					file.setFilesave_se_code("1");
				}else {
					file.setFilesave_se_code("0");
					
				}
				file.setUpper_file_sn(filesave.getNodeId());
				attachList.add(file);
			}
		}
		
		return attachList;
	}
	
	public static List<CommonAttachVO> commonSave(List<MultipartFile> multiFiles, String savePath, String fileJobCode) 
			throws Exception{
		List<CommonAttachVO> commonAttachList = new ArrayList<CommonAttachVO>();
		
		//저장 -> attachVO -> list.add
		if (multiFiles != null) {
			for (MultipartFile multi : multiFiles) {
				String fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
				File target = new File(savePath,fileName);
				
				target.mkdirs();
				multi.transferTo(target);
				
				CommonAttachVO attach = new CommonAttachVO();
				attach.setFile_size(target.length());
				attach.setFlpth(savePath);
				attach.setFile_nm(fileName);
				attach.setFile_ty(fileName.substring(fileName.lastIndexOf(".")+1));
				attach.setFile_job_se_code(fileJobCode);
				commonAttachList.add(attach);
			}
		}
		
		return commonAttachList;
	}
			
	
	
/*	public static FileSaveVO upload(FileSaveCommand filesave, String savePath) 
			throws Exception{
		FileSaveVO file = new FileSaveVO();
		
		if (filesave.getUploadFile() != null) {
			
			String fileName = MakeFileName.toUUIDFileName(filesave.getUploadFile().getOriginalFilename(), "$$");
			File target = new File(savePath,fileName);
			
			target.mkdirs();
			filesave.getUploadFile().transferTo(target);
			
			System.out.println("unit ///////////"+filesave.getUnit_job_sn());
			System.out.println("node ////////////"+filesave.getNodeId());
			file.setFilesave_pth(savePath);
			file.setFilesave_nm(fileName);
			file.setFilesave_ty(fileName.substring(fileName.lastIndexOf(".")+1));
			file.setUnit_job_sn(filesave.getUnit_job_sn());
			file.setPrjct_sn(filesave.getPrjct_sn());
			file.setUpper_file_sn(filesave.getNodeId());
		}
		
		return file;
	}	*/
	


}
