package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.DutyChargeVO;
import kr.or.ddit.dto.IssueVO;

public interface MyIssueService {
	
	//멤버 번호로 이슈들 가져오기(open시)
	Map<String, Object> selectIssueByMber_sn(int mber_sn, SearchCriteria cri) throws SQLException;
	
	//멤버 번호로 이슈들 가져오기(close시)
	Map<String, Object> selectIssueCloseByMber_sn(int mber_sn, SearchCriteria cri) throws SQLException;
	
	
//	//멤버 번호로 registForm에서 단위업무목록 가져오기
//	Map<String, Object> selectDutyCharge(String mber_sn) throws SQLException;
//	
//	//멤버번호로 마일스톤 조회
//	Map<String, Object> selectMileStoneList(String mber_sn) throws SQLException;
//	
//	//이슈등록
//	void registIssue(IssueVO issue) throws SQLException;
	

}
