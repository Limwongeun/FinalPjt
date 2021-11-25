package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.BestKnowhowVO;
import kr.or.ddit.dto.BestMemberVO;
import kr.or.ddit.dto.BestProjectVO;

public interface BestOfDockDAO {

	List<BestMemberVO> selectBestMember() throws SQLException;
	
	List<BestKnowhowVO> selectBestKnowhow() throws SQLException;
	
	List<BestProjectVO> selectBestProject() throws SQLException;
}
