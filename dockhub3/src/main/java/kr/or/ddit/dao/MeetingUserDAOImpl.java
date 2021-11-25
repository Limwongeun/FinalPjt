package kr.or.ddit.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.MeetingUserVO;

public class MeetingUserDAOImpl implements MeetingUserDAO{

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}	
	

}
