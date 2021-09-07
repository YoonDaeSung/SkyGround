package com.ncs.service;

import java.util.List;

import com.ncs.vo.RoomVO;

public interface RoomService {
	
	/* 객실 정보 리스트 */
	public List<RoomVO> RList(RoomVO rVO);
	
	// 객실 정보 상세조회
	public List<RoomVO> RDetail(RoomVO rVO);
	
	
	/* 객실 관리자 전용 */
	
	//객실 정보 입력
	public int insertR(RoomVO rVO);
	
	//객실 정보 수정
	public int updateR(RoomVO rVO);
	
	//객실 정보 삭제
	public int deleteR(RoomVO rVO);
	
	//객실 이미지 업로드
	public int insertRI(RoomVO rVO);
	
	//객실 이미지 수정
	public int updateRI(RoomVO rVO);
	
	//객실 이미지 삭제
	public int deleteRI(RoomVO rVO);
	
}
