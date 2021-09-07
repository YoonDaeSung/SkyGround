package com.ncs.service;

import java.util.List;

import com.ncs.vo.CalendarVO;
import com.ncs.vo.RoomVO;

public interface CalendarService {

// booking 데이터 리스트 불러오기 
public List<CalendarVO> selectList();

// 객실 정보 리스트 불러오기
public List<RoomVO> roomList();
	
// 객실 정보 조회
public List<RoomVO> selectBook();

// 객실 예약
public int insertBook(CalendarVO calVO);

	
//	   룸 이미지 불러오기 
//public List<RoomVO> roomimg();
	 
}
