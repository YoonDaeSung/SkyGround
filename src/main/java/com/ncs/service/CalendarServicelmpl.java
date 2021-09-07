package com.ncs.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.ncs.vo.CalendarVO;
import com.ncs.vo.RoomVO;

@Service("calendarIm")
public class CalendarServicelmpl implements CalendarService{

	@Inject
	SqlSession dao;
	
	private static final String NS="plan.calendarMapper";
	
	@Override
	public List<CalendarVO> selectList(){
		return dao.selectList(NS+".calendarList");
	}

	// 객실 정보 리스트
	@Override
	public List<RoomVO> roomList() {
		return dao.selectList(NS+".roomList");
	}
	// 객실 정보 조회
	@Override
	public List<RoomVO> selectBook() {
		return dao.selectList(NS + ".selectBook");
	}
	
	// 객실 예약
	@Override
	public int insertBook(CalendarVO calVO) {
		return dao.insert(NS + ".insertBook", calVO);
	}
	
}
