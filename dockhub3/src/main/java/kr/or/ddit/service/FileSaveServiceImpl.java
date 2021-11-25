package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.PageMaker;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dao.FileSaveDAO;
import kr.or.ddit.dto.FileSaveVO;

public class FileSaveServiceImpl implements FileSaveService {
	
	private FileSaveDAO fileSaveDAO;
	
	public void setFileSaveDAO(FileSaveDAO fileSaveDAO) {
		this.fileSaveDAO = fileSaveDAO;
	}

	@Override
	public List<FileSaveVO> selectFileSaveByPrjctSn(int sn) throws SQLException {
		List<FileSaveVO> projectList = fileSaveDAO.selectFileSaveByPrjctSn(sn);
		return projectList;
	}

	@Override
	public void updateNodeMove(FileSaveVO fileSaveVo) throws SQLException {
		fileSaveDAO.updateNodeMove(fileSaveVo);
		
	}

	@Override
	public void deleteNode(FileSaveVO fileSaveVo) throws SQLException {
		fileSaveDAO.deleteNode(fileSaveVo);
	}

	@Override
	public void renameNode(FileSaveVO fileSaveVo) throws SQLException {
		fileSaveDAO.renameNode(fileSaveVo);
		
	}

	@Override
	public void createNode(FileSaveVO fileSaveVo) throws SQLException {
		fileSaveDAO.createNode(fileSaveVo);
	}

	@Override
	public FileSaveVO getParent(int prjct_sn) throws SQLException {
		return fileSaveDAO.getParent(prjct_sn);
	}

	@Override
	public Map<String, Object> getFileList(int upper_file_sn, SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<FileSaveVO> fileList = fileSaveDAO.getFileList(upper_file_sn,cri);
		
		for (FileSaveVO fileSaveVO : fileList) {
			String fileTy = fileSaveVO.getFilesave_ty();
			if (fileTy!=null) {
				String fileName = fileSaveVO.getFilesave_nm().split("\\$\\$")[1];
				fileSaveVO.setFilesave_nm(fileName);					
			}
		
		}
		
		
		int cnt = fileSaveDAO.fileCnt(upper_file_sn);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(cnt);
		
		dataMap.put("fileList", fileList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public void fileUpload(FileSaveVO fileSave) throws SQLException {
		fileSaveDAO.fileUpload(fileSave);
	}

	@Override
	public FileSaveVO selectFileByFileSn(int filesave_sn) throws SQLException {
		return fileSaveDAO.selectFileByFileSn(filesave_sn);
	}

	@Override
	public List<FileSaveVO> selectFileSaveByMber(String filesave_crtr) throws SQLException {
		List<FileSaveVO> projectList = fileSaveDAO.selectFileSaveByMber(filesave_crtr);
		return projectList;
	}

	@Override
	public String selectParentByFileSn(int filesave_sn) throws SQLException {
		return fileSaveDAO.selectParentByFileSn(filesave_sn);
	}

	@Override
	public void updateAuthor(FileSaveVO file) throws SQLException {
		fileSaveDAO.updateAuthor(file);
	}

	






}
