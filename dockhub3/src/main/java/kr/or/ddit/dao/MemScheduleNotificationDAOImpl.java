package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.MemScheduleNotificationVO;
import kr.or.ddit.dto.ProjectScheduleNotificationVO;

public class MemScheduleNotificationDAOImpl implements MemScheduleNotificationDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	
	@Override
	public void insertMemberScheduleNotification(MemScheduleNotificationVO memScheduleNotification)
			throws SQLException {
		session.update("Notification-Mapper.insertMemberScheduleNotification",memScheduleNotification);
	}


	@Override
	public int getNotificationSeqNextValue() throws SQLException {
		int mber_ntcn_sn =session.selectOne("Notification-Mapper.selectCalendarSeqNext");
		return mber_ntcn_sn;
	}
	
	@Override
	public List<MemScheduleNotificationVO> selectNotification(int mber_sn) throws SQLException {
		List<MemScheduleNotificationVO> oneHourlist =
				session.selectList("Notification-Mapper.selectMemberScheduleNotificationHours",mber_sn);
		return oneHourlist;
	}


	@Override
	public int selectNewNotificationCount(int mber_sn) throws SQLException {
		int cnt = session.selectOne("Notification-Mapper.selectMemberScheduleNotificationCount",mber_sn);
		return cnt;
	}


	@Override
	public void updateNotification(int mber_ntcn_sn) throws SQLException {
		session.update("Notification-Mapper.updateMemberScheduleNotification",mber_ntcn_sn);
	}


	@Override
	public void insertProjectScheduleNotification(ProjectScheduleNotificationVO prjctScheduleNotification)
			throws SQLException {

		session.update("Notification-Mapper.insertProjectScheduleNotification",prjctScheduleNotification);

	}
}
