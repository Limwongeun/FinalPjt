package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.FileSaveVO;

public class MyFileDAOImpl implements MyFileDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<FileSaveVO> selectFileByMberSn( SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("MyFile-Mapper.selectFileByMberSn",cri, rowBounds);
	}

	@Override
	public int fileCnt(String mber_sn) throws SQLException {
		return session.selectOne("MyFile-Mapper.getCountFile", mber_sn);
	}

	@Override
	public List<FileSaveVO> selectIcon(String mber_sn) throws SQLException {
		
		return session.selectList("MyFile-Mapper.selectIcon",mber_sn);
	}

	@Override
	public int selectPrjctByFile(int filesave_sn) throws SQLException {
		return session.selectOne("MyFile-Mapper.selectPrjctByFile",filesave_sn);
	}

	@Override
	public List<FileSaveVO> getFileList(FileSaveVO file, SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("MyFile-Mapper.getFileList1",file,rowBounds);
	}

	@Override
	public int fileCnt1(FileSaveVO file) throws SQLException {
		return session.selectOne("MyFile-Mapper.getCountFile1",file);
	}
	
	

}
