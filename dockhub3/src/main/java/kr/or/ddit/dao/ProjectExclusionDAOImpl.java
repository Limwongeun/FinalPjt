package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.ExclusionVO;
import kr.or.ddit.dto.ProjectUserVO;

public class ProjectExclusionDAOImpl implements ProjectExclusionDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	
	@Override
	public List<ExclusionVO> selectPrjctExclReqst(int sn) throws SQLException {
		List<ExclusionVO> exclList = session.selectList("ProjectExclusion-Mapper.selectPrjctExclReqst",sn);
		return exclList;
	}


	@Override
	public List<ExclusionVO> selectPrjctExclProcess(int sn) throws SQLException {
		List<ExclusionVO> exclProcessList = session.selectList("ProjectExclusion-Mapper.selectPrjctExclProcess",sn);
		return exclProcessList;
	}


	@Override
	public List<ExclusionVO> selectProjectExclAcceptList(ExclusionVO exclusionVO) throws SQLException {
		List<ExclusionVO> projectExclAccept = session.selectList("ProjectExclusion-Mapper.selectProjectExclAcceptList",exclusionVO);
		return projectExclAccept;
	}


	@Override
	public void updateProjectExclAccep(ExclusionVO exclProject) throws SQLException {
		session.update("ProjectExclusion-Mapper.updateProjectExclAccep",exclProject);
		session.update("ProjectExclusion-Mapper.updateProjectExclAcptr",exclProject);
		session.update("ProjectExclusion-Mapper.updateProjectExclApplcnt",exclProject);
		session.update("ProjectExclusion-Mapper.updatePrjctUserEnddate", exclProject);
		
	}


	@Override
	public ExclusionVO updateProjectRefuseReason(ExclusionVO exclusionVO) throws SQLException{
		ExclusionVO reason = session.selectOne("ProjectExclusion-Mapper.updateProjectRefuseReason",exclusionVO);
		return reason;
	}


	@Override
	public ExclusionVO selectProjectExclAcceptDetail(ExclusionVO user) throws SQLException {
		ExclusionVO exclAcceptdetail = session.selectOne("ProjectExclusion-Mapper.selectProjectExclAcceptDetail", user);
		return exclAcceptdetail;
	}


	@Override
	public List<ExclusionVO> selectPrjctExclProcessUser(ProjectUserVO author) throws SQLException {
		List<ExclusionVO> exclProcessUser = session.selectList("ProjectExclusion-Mapper.selectPrjctExclProcessUser", author);
		return exclProcessUser;
	}


	@Override
	public ExclusionVO selectProjectExclAcceptUserDetail(ExclusionVO detail) throws SQLException {
		ExclusionVO exclAcceptUserdetail = session.selectOne("ProjectExclusion-Mapper.selectProjectExclAcceptUserDetail", detail);
		return exclAcceptUserdetail;
	}


	@Override
	public ExclusionVO insertProjectExclReason(ExclusionVO exclUser) throws SQLException {
		ExclusionVO reason = session.selectOne("ProjectExclusion-Mapper.insertProjectExclReason", exclUser);
		return reason;
	}


	@Override
	public ExclusionVO selectExclUserDetail(ExclusionVO detail) throws SQLException {
		ExclusionVO exclUserDetail = session.selectOne("ProjectExclusion-Mapper.selectExclUserDetail", detail);
		return exclUserDetail;
	}


}		
