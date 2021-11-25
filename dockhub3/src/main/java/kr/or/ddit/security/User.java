package kr.or.ddit.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import kr.or.ddit.dto.MemberVO;

public class User implements UserDetails {

	private MemberVO member;
	public User(MemberVO member) {
		this.member = member;
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
		roles.add(new SimpleGrantedAuthority(member.getMber_sttus()));
		return roles;
	}

	@Override
	public String getPassword() {
		return member.getMber_password();
	}

	@Override
	public String getUsername() {
		return member.getMber_id();
	}

	@Override
	public boolean isAccountNonExpired() { //기간제 계정의 경우 기간 만료 여부 : enabled = 4
		return member.getMber_sttus_code()!="4";
	}

	@Override
	public boolean isAccountNonLocked() { //사용 정지 혹은 휴면 계정 : enabled = 3
		return member.getMber_sttus_code()!="3";
	}

	@Override
	public boolean isCredentialsNonExpired() {//인증정보 만료 여부 : enabled = 2
		return member.getMber_sttus_code()!="2";
	}

	@Override
	public boolean isEnabled() { //탈퇴 혹은 삭제  : enabled = 0
		return member.getMber_sttus_code()!="0";
	}
	
	public MemberVO getMemberVO() {
		return this.member;
	}
}
