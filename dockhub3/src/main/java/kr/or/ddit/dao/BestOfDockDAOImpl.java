package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.BestKnowhowVO;
import kr.or.ddit.dto.BestMemberVO;
import kr.or.ddit.dto.BestProjectVO;

public class BestOfDockDAOImpl implements BestOfDockDAO{

	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	
	@Override
	public List<BestMemberVO> selectBestMember() throws SQLException {
		List<BestMemberVO> bestMemberList = session.selectList("BestOfDock-Mapper.selectBestMember");
		return bestMemberList;
	}
	
	@Override
	public List<BestKnowhowVO> selectBestKnowhow() throws SQLException {
		List<BestKnowhowVO> bestKnowhowList = session.selectList("BestOfDock-Mapper.selectBestKnowhow");
		return bestKnowhowList;
	}
	
	@Override
	public List<BestProjectVO> selectBestProject() throws SQLException {
		List<BestProjectVO> bestProjectList = session.selectList("BestOfDock-Mapper.selectBestProject");
		return bestProjectList;
	}
}
