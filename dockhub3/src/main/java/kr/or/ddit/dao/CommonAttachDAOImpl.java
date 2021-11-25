package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.CommonAttachVO;

public class CommonAttachDAOImpl implements CommonAttachDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public void insertCommonAttachList(CommonAttachVO commonAttach) throws SQLException {
		session.insert("CommonAttach-Mapper.insertCommonAttach", commonAttach);
		
	}
	@Override
	public int selectAttachSeqNextVal() throws SQLException {
		return session.selectOne("CommonAttach-Mapper.selectAttachSeqNextVal");
	}
	@Override
	public List<CommonAttachVO> selectAttachByFileSn(int file_sn) throws SQLException {
		
		return session.selectList("CommonAttach-Mapper.selectAttachByFileSn",file_sn);
	}

	@Override
	public CommonAttachVO selectAttachForDown(CommonAttachVO commonAttach) throws SQLException {
		return session.selectOne("CommonAttach-Mapper.selectAttachForDown", commonAttach);
	}
	@Override
	public void deleteAttachByFileSn(int file_sn) throws SQLException {
		session.delete("CommonAttach-Mapper.deleteAttachByFileSn",file_sn);
	}


}
