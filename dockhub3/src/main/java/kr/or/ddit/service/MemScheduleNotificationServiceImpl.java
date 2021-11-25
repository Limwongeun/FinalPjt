package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dao.MemScheduleNotificationDAO;
import kr.or.ddit.dto.MemScheduleNotificationVO;
import kr.or.ddit.dto.ProjectScheduleNotificationVO;

public class MemScheduleNotificationServiceImpl implements MemScheduleNotificationService {
	
	private MemScheduleNotificationDAO memScheduleNotificationDAO;

	public void setMemScheduleNotification(MemScheduleNotificationDAO memScheduleNotification) {
		this.memScheduleNotificationDAO = memScheduleNotification;
	}
	
	@Override
	public void regist(MemScheduleNotificationVO memScheduleNotification) throws SQLException {
		
		int mber_ntcn_sn = memScheduleNotificationDAO.getNotificationSeqNextValue();
		memScheduleNotification.setMber_ntcn_sn(mber_ntcn_sn);
		
		memScheduleNotificationDAO.insertMemberScheduleNotification(memScheduleNotification);
	}

	@Override
	public List<MemScheduleNotificationVO> selectScheduleNotification(int mber_sn) throws SQLException {
		List<MemScheduleNotificationVO> selectScheduleNotification = 
				memScheduleNotificationDAO.selectNotification(mber_sn);
		return selectScheduleNotification;
	}

	@Override
	public int selectNewNotificationCount(int mber_sn) throws SQLException {
		int cnt = memScheduleNotificationDAO.selectNewNotificationCount(mber_sn);
		return cnt;
	}

	@Override
	public void updateNotification(int mber_ntcn_sn) throws SQLException {
		memScheduleNotificationDAO.updateNotification(mber_ntcn_sn);
	}
	
	@Override
	public void projectRegist(ProjectScheduleNotificationVO prjctScheduleNotification) throws SQLException {
		int prjct_ntcn_sn = memScheduleNotificationDAO.getNotificationSeqNextValue();
		
		prjctScheduleNotification.setPrjct_ntcn_sn(prjct_ntcn_sn);
		
		memScheduleNotificationDAO.insertProjectScheduleNotification(prjctScheduleNotification);
	}

}
