package kr.or.ddit.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.RepositoryVO;

public interface RepositoryDAO {

	public List<Map<String, Object>> selectRepositoryList(int prjct_no);
	
	public void insertRepository(RepositoryVO repo);
	
	public void deleteRepository(int prjct_sn);
	
	public List<RepositoryVO> selectRepo(int prjct_sn);

	public List<MemberVO> selectPLInfo(String mber_sn);

	public String selectPLSn(int prjct_sn);
}
