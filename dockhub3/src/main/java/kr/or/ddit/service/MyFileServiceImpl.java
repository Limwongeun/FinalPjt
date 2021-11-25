package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.PageMaker;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dao.MyFileDAO;
import kr.or.ddit.dto.FileSaveVO;

public class MyFileServiceImpl implements MyFileService {
	
	private MyFileDAO myFileDAO;
	
	public void setMyFileDAO(MyFileDAO myFileDAO) {
		this.myFileDAO = myFileDAO;
	}



	@Override
	public Map<String, Object> getFileList(SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<FileSaveVO> fileList = myFileDAO.selectFileByMberSn(cri);
		
		for (FileSaveVO fileSaveVO : fileList) {
			String fileTy = fileSaveVO.getFilesave_ty();
			if (fileTy!=null) {
				String fileName = fileSaveVO.getFilesave_nm().split("\\$\\$")[1];
				fileSaveVO.setFilesave_nm(fileName);					
			}
		
		}
		
		
		int cnt = myFileDAO.fileCnt(cri.getMber_sn());
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(cnt);
		
		dataMap.put("fileList", fileList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}



	@Override
	public List<FileSaveVO> selectIcon(String mber_sn) throws SQLException {
		return myFileDAO.selectIcon(mber_sn);
	}



	@Override
	public int selectPrjctByFile(int filesave_sn) throws SQLException {
		return myFileDAO.selectPrjctByFile(filesave_sn);
	}



	@Override
	public Map<String, Object> getFileList1(FileSaveVO file, SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<FileSaveVO> fileList = myFileDAO.getFileList(file, cri);
		
		for (FileSaveVO fileSaveVO : fileList) {
			String fileTy = fileSaveVO.getFilesave_ty();
			if (fileTy!=null) {
				String fileName = fileSaveVO.getFilesave_nm().split("\\$\\$")[1];
				fileSaveVO.setFilesave_nm(fileName);					
			}
		
		}
		
		
		int cnt = myFileDAO.fileCnt1(file);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(cnt);
		
		dataMap.put("fileList", fileList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}



}
