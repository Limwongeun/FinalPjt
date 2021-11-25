package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.MemberScheduleVO;

public interface MemberScheduleDAO {
	
	//MemberScheduleVO selectMemScheduleById(String id) throws SQLException;
	
	//일정 조회
	public List<MemberScheduleVO> memScheList(String mber_sn) throws SQLException;
	//다가오는 일정
	public List<MemberScheduleVO> commingScheList(String mber_sn) throws SQLException;
	//일정 추가
	public void insertMemberSchedule(MemberScheduleVO member) throws SQLException;
	//일정 상세보기
	MemberScheduleVO selectScheduleByMberschdulsn(int mber_schdul_sn) throws SQLException;
	//일정 수정
	void updateMemberSchedule(MemberScheduleVO member) throws SQLException;
	//일정 수정(드래그앤 드랍)
	void updateMemberScheduleByDrag(MemberScheduleVO member) throws SQLException;
	//삭제
	void deleteMemberSchedule(int mber_schdul_sn) throws SQLException;
	
	
	//시퀀스
	int getSeqNextValue() throws SQLException;

}
