package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.DutyChargeVO;

public interface MyDutyChargeService {

	//리스트 보기
	Map<String, Object> getDutyChargeList(SearchCriteria cri) throws SQLException;
	
	//마이페이지 단위업무 상세화면
	DutyChargeVO getDetailDutyCharge(DutyChargeVO duty) throws SQLException;
	
	//단위업무 업데이트
	void modifyDutyCharge(DutyChargeVO duty) throws SQLException;
	
	//히스토리 보기
	List<DutyChargeVO> getDutyChargeHistory(DutyChargeVO duty) throws SQLException;
	
}
