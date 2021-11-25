package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.ProjectScheduleDAO;
import kr.or.ddit.dto.ProjectScheduleVO;

public class ProjectScheduleServiceImpl implements ProjectScheduleService{

	private ProjectScheduleDAO projectScheduleDAO;
	public void setProjectScheduleDAO(ProjectScheduleDAO projectScheduleDAO) {
		this.projectScheduleDAO = projectScheduleDAO;
	}

	@Override
	public Map<String, Object> selectProjectList(int prjct_sn) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String,Object>();
		
		List<ProjectScheduleVO> projectScheduleList = projectScheduleDAO.projectScheduleList(prjct_sn);
		
		dataMap.put("projectScheduleList", projectScheduleList);
		
		return dataMap;
	}
	
	@Override
	public Map<String, Object> commingScheList(int prjct_sn) throws SQLException {
		
		Map<String, Object> commingDate = new HashMap<String, Object>();
		
		List<ProjectScheduleVO> commingScheList = projectScheduleDAO.commingScheList(prjct_sn);
		
		commingDate.put("commingScheList", commingScheList);
		
		return commingDate;
	}
	
	@Override
	public ProjectScheduleVO getSchedule(int prjct_schdul_sn) throws SQLException {
		
		ProjectScheduleVO projectSchedule = projectScheduleDAO.selectProjectSchedule(prjct_schdul_sn);
		return projectSchedule;
	}
	@Override
	public void regist(ProjectScheduleVO project) throws SQLException {
		int prjct_schdul_sn = projectScheduleDAO.getSeqNextValue();
		
		project.setPrjct_schdul_sn(prjct_schdul_sn);
		projectScheduleDAO.insertProjectSchedule(project);
	}

	@Override
	public void modify(ProjectScheduleVO project) throws SQLException {
		projectScheduleDAO.updateProjectSchedule(project);
	}

	@Override
	public void remove(int prjct_schdul_sn) throws SQLException {
		projectScheduleDAO.deleteProjectSchedule(prjct_schdul_sn);

	}
/*
	@Override
	public Map<String, Object> commingScheList(String mber_sn) throws SQLException {

		Map<String, Object> commingDate = new HashMap<String, Object>();
		
		List<MemberScheduleVO> commingScheList = memberScheduleDAO.commingScheList(mber_sn);

		commingDate.put("commingScheList", commingScheList);

		return commingDate;
	}



	@Override
	public void remove(int mber_schdul_sn) throws SQLException {

		memberScheduleDAO.deleteMemberSchedule(mber_schdul_sn);
	}

*/

	@Override
	public void modifyByDrag(ProjectScheduleVO project) throws SQLException {
		projectScheduleDAO.updateProjectScheduleByDrag(project);
	}

	

}
