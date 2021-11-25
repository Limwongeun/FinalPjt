package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dao.CommonAttachDAO;
import kr.or.ddit.dto.CommonAttachVO;

public class CommonAttachServiceImpl implements CommonAttachService {

	private CommonAttachDAO commonAttachDAO;
	
	public void setCommonAttachDAO(CommonAttachDAO commonAttachDAO) {
		this.commonAttachDAO = commonAttachDAO;
	}

	@Override
	public void insertCommonAttachList(List<CommonAttachVO> commonAttachList, String writer,int file_sn) throws SQLException {
		
		for (int i = 0; i < commonAttachList.size(); i++) {
			CommonAttachVO commonAttach = commonAttachList.get(i);
			commonAttach.setFile_wrter(writer);
			commonAttach.setFile_ordr(i);
			commonAttach.setFile_sn(file_sn);
			commonAttachDAO.insertCommonAttachList(commonAttach);
		}
	
	}

	@Override
	public List<CommonAttachVO> selectAttachByFileSn(int file_sn) throws SQLException {
		
		return commonAttachDAO.selectAttachByFileSn(file_sn);
	}

	@Override
	public CommonAttachVO selectAttachForDown(CommonAttachVO commonAttach) throws SQLException {
		return commonAttachDAO.selectAttachForDown(commonAttach);
	}

	@Override
	public void deleteAttachByFileSn(int file_sn) throws SQLException {
		commonAttachDAO.deleteAttachByFileSn(file_sn);
	}

	@Override
	public int selectAttachSeqNextVal() throws SQLException {
		return commonAttachDAO.selectAttachSeqNextVal();
	}

	

	
}
