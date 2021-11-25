package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.MeetingVO;
import kr.or.ddit.dto.MemberVO;

public class MemberDAOImpl implements MemberDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	@Override
	public MemberVO selectMemberByNcnm( String mber_ncnm) throws SQLException {
		MemberVO member=session.selectOne("Member-Mapper.selectMemberByNcnm",mber_ncnm);			
		return member;
	}
	@Override
	public MemberVO selectMemberById( String id) throws SQLException {
		MemberVO member=session.selectOne("Member-Mapper.selectMemberById",id);			
		return member;
	}
	@Override
	public MemberVO selectMemberBySn( String mber_sn) throws SQLException {
		MemberVO member=session.selectOne("Member-Mapper.selectMemberBySn",mber_sn);			
		return member;
	}

	@Override
	public List<MemberVO> findIdByNmAndPhone(MemberVO member) throws SQLException {
		return session.selectList("Member-Mapper.findIdByNmAndPhone", member);
	}

	@Override
	public MemberVO findId(String name) throws SQLException {
		return session.selectOne("Member-Mapper.findId",name);
	}

	@Override
	public void insertMember(MemberVO member) throws SQLException {
		session.update("Member-Mapper.mJoin",member);
		
	}

	@Override
	public String mber_sn() throws SQLException {
		return session.selectOne("Member-Mapper.selectMemberNext");
	}

	@Override
	public MemberVO selectMemberDetail(String mber_sn) throws SQLException {
		MemberVO member = session.selectOne("Member-Mapper.selectMemberDetail",mber_sn);
		return member;
	}

	@Override
	public void updateMember(MemberVO member) throws SQLException {
		session.update("Member-Mapper.updateMember",member);
	}

	@Override
	public List<MemberVO> getPrjctMber(int prjct_sn) throws SQLException {
		return session.selectList("Member-Mapper.getPrjctMber", prjct_sn);
	}




}










