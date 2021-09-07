package com.ncs.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ncs.service.MemberService;
import com.ncs.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	@Qualifier("member")
	private MemberService service;

	// 비밀번호 암호와 @Autowired.
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	// 회원 등록
	@RequestMapping(value = "/join")
	@ResponseBody
	public ModelAndView join(ModelAndView mav, MemberVO mVO) {

		// Password 인코딩
		String encPassword = passwordEncoder.encode(mVO.getPassword());
		mVO.setPassword(encPassword);

		int cnt = service.insertMember(mVO);

		if (cnt > 0) {
			mav.addObject("code", 200);

		} else {
			mav.addObject("code", 201);
		}

		mav.setViewName("jsonView");
		return mav;

	} // join()

	// ID 중복 확인
	@RequestMapping(value = "/overlabEmail")
	@ResponseBody
	public ModelAndView overlabEmail(ModelAndView mav, MemberVO mVO) {

		// DB에서 데이터 확인
		MemberVO emailOverlab = service.selectEmail(mVO);

		// 결과 처리
		if (emailOverlab != null) {
			mav.addObject("code", 201); // 사용 불가능(email 중복 됨)

		} else {
			mav.addObject("code", 200); // 사용 가능
		}

		mav.setViewName("jsonView");
		return mav;
	} // overlabEmail()

	// 로그인 처리
	@RequestMapping(value = "login")
	@ResponseBody
	public ModelAndView login(HttpServletRequest request, ModelAndView mav, MemberVO mVO) {
		
		// 기존에 loginUser이란 세션 값이 존재한다면
		if (request.getSession().getAttribute("loginUser") != null) {
			// 기존값을 제거해 준다.
			request.getSession().removeAttribute("loginUser");
		}
		
		MemberVO userLogin = service.loginMember(mVO);
		
		System.out.println("member ctrl : " + userLogin);
		
		if (userLogin != null) {
			
			String userPassword = mVO.getPassword(); // 로그인 시, 사용자가 입력한 password.
			
			String encPassword = userLogin.getPassword(); // DB에 저장된 암호화된 password.
			
			// passwordEncoder.matches(암호화된 password, 사용자가 입력한 password) 
			// 입력한 패스워드와 DB에 저장된 패스워드를 비교하고, 같다면 true 틀리면 false를 리턴.
			boolean passwordMatch = passwordEncoder.matches(userPassword, encPassword);
			
			
			/* 아이디와 매칭되는 데이터가 있으며, 
			 * 입력한 패스워드가 DB에 저장된 패스워드와 일치 될 경우 if문 내부를 실행. 
			 * 아이디가 매칭되지 않거나, 
			 * 입력한 패스워드가 DB에 저장된 패스워드가 일치하지 않으면 else문 내부를 실행. 
			*/
			 
			if (userLogin != null && passwordMatch) {
				mav.addObject("code", 200); // 로그인 성공.
				
				// 세션에 loginUser 란 이름으로 userLogin 객체를 저장.
				request.getSession().setAttribute("loginUser", userLogin);
				
			} else if (!passwordMatch) {
				// 로그인 실패
				mav.addObject("code", 201); // password 맞지 않을 경우.
					
			} // else if 
			
		} else {
			mav.addObject("code", 202); // email이 맞지 않을 경우.
		
		} // else
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	// 로그아웃
	@RequestMapping(value = "logout")
	public ModelAndView logout(HttpServletRequest request, ModelAndView mav, MemberVO mVO) {

		request.getSession().removeAttribute("loginUser");
		mav.setViewName("redirect:home");

		return mav;
	}
} // class MemberControler
