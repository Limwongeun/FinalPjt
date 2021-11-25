package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.RepositoryDAO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.RepositoryVO;

public class RepositoryServiceImpl implements RepositoryService {

	private RepositoryDAO repositoryDAO;
	
	public void setRepositoryDAO(RepositoryDAO repositoryDAO) {
		this.repositoryDAO = repositoryDAO;
	}
	
	@Override
	public List<Map<String, Object>> selectRepositoryList(int prjct_no) {
//		List<Map<String, Object>> repoList = repositoryDAO.selectRepositoryList(1);
		return null;
	}

	@Override
	public void registRepository(RepositoryVO repo) {
		repositoryDAO.insertRepository(repo);
	}

	@Override
	public void removeRepository(int prjct_sn) {
		repositoryDAO.deleteRepository(prjct_sn);
	}

	@Override
	public List<RepositoryVO> selectRepo(int prjct_sn) {
		List<RepositoryVO> repoList = repositoryDAO.selectRepo(prjct_sn);
		return repoList;
	}

	@Override
	public List<MemberVO> selectPLInfo(int prjct_sn) {
		String plSn = repositoryDAO.selectPLSn(prjct_sn);
		List<MemberVO> mem_plList = repositoryDAO.selectPLInfo(plSn);
		return mem_plList;
	}

}
