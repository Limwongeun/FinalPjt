package kr.or.ddit.command;

import kr.or.ddit.dto.KnowhowVO;

public class KnowhowModifyCommand extends KnowhowRegistCommand {
	
	String knh_no;
	
	public String getknh_no() {
		return knh_no;
	}
	
	public void  setknh_no(String knh_no) {
		this.knh_no = knh_no;
	}

	@Override
	public KnowhowVO toKnowhowVO() {
		KnowhowVO knowhow = super.toKnowhowVO();
		knowhow.setKnh_no(Integer.parseInt(knh_no));
		
		return knowhow;
	}
	
	
	
}
