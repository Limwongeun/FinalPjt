package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.DutyChargeVO;
import kr.or.ddit.dto.IssueVO;

public interface MyIssueDAO {
	
	//프로젝트 번호로 open 이슈들 가져오기
	List<IssueVO> selectIssueByMber_sn(int mber_sn, SearchCriteria cri) throws SQLException;
	
	//open상태 이슈 갯수 가져오기
	int issueCnt(int mber_sn) throws SQLException;
	
	//프로젝트 번호로 close  이슈들 가져오기
	List<IssueVO> selectIssueCloseByMber_sn(int mber_sn, SearchCriteria cri) throws SQLException;
	
	//close상태 이슈 갯수 가져오기
	int issueCloseCnt(int mber_sn) throws SQLException;
	
//	//멤버 번호로 registForm에서 단위업무목록 가져오기
//	List<IssueVO> selectDutyCharge(String mber_sn) throws SQLException;
//	
//	//멤버번호로 마일스톤 조회
//	List<IssueVO> selectMileStoneList(String mber_sn) throws SQLException;
//	
//	//이슈등록
//	void registIssue(IssueVO issue) throws SQLException;
	
}
