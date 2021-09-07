package com.ncs.service;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.ncs.vo.MemberVO;

@Service("member")
public class MemberServiceImpl implements MemberService {
	
	@Inject // Java 에서 제공 , @Autowired 는 스프링 이 제공 
	SqlSession dao;
	// 설정파일(root-context.xml) 에 의해
	// 스프링 컨테이너가 setSqlSessionFactory 메서드를 자동으로 호출하여 
	// 스프링 설정파일(root-context.xml)에 <bean> 등록된 SqlSessionFactoryBean 객체를 인자로 받아	
	// 부모인 SqlSessionDaoSupport 에 setSqlSessionFactory() 메서드로 설정해줌.
	// 이렇게 함으로 SqlSessionDaoSupport 로부터 상속된 getSqlSession() 메서드를 호출하여
	// SqlSession 객체를 return 받을 수 있게됨.
	
	// mapper의 namespace를 상수로 저장.
	private static final String NS = "rsv.memberMapper";
	
	// 회원 등록
	@Override
	public int insertMember(MemberVO mVO) {
		return dao.insert(NS + ".insertMember", mVO);
	}
	
	// ID 중복 확인
	@Override
	public MemberVO selectEmail(MemberVO mVO) {
		return dao.selectOne(NS + ".selectEmail", mVO);
	}
	
	// 로그인
	@Override
	public MemberVO loginMember(MemberVO mVO) {
		return dao.selectOne(NS + ".loginMember", mVO);
	}

}
