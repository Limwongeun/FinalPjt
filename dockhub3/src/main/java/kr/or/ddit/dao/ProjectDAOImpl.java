package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.ProjectVO;

public class ProjectDAOImpl implements ProjectDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public ProjectVO selectPrjctBySn(int sn) throws SQLException {
		ProjectVO project = 
				session.selectOne("Project-Mapper.selectPrjctBySn",sn);
		return project;
	}

	@Override
	public int selectUserCnt(int sn) throws SQLException {
		int cnt 
		= session.selectOne("Project-Mapper.selectUserCnt", sn);
		return cnt;
	}

	@Override
	public int selectPrjctAuthor(ProjectVO project) throws SQLException {
		int author
			= session.selectOne("Project-Mapper.selectPrjctAuthor",project);
		return author;
	}

	@Override
	public void updateProject(ProjectVO project) throws SQLException {
		session.update("Project-Mapper.updateProjectBySn",project);
	}

	

	@Override
	public int getLike(ProjectVO project) throws SQLException {
		return session.selectOne("Project-Mapper.getLike",project);
	}

	@Override
	public void likePrj(ProjectVO project) throws SQLException {
		session.insert("Project-Mapper.likePrj",project);
	}

	@Override
	public void deletePrj(ProjectVO project) throws SQLException {
		session.delete("Project-Mapper.deletePrj",project);
	}

	@Override
	public int getMark(ProjectVO project) throws SQLException {
		return session.selectOne("Project-Mapper.getMark",project);
	}

	@Override
	public void markPrj(ProjectVO project) throws SQLException {
		session.insert("Project-Mapper.markPrj",project);
		
	}

	@Override
	public void deleteMarkPrj(ProjectVO project) throws SQLException {
		session.delete("Project-Mapper.deleteMarkPrj",project);
		
	}

	@Override
	public ProjectVO getPro(int prjct_sn) throws SQLException {
		
		return session.selectOne("Project-Mapper.getPro", prjct_sn);
	}

	@Override
	public List<ProjectVO> getMberProject(SearchCriteria cri,String mber_sn) throws SQLException {
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);	
		
		return session.selectList("Project-Mapper.getMberProject", mber_sn, rowBounds);
	}
//	@Override
//	public List<ProjectVO> getMberProject(String mber_sn) throws SQLException {
//		return session.selectList("Project-Mapper.getMberProject", mber_sn);
//	}
	@Override
	public List<ProjectVO> getMberProject2(String mber_sn) throws SQLException {
		return session.selectList("Project-Mapper.getMberProject2", mber_sn);
	}

	@Override
	public int mberPrjctCnt(String mber_sn) throws SQLException {
		return session.selectOne("Project-Mapper.mberPrjctCnt",mber_sn);
	}
	@Override
	public List<ProjectVO> getMarkProject(String mber_sn) throws SQLException {
		return session.selectList("Project-Mapper.getMarkProject",mber_sn);
	}

	@Override
	public void registPrjct(ProjectVO project) throws SQLException {
		session.update("Project-Mapper.registPrjct",project);
		
	}

	@Override
	public void insertPL() throws SQLException {
		session.insert("ProjectUser-Mapper.insertPL");
		
	}

	@Override
	public void insertAA() throws SQLException {
		session.insert("ProjectUser-Mapper.insertAA");
		
	}

	@Override
	public void insertTA() throws SQLException {
		session.insert("ProjectUser-Mapper.insertTA");
		
	}

	@Override
	public void insertDA() throws SQLException {
		session.insert("ProjectUser-Mapper.insertDA");
		
	}

	@Override
	public void insertUA() throws SQLException {
		session.insert("ProjectUser-Mapper.insertUA");
		
	}

	@Override
	public void insertBA() throws SQLException {
		session.insert("ProjectUser-Mapper.insertBA");
	}
	@Override
	public void insertAnuse() throws SQLException {
		session.insert("ProjectUser-Mapper.insertAnuse");
		
	}
	@Override
	public void insertPrjctUser(String mber_sn) throws SQLException {
		session.insert("ProjectUser-Mapper.insertPrjctUser", mber_sn);
		
	}

	@Override
	public void insertPrjctFile(ProjectVO project) throws SQLException {
		session.insert("Project-Mapper.insertPrjctFile", project);
	}

	@Override
	public List<String> getPrjctSjForSearch() throws SQLException {
		return session.selectList("Project-Mapper.getPrjctSjForSearch");
	}

	@Override
	public List<ProjectVO> selectSearchProjectList(SearchCriteria cri) throws SQLException {
		
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);		
		
		return session.selectList("SearchPrjct-Mapper.selectSearchProjectList", cri, rowBounds);
	}

	@Override
	public int selectSearchProjectListCount(SearchCriteria cri) throws SQLException {
		return session.selectOne("SearchPrjct-Mapper.selectSearchProjectListCount",cri);
	}



}
