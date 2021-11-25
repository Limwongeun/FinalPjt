package kr.or.ddit.command;

import kr.or.ddit.dto.MemberVO;

public class FindIdCommand {
	
	private String mber_nm;
	private String mber_moblphon_no;
	
	public String getMber_nm() {
		return mber_nm;
	}
	public void setMber_nm(String mber_nm) {
		this.mber_nm = mber_nm;
	}
	public String getMber_moblphon_no() {
		return mber_moblphon_no;
	}
	public void setMber_moblphon_no(String mber_moblphon_no) {
		this.mber_moblphon_no = mber_moblphon_no;
	}
	
	@Override
	public String toString() {
		return "FindIdCommand [mber_nm=" + mber_nm + ", mber_moblphon_no=" + mber_moblphon_no + "]";
	}
	
	public MemberVO toMemberVO() {

		MemberVO member = new MemberVO();
		member.setMber_nm(this.mber_nm);
		member.setMber_moblphon_no(this.mber_moblphon_no);
		
		return member;
	}
	
}
