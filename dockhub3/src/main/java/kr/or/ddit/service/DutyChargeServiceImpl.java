package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dao.DutyChargeDAO;
import kr.or.ddit.dto.DutyChargeVO;

public class DutyChargeServiceImpl implements DutyChargeService {

	private DutyChargeDAO dutychargeDAO;
	
	public void setDutychargeDAO(DutyChargeDAO dutychargeDAO) {
		this.dutychargeDAO = dutychargeDAO;
	}
	
	@Override
	public List<DutyChargeVO> getList(int prjct_sn) throws SQLException {
		
		List<DutyChargeVO> dutychargeList = dutychargeDAO.selectDutyChargeCriteria(prjct_sn);
		
		return dutychargeList;
	}

	@Override
	public void regist(DutyChargeVO dutycharge) throws SQLException {
		int unit_job_sn = dutychargeDAO.getSeqNextValue();
		
		dutycharge.setUnit_job_sn(unit_job_sn);
		dutychargeDAO.insertdutycharge(dutycharge);
	}

	@Override
	public void modify(DutyChargeVO dutycharge) throws SQLException {
		dutychargeDAO.updatedutycharge(dutycharge);
	}

	@Override
	public void remove(int unit_job_sn) throws SQLException {
		dutychargeDAO.deletedutycharge(unit_job_sn);
	}

	@Override
	public List<DutyChargeVO> getUserList(int prjct_sn) throws SQLException {
		List<DutyChargeVO> userList = dutychargeDAO.selectProjectMember(prjct_sn);
		return userList;
	}

	@Override
	public List<String> getDutyStatus(int prjct_sn) throws SQLException {
		return dutychargeDAO.getDutyStatus(prjct_sn);
	}

	@Override
	public List<String> getMberDutyStatus(String mber_sn) throws SQLException {
		return dutychargeDAO.getMberDutyStatus(mber_sn);
	}


	

	
}
