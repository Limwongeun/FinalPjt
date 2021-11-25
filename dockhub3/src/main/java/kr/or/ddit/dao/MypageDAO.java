package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.MemberVO;

public interface MypageDAO {

	public List<MemberVO> selectRepo(String mber_sn);
	
	public void insertRepo(MemberVO member);
	
	public void deleteRepo(String mber_sn);
	
	int selectProjectCount(String mber_sn) throws SQLException;
	
	int selectIssueCount(String mber_sn) throws SQLException;
	
	int selectIssueOpen(String mber_sn) throws SQLException;
	
	int selectIssueClose(String mber_sn) throws SQLException;
	
	int selectDutychargeCount(String mber_sn) throws SQLException;
	
	int selectFileCount(String mber_sn) throws SQLException;
	
}
