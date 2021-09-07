package com.ncs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ncs.service.CalendarService;
import com.ncs.vo.CalendarVO;
import com.ncs.vo.RoomVO;

@Controller
public class CalendarController {

	@Autowired
	@Qualifier("calendarIm")
	private CalendarService service;
	 
	@RequestMapping(value="/calendar")
	public ModelAndView booking(ModelAndView mav) {
		List<CalendarVO> calendar_List = service.selectList(); //달력에 필요한 예약된 룸 리스트
		List<RoomVO> room_list = service.roomList(); //달력에 필요한 룸 리스트 
		List<RoomVO> roomInfo = service.selectBook(); //부킹 리스트 불러오기
		
		mav.addObject("mm", calendar_List); //달력에 필요한 예약된 룸 리스트
		mav.addObject("rmList", room_list); //달력에 필요한 룸 리스트 
		mav.addObject("roomInfo", roomInfo); //부킹 리스트 불러오기
		
		mav.setViewName("calendar/calendar");
		return mav;
	}//calender
	
	@RequestMapping(value = "calendarset")
	public ModelAndView setBook(ModelAndView mav, CalendarVO calVO) {
		
		int cnt = service.insertBook(calVO);
		
		System.out.println("controller 진입 확인");
		if (cnt > 0) {
			mav.addObject("code", 200);
			System.out.println("controller if 진입 확인");
			
		} else {
			mav.addObject("code", 201);
			System.out.println("controller else 진입 확인");
			
		}
		
		mav.setViewName("jsonView");
		return mav;
	}
}