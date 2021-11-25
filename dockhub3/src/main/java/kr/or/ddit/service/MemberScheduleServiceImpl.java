package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.MemScheduleNotificationDAO;
import kr.or.ddit.dao.MemberScheduleDAO;
import kr.or.ddit.dto.MemScheduleNotificationVO;
import kr.or.ddit.dto.MemberScheduleVO;

public class MemberScheduleServiceImpl implements MemberScheduleService{

	private MemberScheduleDAO memberScheduleDAO;
	
	public void setMemberScheduleDAO(MemberScheduleDAO memberScheduleDAO) {
		this.memberScheduleDAO = memberScheduleDAO;
	}


	private MemScheduleNotificationDAO memScheduleNotification;
	
	public void setMemScheduleNotification(MemScheduleNotificationDAO memScheduleNotification) {
		this.memScheduleNotification = memScheduleNotification;
	}
	
	@Override
	public Map<String, Object> selectList(String mber_sn) throws SQLException {

		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<MemberScheduleVO> memScheList = memberScheduleDAO.memScheList(mber_sn);
		
		dataMap.put("memScheList", memScheList);
//		System.out.println(memScheList.get(0).getMber_schdul_sn());
//		System.out.println(memScheList.get(0).getMber_schdul_bgnde());
//		System.out.println("end"+memScheList.get(0).getMber_schdul_endde());
//		System.out.println(memScheList.get(1).getMber_schdul_nm());
//		System.out.println(memScheList.get(1).getMber_schdul_bgnde());
//		System.out.println("end"+memScheList.get(1).getMber_schdul_endde());
		return dataMap;
	}

	@Override
	public Map<String, Object> commingScheList(String mber_sn) throws SQLException {

		Map<String, Object> commingDate = new HashMap<String, Object>();
		
		List<MemberScheduleVO> commingScheList = memberScheduleDAO.commingScheList(mber_sn);
		System.out.println("서비스"+ commingScheList);
		commingDate.put("commingScheList", commingScheList);

		return commingDate;
	}
	
	
	@Override
	public void regist(MemberScheduleVO member) throws SQLException {

		int mber_schdul_sn = memberScheduleDAO.getSeqNextValue();
		
		
		member.setMber_schdul_sn(mber_schdul_sn);
		memberScheduleDAO.insertMemberSchedule(member);
		
	}


	@Override
	public MemberScheduleVO getSchedule(int mber_schdul_sn) throws SQLException {

		MemberScheduleVO meberSchedule = memberScheduleDAO.selectScheduleByMberschdulsn(mber_schdul_sn);
		
		return meberSchedule;
	}


	@Override
	public void modify(MemberScheduleVO member) throws SQLException {
		memberScheduleDAO.updateMemberSchedule(member);
	}


	@Override
	public void remove(int mber_schdul_sn) throws SQLException {

		memberScheduleDAO.deleteMemberSchedule(mber_schdul_sn);
	}


	@Override
	public void modifyByDrag(MemberScheduleVO member) throws SQLException {
		memberScheduleDAO.updateMemberScheduleByDrag(member);
		
	}



	

}
