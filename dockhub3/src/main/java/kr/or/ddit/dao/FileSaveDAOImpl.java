package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.FileSaveVO;

public class FileSaveDAOImpl implements FileSaveDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public List<FileSaveVO> selectFileSaveByPrjctSn(int sn) throws SQLException {
		List<FileSaveVO> fileList = session.selectList("FileSave-Mapper.selectFileSaveByPrjctSn",sn);
		return fileList;
	}
	@Override
	public void updateNodeMove(FileSaveVO fileSaveVo) throws SQLException {
		session.update("FileSave-Mapper.moveNode",fileSaveVo);
	}
	@Override
	public void deleteNode(FileSaveVO fileSaveVo) throws SQLException {
		session.update("FileSave-Mapper.deleteNode",fileSaveVo);
	}
	@Override
	public void renameNode(FileSaveVO fileSaveVo) throws SQLException {
		session.update("FileSave-Mapper.renameNode",fileSaveVo);
	}
	@Override
	public void createNode(FileSaveVO fileSaveVo) throws SQLException {
		session.insert("FileSave-Mapper.insertNode",fileSaveVo);
	}
	@Override
	public FileSaveVO getParent(int prjct_sn) throws SQLException {
		FileSaveVO parent = session.selectOne("FileSave-Mapper.getParent",prjct_sn);
		return parent;
	}
	@Override
	public List<FileSaveVO> getFileList(int upper_file_sn,SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<FileSaveVO> fileList = session.selectList("FileSave-Mapper.getFileList",upper_file_sn,rowBounds);
		return fileList;
	}
	@Override
	public int fileCnt(int upper_file_sn) throws SQLException {
		return session.selectOne("FileSave-Mapper.getCountFile", upper_file_sn);
	}
	@Override
	public void fileUpload(FileSaveVO fileSave) throws SQLException {
		session.insert("FileSave-Mapper.fileUpload", fileSave);
		
	}
	@Override
	public FileSaveVO selectFileByFileSn(int filesave_sn) throws SQLException {
		return session.selectOne("FileSave-Mapper.selectFileByFileSn",filesave_sn);
	}
	@Override
	public List<FileSaveVO> selectFileSaveByMber(String filesave_crtr) throws SQLException {
		List<FileSaveVO> fileList = session.selectList("MyFile-Mapper.selectFileSaveByMber",filesave_crtr);
		return fileList;
	}
	@Override
	public String selectParentByFileSn(int filesave_sn) throws SQLException {
		return session.selectOne("FileSave-Mapper.selectParentByFileSn",filesave_sn);
	}
	@Override
	public void updateAuthor(FileSaveVO file) throws SQLException {
		session.update("FileSave-Mapper.updateAuthor",file);
	}
	
	
	

}
