package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.MeetingVO;
import kr.or.ddit.dto.MemberVO;

public interface MemberDAO {
	
	
	// 회원정보 조회
	MemberVO selectMemberByNcnm(String mber_ncnm) throws SQLException;
	MemberVO selectMemberById(String id) throws SQLException;
	MemberVO selectMemberBySn(String mber_sn) throws SQLException;
	//회원 정보 상세 조회
	MemberVO selectMemberDetail(String mber_sn) throws SQLException;
	// 회원 아이디 찾기
	List<MemberVO> findIdByNmAndPhone(MemberVO member) throws SQLException;
	
	MemberVO findId(String name) throws SQLException;
	
	public void insertMember( MemberVO member) throws SQLException;
	
	//회원 수정
	void updateMember(MemberVO member) throws SQLException;
	
	String mber_sn() throws SQLException;

	//프로젝트에 참여중인 회원 목록 조회
	List<MemberVO> getPrjctMber(int prjct_sn) throws SQLException;
	

}








