package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.RepositoryVO;

public interface RepositoryService {

	public List<Map<String, Object>> selectRepositoryList(int prjct_no);
	
	public void registRepository(RepositoryVO repo);
	
	public void removeRepository(int prjct_sn);
	
	public List<RepositoryVO> selectRepo(int prjct_sn);
	
	public List<MemberVO> selectPLInfo(int prjct_sn);
}
