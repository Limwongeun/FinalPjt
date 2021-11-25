package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.BestOfDockDAO;
import kr.or.ddit.dto.BestKnowhowVO;
import kr.or.ddit.dto.BestMemberVO;
import kr.or.ddit.dto.BestProjectVO;

public class BestOfDockServiceImpl implements BestOfDockService{
	
	private BestOfDockDAO bestOfDockDAO;
	public void setBestOfDockDAO(BestOfDockDAO bestOfDockDAO) {
		this.bestOfDockDAO = bestOfDockDAO;
	}
	
	
	@Override
	public Map<String, Object> bestMemberList() throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<BestMemberVO> bestMemberList = bestOfDockDAO.selectBestMember();
		
		dataMap.put("bestMemberList", bestMemberList);
		
		return dataMap;
	}
	
	@Override
	public Map<String, Object> bestKnowhowList() throws SQLException {
		Map<String, Object> dataMap = new HashMap<String,Object>();
		
		List<BestKnowhowVO> bestKnowhowList = bestOfDockDAO.selectBestKnowhow();
		
		dataMap.put("bestKnowhowList", bestKnowhowList);
		
		return dataMap;
	}
	
	@Override
	public Map<String, Object> bestProjectList() throws SQLException {
		Map<String, Object> dataMap = new HashMap<String,Object>();
		
		List<BestProjectVO> bestProjectList = bestOfDockDAO.selectBestProject();
		
		dataMap.put("bestProjectList", bestProjectList);
		
		return dataMap;
	}

}
