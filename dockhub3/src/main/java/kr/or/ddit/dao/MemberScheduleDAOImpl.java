package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.MemberScheduleVO;

public class MemberScheduleDAOImpl implements MemberScheduleDAO{

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public List<MemberScheduleVO> memScheList(String mber_sn) throws SQLException {
		List<MemberScheduleVO> memScheList = session.selectList("Schedule-Mapper.memScheList",mber_sn);
		return memScheList;
	}
	@Override
	public List<MemberScheduleVO> commingScheList(String mber_sn) throws SQLException {
		List<MemberScheduleVO> commingScheduleByMberschdulsn = session.selectList("Schedule-Mapper.commingScheduleByMberschdulsn",mber_sn);
		return commingScheduleByMberschdulsn;
	}
	@Override
	public void insertMemberSchedule(MemberScheduleVO member) throws SQLException {
		session.update("Schedule-Mapper.insertMemberSchedule",member);
	}
	@Override
	public int getSeqNextValue() throws SQLException {
		int mber_schdul_sn = session.selectOne("Schedule-Mapper.selectCalendarSeqNext");
		return mber_schdul_sn;

	}
	@Override
	public MemberScheduleVO selectScheduleByMberschdulsn(int mber_schdul_sn) throws SQLException {
		MemberScheduleVO memberSchedule =session.selectOne("Schedule-Mapper.selectScheduleByMberschdulsn",mber_schdul_sn);
		return memberSchedule;
	}
	@Override
	public void updateMemberSchedule(MemberScheduleVO member) throws SQLException {
		session.update("Schedule-Mapper.updateMemberSchedule",member);
	}
	@Override
	public void deleteMemberSchedule(int mber_schdul_sn) throws SQLException {
		session.update("Schedule-Mapper.deleteMemberSchedule",mber_schdul_sn);
	}
	@Override
	public void updateMemberScheduleByDrag(MemberScheduleVO member) throws SQLException {
		session.update("Schedule-Mapper.updateMemberScheduleByDrag",member);
		
	}

}

