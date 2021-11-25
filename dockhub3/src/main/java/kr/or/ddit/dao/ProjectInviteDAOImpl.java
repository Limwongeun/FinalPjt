package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.ProjectInviteVO;

public class ProjectInviteDAOImpl implements ProjectInviteDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<ProjectInviteVO> getProjectInvite(int sn, String prjct_invite_sttus) throws SQLException {
		
		List<ProjectInviteVO> list = session.selectList("ProjectInvite-Mapper.getProjectInvite",sn);
		return list;
	}
	@Override
	public ProjectInviteVO selectProjectProfile(ProjectInviteVO projectInviteVO) throws SQLException {
		ProjectInviteVO projectProfile = 
				session.selectOne("ProjectInvite-Mapper.selectProjectProfile",projectInviteVO);
		return projectProfile;
	}

	@Override
	public List<ProjectInviteVO> selectProjectInviteUser(ProjectInviteVO projectInviteVO, SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<ProjectInviteVO> projectInviteUserList = session.selectList("ProjectInvite-Mapper.selectProjectInviteUser",projectInviteVO, rowBounds);
		return projectInviteUserList;
	}

	@Override
	public void insertPjtUser(ProjectInviteVO project) throws SQLException{
		session.selectOne("ProjectInvite-Mapper.insertPjtUser",project);
//		SESSION.SELECTONE("PROJECTINVITE-MAPPER.INSERTPJTROLE",PROJECT);
		
	}

	@Override
	public List<ProjectInviteVO> getProjectInviteRefuse(int sn, String prjct_invite_sttus) throws SQLException {
		List<ProjectInviteVO> list = session.selectList("ProjectInvite-Mapper.getProjectInviteRefuse",sn);
		return list;
	}

	@Override
	public List<ProjectInviteVO> getInviteByMberSn(String mber_sn) throws SQLException {
		return session.selectList("ProjectInvite-Mapper.getInviteByMberSn",mber_sn);
	}

	@Override
	public void inviteResponse(ProjectInviteVO project) throws SQLException {
		session.update("ProjectInvite-Mapper.inviteResponse",project);
	}

	@Override
	public ProjectInviteVO getPrjctInvite(int prjct_invite_sn) throws SQLException {
		return session.selectOne("ProjectInvite-Mapper.getPrjctInvite",prjct_invite_sn);
	}

	@Override
	public void insertInviteUser(ProjectInviteVO project) throws SQLException {
		session.insert("ProjectInvite-Mapper.insertInviteUser",project);
	}

	@Override
	public int selectProjectInviteUserCnt(ProjectInviteVO project) throws SQLException {
		int cnt = session.selectOne("ProjectInvite-Mapper.selectProjectInviteUserCnt",project);
		return cnt;
	}
}
