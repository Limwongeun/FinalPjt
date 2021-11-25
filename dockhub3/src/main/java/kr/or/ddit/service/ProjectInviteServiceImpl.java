package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dao.ProjectInviteDAO;
import kr.or.ddit.dto.ProjectInviteVO;

public class ProjectInviteServiceImpl implements ProjectInviteService {
	private ProjectInviteDAO projectInviteDAO;
	
	
	public void setProjectInviteDAO(ProjectInviteDAO projectInviteDAO) {
		this.projectInviteDAO = projectInviteDAO;
	}



	@Override
	public List<ProjectInviteVO> getProjectInvite(int sn, String prjct_invite_sttus) throws SQLException {
		List<ProjectInviteVO> list = projectInviteDAO.getProjectInvite(sn, prjct_invite_sttus);
		return list;
	}
	
	@Override
	public ProjectInviteVO selectProjectProfile(ProjectInviteVO projectInviteVO) throws SQLException {
		ProjectInviteVO projectProfile = projectInviteDAO.selectProjectProfile(projectInviteVO);
		return projectProfile;
	}



	@Override
	public List<ProjectInviteVO> selectProjectInviteUser(ProjectInviteVO projectInviteVO, SearchCriteria cri) throws SQLException {
		List<ProjectInviteVO> projectInviteUserList = projectInviteDAO.selectProjectInviteUser(projectInviteVO, cri);
		return projectInviteUserList;
	}



	@Override
	public void insertPjtUser(ProjectInviteVO project) throws SQLException{
		projectInviteDAO.insertPjtUser(project);
	}



	@Override
	public List<ProjectInviteVO> getProjectInviteRefuse(int sn, String prjct_invite_sttus) throws SQLException {
		List<ProjectInviteVO> list = projectInviteDAO.getProjectInviteRefuse(sn, prjct_invite_sttus);
		return list;
	}



	@Override
	public List<ProjectInviteVO> getInviteByMberSn(String mber_sn) throws SQLException {
		return projectInviteDAO.getInviteByMberSn(mber_sn);
	}



	@Override
	public void inviteResponse(ProjectInviteVO project) throws SQLException {
		projectInviteDAO.inviteResponse(project);
		int prjct_invite_sn = project.getPrjct_invite_sn();
		String prjct_invite_sttus = project.getPrjct_invite_sttus();
		if (prjct_invite_sttus.equals("1")) {
			ProjectInviteVO insertVO = projectInviteDAO.getPrjctInvite(prjct_invite_sn);
			projectInviteDAO.insertInviteUser(insertVO);
		}
	}



	@Override
	public int selectProjectInviteUserCnt(ProjectInviteVO project) throws SQLException {
		int cnt = projectInviteDAO.selectProjectInviteUserCnt(project);
		return cnt;
	}



}
