package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.MemberVO;

public class MypageDAOImpl implements MypageDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<MemberVO> selectRepo(String mber_sn) {
		List<MemberVO> memRepo = session.selectList("Mypage-Mapper.selectRepo", mber_sn);
		return memRepo;
	}

	@Override
	public void insertRepo(MemberVO member) {
		session.update("Mypage-Mapper.updateRepository", member);
	}

	@Override
	public void deleteRepo(String mber_sn) {
		session.update("Mypage-Mapper.deleteRepository", mber_sn);
	}

	@Override
	public int selectProjectCount(String mber_sn) throws SQLException {
		int count = session.selectOne("Mypage-Mapper.selectProjectCount1",mber_sn);
		return count;
	}

	@Override
	public int selectIssueCount(String mber_sn) throws SQLException {
		int count = session.selectOne("Mypage-Mapper.selectIssueCount",mber_sn);
		return count;
	}

	@Override
	public int selectIssueOpen(String mber_sn) throws SQLException {
		int count = session.selectOne("Mypage-Mapper.selectIssueOpen",mber_sn);
		return count;
	}

	@Override
	public int selectIssueClose(String mber_sn) throws SQLException {
		int count = session.selectOne("Mypage-Mapper.selectIssueClose",mber_sn);
		return count;
	}

	@Override
	public int selectDutychargeCount(String mber_sn) throws SQLException {
		int count = session.selectOne("Mypage-Mapper.selectDutychargeCount",mber_sn);
		return count;
	}

	@Override
	public int selectFileCount(String mber_sn) throws SQLException {
		int count = session.selectOne("Mypage-Mapper.selectFileCount",mber_sn);
		return count;
	}

	
	
}