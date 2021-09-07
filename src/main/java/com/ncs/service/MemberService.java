package com.ncs.service;

import com.ncs.vo.MemberVO;

public interface MemberService {
	
	// 회원 등록
	public int insertMember(MemberVO mVO);
	
	// ID 중복 확인
	public MemberVO selectEmail(MemberVO mVO);
	
	// 로그인
	public MemberVO loginMember(MemberVO mVO);
}
