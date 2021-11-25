package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.ProjectUserVO;

public class ProjectUserDAOImpl implements ProjectUserDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<ProjectUserVO> getProjectUser(int sn) throws SQLException {
		List<ProjectUserVO> list = session.selectList("ProjectUser-Mapper.getProjectUser",sn);
		return list;
	}

	@Override
	public String getProjectUserAuthor(ProjectUserVO author) throws SQLException {
		return session.selectOne("ProjectUser-Mapper.getProjectUserAuthor",author);
	}

	@Override
	public ProjectUserVO updateUserAuthorChange(ProjectUserVO project) throws SQLException {
		ProjectUserVO userAuthorChange = session.selectOne("ProjectUser-Mapper.updateUserAuthorChange",project);
		return userAuthorChange;
	}

	@Override
	public List<ProjectUserVO> getDashUserByPrjct(int prjct_sn) throws SQLException {
		return session.selectList("ProjectUser-Mapper.getDashUserByPrjct", prjct_sn);
	}

	@Override
	public int selectUserByMberPrjct(ProjectUserVO project) throws SQLException {
		return session.selectOne("ProjectUser-Mapper.selectUserByMberPrjct",project);
	}

	@Override
	public void insertRecruitUser(int pblanc_sport_sn) throws SQLException {
		session.insert("ProjectUser-Mapper.insertRecruitUser", pblanc_sport_sn);
	}

	@Override
	public int selectUserSnByMberPrjct(ProjectUserVO user) throws SQLException {
		return session.selectOne("ProjectUser-Mapper.selectUserSnByMberPrjct",user);
	}

//	@Override
//	public List<ProjectUserVO> selectUserForPrjctSn(int prjct_sn) throws SQLException {
//		return session.selectList("ProjectUser-Mapper.selectUserForPrjctSn",prjct_sn);
//	}

}
