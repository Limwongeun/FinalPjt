package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dao.MemberDAO;
import kr.or.ddit.dao.MypageDAO;
import kr.or.ddit.dao.ProjectDAO;
import kr.or.ddit.dto.MemberVO;

public class MypageServiceImpl implements MypageService {
	private MypageDAO mypageDAO;
	
//	private MemberDAO memberDAO;
//	
//	private ProjectDAO projectDAO;
	
	public void setMypageDAO(MypageDAO mypageDAO) {
		this.mypageDAO = mypageDAO;
	}
	
	@Override
	public List<MemberVO> selectRepo(String mber_sn) {
		List<MemberVO> memRepo = mypageDAO.selectRepo(mber_sn);
		return memRepo;
	}

	@Override
	public void registRepository(MemberVO member) {
		mypageDAO.insertRepo(member);
	}

	@Override
	public void removeRepository(String mber_sn) {
		mypageDAO.deleteRepo(mber_sn);
	}

	@Override
	public int selectProjectCount(String mber_sn) throws SQLException {
		return mypageDAO.selectProjectCount(mber_sn);
	}

	@Override
	public int selectIssueCount(String mber_sn) throws SQLException {
		return mypageDAO.selectIssueCount(mber_sn);
	}
	
	@Override
	public int selectIssueOpen(String mber_sn) throws SQLException {
		return mypageDAO.selectIssueOpen(mber_sn);
	}
	
	@Override
	public int selectIssueClose(String mber_sn) throws SQLException {
		return mypageDAO.selectIssueClose(mber_sn);
	}

	@Override
	public int selectDutychargeCount(String mber_sn) throws SQLException {
		
		return mypageDAO.selectDutychargeCount(mber_sn);
	}

	@Override
	public int selectFileCount(String mber_sn) throws SQLException {
		return mypageDAO.selectFileCount(mber_sn);
	}


}
