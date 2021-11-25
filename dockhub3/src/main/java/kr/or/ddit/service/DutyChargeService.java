package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.DutyChargeVO;

public interface DutyChargeService {

	//리스트 조회
	List<DutyChargeVO> getList(int prjct_sn) throws SQLException;
	
	//작성
	void regist(DutyChargeVO dutycharge) throws SQLException;
	
	// 수정
	void modify(DutyChargeVO dutycharge) throws SQLException;
	
	//삭제
	void remove(int unit_job_sn) throws SQLException;
	
	// 리스트 유저 조회
	List<DutyChargeVO> getUserList(int prjct_sn) throws SQLException;
	
	//프로젝트에 해당하는 단위업무들의 상태 조회
	List<String> getDutyStatus(int prjct_sn) throws SQLException;
	List<String> getMberDutyStatus(String mber_sn) throws SQLException;
}
