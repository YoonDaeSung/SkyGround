package com.ncs.service;

import java.util.List;
import java.util.Map;

import com.ncs.vo.RoomVO;
import com.ncs.vo.rsvVO;

public interface RsvService {
	
	// 객실 정보 조회
	public List<RoomVO> selectBook(RoomVO rmVO);
	
	// 예약 정보 조회
	public List<rsvVO> selectRsv_BK(Map<String, Object> map);
	
	// 객실 예약
	public int insertBook(rsvVO rsVO);
	
	// 예약 확인
	public List<rsvVO> selectRsvCheck(rsvVO rsVO);
}
