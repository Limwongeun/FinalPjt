package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.DutyChargeVO;

public interface MyDutyChargeDAO {
	
	//회원번호로 단위업무 리스트 가져오기
	List<DutyChargeVO> selectDutyChargeList(SearchCriteria cri) throws SQLException;
	
	//단위업무 갯수 가져오기
	int dutyChargeCnt(SearchCriteria cri)throws SQLException;
	
	//마이페이지 단위업무 상세화면
	DutyChargeVO getDetailDutycharge(DutyChargeVO duty) throws SQLException;
	
	//단위업무 업뎁이트
	void updateDutyCharge(DutyChargeVO duty) throws SQLException;
	
	//히스토리 보기
	List<DutyChargeVO> getDutyChargeHistory(DutyChargeVO duty) throws SQLException;
	
}
