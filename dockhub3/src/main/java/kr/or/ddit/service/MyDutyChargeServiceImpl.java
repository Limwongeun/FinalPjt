package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.PageMaker;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dao.MyDutyChargeDAO;
import kr.or.ddit.dto.DutyChargeVO;

public class MyDutyChargeServiceImpl implements MyDutyChargeService {
	
	private MyDutyChargeDAO myDutyChargeDAO;
	
	public void setMyDutyChargeDAO(MyDutyChargeDAO myDutyChargeDAO) {
		this.myDutyChargeDAO = myDutyChargeDAO;
	}
	
	@Override
	public Map<String, Object> getDutyChargeList(SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<DutyChargeVO> dutyChargeList = myDutyChargeDAO.selectDutyChargeList(cri);
		
		int cnt = myDutyChargeDAO.dutyChargeCnt(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(cnt);
		
		dataMap.put("dutyChargeList", dutyChargeList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public DutyChargeVO getDetailDutyCharge(DutyChargeVO duty) throws SQLException {
		DutyChargeVO dutyChargeDetail = myDutyChargeDAO.getDetailDutycharge(duty);
		return dutyChargeDetail;
	}

	@Override
	public void modifyDutyCharge(DutyChargeVO duty) throws SQLException {
		myDutyChargeDAO.updateDutyCharge(duty);
	}

	@Override
	public List<DutyChargeVO> getDutyChargeHistory(DutyChargeVO duty) throws SQLException {
		List<DutyChargeVO> dutyChargeHis = myDutyChargeDAO.getDutyChargeHistory(duty);
		return dutyChargeHis;
	}


}
