package kr.or.ddit.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.RepositoryVO;

public class RepositoryDAOImpl implements RepositoryDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	@Override
	public List<Map<String, Object>> selectRepositoryList(int prjct_no) {
//		List<Map<String, Object>> repoList = session.selectOne("Repo-Mapper.selectRepositoryList", 1);
		return null;
	}

	@Override
	public void insertRepository(RepositoryVO repo) {
		session.update("Repo-Mapper.insertRepository", repo);
	}

	@Override
	public void deleteRepository(int prjct_sn) {
		session.update("Repo-Mapper.deleteRepository", prjct_sn);
	}

	@Override
	public List<RepositoryVO> selectRepo(int prjct_sn) {
		List<RepositoryVO> repoList = session.selectList("Repo-Mapper.selectRepo", prjct_sn);
		return repoList;
	}

	@Override
	public String selectPLSn(int prjct_sn) {
		String pl_sn = session.selectOne("Repo-Mapper.selectPLMberSn", prjct_sn);
		return pl_sn;
	}

	@Override
	public List<MemberVO> selectPLInfo(String mber_sn) {
		List<MemberVO> mem_plList = session.selectList("Repo-Mapper.selectPLMberInfo", mber_sn);
		return mem_plList;
	}
	

}
