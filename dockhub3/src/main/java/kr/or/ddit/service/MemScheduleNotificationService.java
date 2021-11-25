package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.MemScheduleNotificationVO;
import kr.or.ddit.dto.ProjectScheduleNotificationVO;

public interface MemScheduleNotificationService {

	public void regist(MemScheduleNotificationVO memScheduleNotification) throws SQLException;
	
	public List<MemScheduleNotificationVO> selectScheduleNotification(int mber_sn) throws SQLException;
	
	public int selectNewNotificationCount(int mber_sn) throws SQLException;
	
	public void updateNotification(int mber_ntcn_sn) throws SQLException;
	
	//프로젝트 알림
	public void projectRegist(ProjectScheduleNotificationVO prjctScheduleNotification) throws SQLException;
}
