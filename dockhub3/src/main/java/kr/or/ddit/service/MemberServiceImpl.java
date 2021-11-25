package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;

import kr.or.ddit.dao.MemberDAO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.exception.InvalidPasswordException;
import kr.or.ddit.exception.NotFoundIDException;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class MemberServiceImpl implements MemberService {

	private MemberDAO memberDAO;

	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	
	  
	@Override
	public void login(String id, String pwd) throws SQLException, NotFoundIDException, InvalidPasswordException {
		MemberVO member = memberDAO.selectMemberById(id);
		if (member == null)
			throw new NotFoundIDException();
		if (!pwd.equals(member.getMber_password()))
			throw new InvalidPasswordException();

	}



	@Override
	public List<MemberVO> findId(MemberVO member) throws SQLException {
		
		return memberDAO.findIdByNmAndPhone(member);
	}




	@Override
	public MemberVO getMember(String id) throws SQLException {

		MemberVO member = memberDAO.selectMemberById(id);
		return member;
	}
	
	@Override
	public MemberVO getMemberSn(String mber_sn) throws SQLException {
		
		MemberVO member = memberDAO.selectMemberBySn(mber_sn);
		return member;
	}

	
	
	
	@Override
	public void certifiedPhoneNumber(String phoneNumber, String cerNum) {
		String api_key = "NCSPLV5DU4DP9PEQ";
	    String api_secret = "A3OMHVSYCK0WGO2AQ057RAIFAWTHIBSR";
	    Message coolsms = new Message(api_key, api_secret);
	    
	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", phoneNumber);	// 수신전화번호
	    params.put("from", "01066755859");	// 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("type", "SMS");
	    params.put("text", "인증번호는 [" + cerNum + "]"+ "입니다.");
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
	}

	
	@Override
	public void regist(MemberVO member) throws SQLException {
		String mber_sn = memberDAO.mber_sn();
		member.setMber_sn(mber_sn);
		memberDAO.insertMember(member);
	}



	@Override
	public MemberVO getMemberByNm(String mber_ncnm) throws SQLException {
		MemberVO member = memberDAO.selectMemberByNcnm(mber_ncnm);
		return member;
	}



	@Override
	public MemberVO getMemberDetail(String mber_sn) throws SQLException {
		
		MemberVO member = memberDAO.selectMemberDetail(mber_sn);
		
		return member;
	}
	
	@Override
	public void modify(MemberVO member) throws SQLException {
		memberDAO.updateMember(member);
	}
}
