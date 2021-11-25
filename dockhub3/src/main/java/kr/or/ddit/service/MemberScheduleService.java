package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.dto.MemberScheduleVO;

public interface MemberScheduleService {

	//멤버 일정 조회
	Map<String, Object> selectList(String mber_sn) throws SQLException;
	//멤버 일정 조회
	Map<String, Object> commingScheList(String mber_sn) throws SQLException;

	//등록
	public void regist(MemberScheduleVO member) throws SQLException;
	
	//상세조회
	MemberScheduleVO getSchedule(int mber_schdul_sn) throws SQLException;
	
	//일정 수정
	void modify(MemberScheduleVO member) throws SQLException;
	
	//일정 수정
	void modifyByDrag(MemberScheduleVO member) throws SQLException;
	
	//일정 삭제
	void remove(int mber_schdul_sn) throws SQLException;
}
