package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.IssueVO;

public interface IssueService {
	
	//프로젝트 번호로 이슈들 가져오기(open시)
	/*List<IssueVO> selectIssueByPrjctSn(int prjct_sn) throws SQLException;*/
	Map<String, Object> selectIssueByPrjctSn(int prjct_sn, SearchCriteria cri) throws SQLException;
	
	//프로젝트 번호로 이슈들 가져오기(close시)
	Map<String, Object> selectIssueCloseByPrjctSn(int prjct_sn, SearchCriteria cri) throws SQLException;
	
	//프로젝트번호로 registForm에서 단위업무목록 가져오기
	Map<String, Object> selectDutyCharge(String prjct_sn) throws SQLException;
	
	//이슈등록
	void registIssue(IssueVO issue) throws SQLException;

	//프로젝트 번호로 마일스톤 조회
	Map<String, Object> selectMileStoneList(String prjct_sn) throws SQLException;

	//프로젝트에 해당하는 이슈들의 상태 조회
	List<String> getIssueStatus(int prjct_sn) throws SQLException;
	List<String> getMberIssueStatus(String mber_sn) throws SQLException;
	//이슈상세화면
	IssueVO getDetailIssue(IssueVO issue) throws SQLException;

	//이슈수정
	void updateIssue(IssueVO issue) throws SQLException;

	//이유삭제
	void deleteIssue(IssueVO issue) throws SQLException;

	//이슈종료
	void endIssue(IssueVO issue) throws SQLException;
	
	//이슈재시작
	void reIssue(IssueVO issue) throws SQLException;
}
