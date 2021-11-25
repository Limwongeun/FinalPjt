package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dao.ProjectExclusionDAO;
import kr.or.ddit.dto.ExclusionVO;
import kr.or.ddit.dto.ProjectUserVO;

public class ProjectExclusionServiceImpl implements ProjectExclusionService {
	private ProjectExclusionDAO projectExclusionDAO;

	public void setProjectExclusionDAO(ProjectExclusionDAO projectExclusionDAO) {
		this.projectExclusionDAO = projectExclusionDAO;
	}

	@Override
	public List<ExclusionVO> selectPrjctExclReqst(int sn) throws SQLException {
		List<ExclusionVO> exclList = projectExclusionDAO.selectPrjctExclReqst(sn);
		return exclList;
	}

	@Override
	public List<ExclusionVO> selectPrjctExclProcess(int sn) throws SQLException {
		List<ExclusionVO> exclProcessList = projectExclusionDAO.selectPrjctExclProcess(sn);
		return exclProcessList;
	}

	@Override
	public List<ExclusionVO> selectProjectExclAcceptList(ExclusionVO exclusionVO) throws SQLException {
		List<ExclusionVO> projectExclAccept = projectExclusionDAO.selectProjectExclAcceptList(exclusionVO);
		return projectExclAccept;
	}

	@Override
	public void updateProjectExclAccep(ExclusionVO exclProject) throws SQLException{
		projectExclusionDAO.updateProjectExclAccep(exclProject);
		
	}

	@Override
	public ExclusionVO updateProjectRefuseReason(ExclusionVO exclusionVO) throws SQLException {
		ExclusionVO reason = projectExclusionDAO.updateProjectRefuseReason(exclusionVO); 
		return reason;
	}

	@Override
	public ExclusionVO selectProjectExclAcceptDetail(ExclusionVO user) throws SQLException {
		ExclusionVO exclAcceptdetail = projectExclusionDAO.selectProjectExclAcceptDetail(user);
		return exclAcceptdetail;
	}

	@Override
	public List<ExclusionVO> selectPrjctExclProcessUser(ProjectUserVO author) throws SQLException {
		List<ExclusionVO> exclProcessUser = projectExclusionDAO.selectPrjctExclProcessUser(author);
		return exclProcessUser;
	}

	@Override
	public ExclusionVO selectProjectExclAcceptUserDetail(ExclusionVO detail) throws SQLException {
		ExclusionVO exclAcceptUserdetail = projectExclusionDAO.selectProjectExclAcceptUserDetail(detail);
		return exclAcceptUserdetail;
	}

	@Override
	public ExclusionVO insertProjectExclReason(ExclusionVO exclUser) throws SQLException {
		ExclusionVO reason = projectExclusionDAO.insertProjectExclReason(exclUser);
		return reason;
	}

	@Override
	public ExclusionVO selectExclUserDetail(ExclusionVO detail) throws SQLException {
		ExclusionVO exclUserDetail = projectExclusionDAO.selectExclUserDetail(detail);
		return exclUserDetail;
	}
}
