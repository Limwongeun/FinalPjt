package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.DutyChargeVO;

public interface DutyChargeDAO {
	
	List<DutyChargeVO> selectDutyChargeCriteria(int prjct_sn) throws SQLException;
	
	int selectDutyChargeCriteriaTotalCount(SearchCriteria cri) throws SQLException;
	
	int getSeqNextValue() throws SQLException;
	
	void insertdutycharge (DutyChargeVO dutycharge)throws SQLException;
	
	void updatedutycharge(DutyChargeVO dutycharge) throws SQLException;
	
	void deletedutycharge(int unit_job_sn) throws SQLException;
	
	DutyChargeVO selectdutychargeByUnit_job_sn(int unit_job_sn) throws SQLException;

	int selectDutyChargeSeqNext() throws SQLException;
	
	List<DutyChargeVO> selectProjectMember(int prjct_sn) throws SQLException;
	
	//프로젝트에 해당하는 단위업무들의 상태 조회
	List<String> getDutyStatus(int prjct_sn) throws SQLException;
	List<String> getMberDutyStatus(String mber_sn) throws SQLException;
}
