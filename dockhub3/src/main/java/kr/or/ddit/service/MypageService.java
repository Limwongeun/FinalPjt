package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.MemberVO;

public interface MypageService {

	public List<MemberVO> selectRepo(String mber_sn);
	
	public void registRepository(MemberVO member);
	
	public void removeRepository(String mber_sn);
	
	int selectProjectCount(String mber_sn) throws SQLException;
	
	int selectIssueCount(String mber_sn) throws SQLException;
	
	int selectIssueOpen(String mber_sn) throws SQLException;
	
	int selectIssueClose(String mber_sn) throws SQLException;
	
	int selectDutychargeCount(String mber_sn) throws SQLException;
	
	int selectFileCount(String mber_sn) throws SQLException;
}
