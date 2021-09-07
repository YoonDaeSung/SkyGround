package com.ncs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.ncs.vo.RoomVO;
import com.ncs.vo.rsvVO;

@Service("rsv")
public class RsvServiceImpl implements RsvService {
	
	@Inject
	SqlSession dao;
	
	private static final String NS = "rsv.rsvMapper";
	
	// 객실 정보 조회
	@Override
	public List<RoomVO> selectBook(RoomVO rmVO) {
		return dao.selectList(NS + ".selectBook", rmVO);
	}
	
	// 예약 정보 조회
	@Override
	public List<rsvVO> selectRsv_BK(Map<String, Object> map) {
		return dao.selectList(NS + ".selectRsv", map);
	}

	// 객실 예약
	@Override
	public int insertBook(rsvVO rsVO) {
		return dao.insert(NS + ".insertBook", rsVO);
	}
	
	// 예약 확인
	@Override
	public List<rsvVO> selectRsvCheck(rsvVO rsVO) {
		return dao.selectList(NS + ".selectRsvCheck", rsVO);
	}

}
