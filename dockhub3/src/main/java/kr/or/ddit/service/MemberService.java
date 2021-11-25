package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.exception.InvalidPasswordException;
import kr.or.ddit.exception.NotFoundIDException;

public interface MemberService {
	
	// 로그인 
	void login(String id, String pwd) throws SQLException, NotFoundIDException, 
															InvalidPasswordException;
	// 아이디 찾기
	public List<MemberVO> findId(MemberVO member) throws SQLException;
	
	//문자 발송
	void certifiedPhoneNumber(String phoneNumber, String cerNum);

	// 회원정보조회
	MemberVO getMember(String id) throws SQLException;
	
	// 회원정보조회 sn
	MemberVO getMemberSn(String mber_sn) throws SQLException;
	
	
	// 회원가입
	public void regist(MemberVO member) throws SQLException;
	
	MemberVO getMemberByNm(String mber_ncnm) throws SQLException;
	
	//개인정보조회
	MemberVO getMemberDetail(String mber_sn) throws SQLException;
	
	//정보 수정
	void modify(MemberVO member) throws SQLException;
}









