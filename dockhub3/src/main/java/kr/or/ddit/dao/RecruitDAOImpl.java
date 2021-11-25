package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.ProjectVO;
import kr.or.ddit.dto.RecruitVO;

public class RecruitDAOImpl implements RecruitDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	
	@Override
	public List<RecruitVO> selectRecruitCriteria(SearchCriteria cri) throws SQLException {
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit); 
		
		List<RecruitVO> RecruitList = session.selectList("Recruit-Mapper.selectSearchRecruitList",cri,rowBounds);
		
		return RecruitList;
	}
	
	@Override
	public List<RecruitVO> selectRecruitCriteria2(SearchCriteria cri) throws SQLException {
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit); 
		
		List<RecruitVO> RecruitList2 = session.selectList("Recruit-Mapper.selectSearchRecruitList2",cri,rowBounds);
		
		return RecruitList2;
	}
	
	@Override
	public List<RecruitVO> selectRecruitCriteria3(SearchCriteria cri) throws SQLException {
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit); 
		
		List<RecruitVO> RecruitList3 = session.selectList("Recruit-Mapper.selectSearchRecruitList3",cri,rowBounds);
		
		return RecruitList3;
	}

	@Override
	public int selectRecruitCriteriaTotalCount(SearchCriteria cri) throws SQLException {
		int count = session.selectOne("Recruit-Mapper.selectSearchRecruitListCount",cri);
		return count;
	}


	@Override
	public RecruitVO selectRecruitBypblanc_sn(int pblanc_sn) throws SQLException {
		RecruitVO recruit=session.selectOne("Recruit-Mapper.selectRecruitByPblanc_sn",pblanc_sn);
		return recruit;
	}


	@Override
	public void increaseViewCount(int pblanc_sn) throws SQLException {
		session.update("Recruit-Mapper.increaseViewCount", pblanc_sn);
		
	}


	@Override
	public void insertRecruit(RecruitVO recruit) throws SQLException {
		session.update("Recruit-Mapper.insertRecruit",recruit);
	}


	@Override
	public int getSeqNextValue() throws SQLException {
		int pblanc_sn = session.selectOne("Recruit-Mapper.selectRecruitNext");
		return pblanc_sn;
	}


	@Override
	public List<ProjectVO> selectProjectByMbersnList(String mber_sn) throws SQLException {
		List<ProjectVO> selectProjectByMbersnList = session.selectList("Recruit-Mapper.selectProjectByMbersn",mber_sn);
		return selectProjectByMbersnList;
	}


	@Override
	public void updateRecruit(RecruitVO recruit) throws SQLException {
		session.update("Recruit-Mapper.updateRecruit",recruit);
	}


	@Override
	public void deleteRecruit(int pblanc_sn) throws SQLException {
		session.update("Recruit-Mapper.deleteRecruit",pblanc_sn);
	}


	@Override
	public List<RecruitVO> selectMyRecruitList(String pblanc_wrter, SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("Recruit-Mapper.selectMyRecruitList",pblanc_wrter, rowBounds);
	}


	@Override
	public int selectMyRecruitCnt(String pblanc_wrter) throws SQLException {
		return session.selectOne("Recruit-Mapper.selectMyRecruitCnt",pblanc_wrter);
	}
	
	


}
