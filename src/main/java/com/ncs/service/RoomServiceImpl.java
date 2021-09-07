package com.ncs.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.ncs.vo.RoomVO;

@Service("room")
public class RoomServiceImpl implements RoomService {

	@Inject
	SqlSession dao;

	private static final String NS = "pension.roomMapper";

	/*유저 모드*/
	
	// 객실 정보 리스트
	@Override
	public List<RoomVO> RList(RoomVO rVO) {
		
		return dao.selectList(NS + ".listR", rVO);
	}
	
	// 객실 정보 상세조회
	@Override
	public List<RoomVO> RDetail(RoomVO rVO) {
		
		return dao.selectList(NS + ".detailR", rVO);
	}

	
	/*관리자 모드*/
	
	//객실 정보 입력
	@Override
	public int insertR(RoomVO rVO) {
		
		return dao.insert(NS + ".insertR", rVO);
	}

	//객실 정보 수정
	@Override
	public int updateR(RoomVO rVO) {

		return dao.update(NS + ".updateR", rVO);
	}

	//객실 정보 삭제
	@Override
	public int deleteR(RoomVO rVO) {

		return dao.delete(NS + ".deleteR", rVO);
	}

	//객실 이미지 업로드
	@Override
	public int insertRI(RoomVO rVO) {
		
		return dao.insert(NS+".inserRI", rVO);
	}

	//객실 이미지 수정
	@Override
	public int updateRI(RoomVO rVO) {
		
		return dao.update(NS+".updateRI", rVO);
	}
	
	//객실 이미지 삭제
	@Override
	public int deleteRI(RoomVO rVO) {
		
		return dao.delete(NS + ".deleteRI", rVO);
	}

}
