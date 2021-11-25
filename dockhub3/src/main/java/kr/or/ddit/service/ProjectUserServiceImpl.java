package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dao.ProjectDAO;
import kr.or.ddit.dao.ProjectUserDAO;
import kr.or.ddit.dto.ProjectUserVO;

public class ProjectUserServiceImpl implements ProjectUserService {
	private ProjectUserDAO projectUserDAO;
	
	public void setProjectUserDAO(ProjectUserDAO projectUserDAO) {
		this.projectUserDAO = projectUserDAO;
	}


	@Override
	public List<ProjectUserVO> getProjectUser(int sn) throws SQLException {
		List<ProjectUserVO> list = projectUserDAO.getProjectUser(sn);
		return list;
	}


	@Override
	public String getProjectUserAuthor(ProjectUserVO author) throws SQLException{
		
		return projectUserDAO.getProjectUserAuthor(author);
	}


	@Override
	public ProjectUserVO updateUserAuthorChange(ProjectUserVO project) throws SQLException {
		ProjectUserVO userAuthorChange = projectUserDAO.updateUserAuthorChange(project);
		return userAuthorChange;
	}


	@Override
	public List<ProjectUserVO> getDashUserByPrjct(int prjct_sn) throws SQLException {
		return projectUserDAO.getDashUserByPrjct(prjct_sn);
	}


	@Override
	public int selectUserByMberPrjct(ProjectUserVO project) throws SQLException {
		return projectUserDAO.selectUserByMberPrjct(project);
	}


	@Override
	public void insertRecruitUser(int pblanc_sport_sn) throws SQLException {
		projectUserDAO.insertRecruitUser(pblanc_sport_sn);
	}


	@Override
	public int selectUserSnByMberPrjct(ProjectUserVO user) throws SQLException {
		return projectUserDAO.selectUserSnByMberPrjct(user);
	}


//	@Override
//	public List<ProjectUserVO> selectUserForPrjctSn(int prjct_sn) throws SQLException {
//		return projectUserDAO.selectUserForPrjctSn(prjct_sn);
//	}


}
