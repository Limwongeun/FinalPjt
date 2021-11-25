package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.KnowhowVO;

public class KnowhowDAOImpl implements KnowhowDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	@Override
	public List<KnowhowVO> selectKnowhowCriteria(SearchCriteria cri) throws SQLException {

		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<KnowhowVO> knowhowList = session.selectList("Knowhow-Mapper.selectSearchKnowhowList",cri,rowBounds);
		
		return knowhowList;
	}
	@Override
	public int selectKnowhowCriteriaTotalCount(SearchCriteria cri) throws SQLException {

		int count = session.selectOne("Knowhow-Mapper.selectSearchKnowhowListCount",cri);
		
		return count;
	}

	@Override
	public void insertKnowhow(KnowhowVO knowhow) throws SQLException {
		
		session.update("Knowhow-Mapper.insertKnowhow",knowhow);
	}
	
	@Override
	public int getSeqNextValue() throws SQLException {
		int knh_no = session.selectOne("Knowhow-Mapper.selectKnowhowSeqNext");
		return knh_no;
	}

	@Override
	public void deleteKnowhow(int knh_no) throws SQLException {
		session.update("Knowhow-Mapper.deleteKnowhow",knh_no);
	}
	
	@Override
	public void updateKnowhow(KnowhowVO knowhow) throws SQLException{
		session.update("Knowhow-Mapper.updateKnowhow", knowhow);

	}

	@Override
	public KnowhowVO selectknowhowByKnh_no(int knh_no) throws SQLException {
		return session.selectOne("Knowhow-Mapper.selectknowhowByKnh_no", knh_no);
	}

	@Override
	public int getLikeExist(KnowhowVO knowhow) throws SQLException {
		return session.selectOne("Knowhow-Mapper.likeExist", knowhow);
	}

	@Override
	public void likeKnowhow(KnowhowVO knowhow) throws SQLException {
		session.update("Knowhow-Mapper.likeKnowhow", knowhow);
	}

	@Override
	public void cancleLike(KnowhowVO knowhow) throws SQLException {
		session.update("Knowhow-Mapper.cancelLike", knowhow);
	}

	@Override
	public void updateKnowhowLike(int knh_no) throws SQLException {
		session.update("Knowhow-Mapper.updateLikeKnowhow", knh_no);
	}



}
