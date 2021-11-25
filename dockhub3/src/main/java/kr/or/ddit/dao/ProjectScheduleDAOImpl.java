package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.ProjectScheduleVO;

public class ProjectScheduleDAOImpl implements ProjectScheduleDAO{

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public List<ProjectScheduleVO> projectScheduleList(int prjct_sn) throws SQLException {
		List<ProjectScheduleVO> projectScheduleList = session.selectList("Schedule-Mapper.projectScheduleList",prjct_sn);
		return projectScheduleList;
	}
	@Override
	public List<ProjectScheduleVO> commingScheList(int prjct_sn) throws SQLException {
		List<ProjectScheduleVO> commingScheduleByPrjctSn = session.selectList("Schedule-Mapper.commingScheduleByPrjctSchdulSn",prjct_sn);
		return commingScheduleByPrjctSn;
	}
	@Override
	public ProjectScheduleVO selectProjectSchedule(int prjct_schdul_sn) throws SQLException {
		ProjectScheduleVO projectSchedule = session.selectOne("Schedule-Mapper.selectProjectSchedule",prjct_schdul_sn);
		return projectSchedule;
	}
	@Override
	public void insertProjectSchedule(ProjectScheduleVO project) throws SQLException {
		session.update("Schedule-Mapper.insertProjectSchedule",project);
	}
	@Override
	public void updateProjectSchedule(ProjectScheduleVO project) throws SQLException {
		session.update("Schedule-Mapper.updateProjectSchedule",project);
	}
	@Override
	public void deleteProjectSchedule(int prjct_schdul_sn) throws SQLException {
		session.update("Schedule-Mapper.deleteProjectSchedule",prjct_schdul_sn);
		
	}
	/*
	@Override
	public List<MemberScheduleVO> commingScheList(String mber_sn) throws SQLException {
		List<MemberScheduleVO> commingScheduleByMberschdulsn = session.selectList("Schedule-Mapper.commingScheduleByMberschdulsn",mber_sn);
		return commingScheduleByMberschdulsn;
	}
*/
	@Override
	public int getSeqNextValue() throws SQLException {
		int prjct_schdul_sn = session.selectOne("Schedule-Mapper.selectProjectCalendarSeqNext");
		return prjct_schdul_sn;

	}
	@Override
	public void updateProjectScheduleByDrag(ProjectScheduleVO project) throws SQLException {
		session.update("Schedule-Mapper.updateProjectScheduleByDrag",project);
	}

}

