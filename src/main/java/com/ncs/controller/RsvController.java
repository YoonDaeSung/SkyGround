package com.ncs.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ncs.service.RsvService;
import com.ncs.vo.rsvVO;

@Controller
public class RsvController {
	
	// 객실 정보 조회
	@Autowired
	@Qualifier("rsv")
	private RsvService service;
	
	// 객실 예약 (날짜 및 인원 선택)
	@RequestMapping(value = "getRsv")
	public ModelAndView getRsv(ModelAndView mav, @RequestParam Map<String, Object> map) {
		
		List<rsvVO> rsvInfo = service.selectRsv_BK(map);
		
		mav.addObject("rsvInfo", rsvInfo);
		mav.addObject("roomNM", rsvInfo.get(0) ); // 객실 이름 받기
		mav.addObject("roomNum", map.get("rm_num") ); // 객실 번호 받기
		mav.setViewName("reservation/rsvForm");
		
		return mav;
	}
	
	// 객실 예약 (날짜 및 인원 선택)
	@RequestMapping(value = "setBook")
	@ResponseBody
	public ModelAndView setBook(ModelAndView mav, rsvVO rsVO) {
		
		System.out.println("rsVO : " + rsVO);
		
		int cnt = service.insertBook(rsVO);
		
		if (cnt > 0) {
			mav.addObject("code", 200);
			
		} else {
			mav.addObject("code", 201);
			
		}
		
		mav.setViewName("jsonView");
		return mav;

	} // setBook()
	
	// 예약 확인
	@RequestMapping(value = "rsvCheck")
	@ResponseBody
	public ModelAndView rsvCheck(ModelAndView mav, rsvVO rsVO) {
		
//		System.out.println("rsVO : " + rsVO);
		
		List<rsvVO> chkInfo = service.selectRsvCheck(rsVO);
		/*System.out.println("chkInfo : " + chkInfo);
		System.out.println();*/
		
		
		if (chkInfo != null) {
//			System.out.println("chkInfo != null : " + (chkInfo != null) );
			
			mav.addObject("chkInfo", chkInfo);
		
		} 
		
		mav.setViewName("reservation/rsvStatusForm");
		return mav;
	} // getRsvCheck
	
}
