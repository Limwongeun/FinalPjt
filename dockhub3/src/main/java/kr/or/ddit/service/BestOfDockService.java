package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.Map;

public interface BestOfDockService {

	Map<String, Object> bestMemberList() throws SQLException;
	
	Map<String, Object> bestKnowhowList() throws SQLException;
	
	Map<String, Object> bestProjectList() throws SQLException;
}
