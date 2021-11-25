package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.MemScheduleNotificationVO;
import kr.or.ddit.dto.ProjectScheduleNotificationVO;

public interface MemScheduleNotificationDAO {

	//일정 추가
	public void insertMemberScheduleNotification(MemScheduleNotificationVO memScheduleNotification) throws SQLException;

	//시퀀스
	int getNotificationSeqNextValue() throws SQLException;

	//리스트
	public List<MemScheduleNotificationVO> selectNotification(int mber_sn) throws SQLException;
	
	//카운트
	public int selectNewNotificationCount(int mber_sn) throws SQLException;
	
	//클릭시 알림제거
	public void updateNotification(int mber_ntcn_sn) throws SQLException;
	
	//프로젝트 일정 추가
	public void insertProjectScheduleNotification(ProjectScheduleNotificationVO prjctScheduleNotification) throws SQLException;
	
}
