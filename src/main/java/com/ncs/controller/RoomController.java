package com.ncs.controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ncs.service.RoomService;
import com.ncs.vo.RoomVO;

@Controller
public class RoomController {
	@Autowired
	@Qualifier("room")
	private RoomService userS, adminS;

	/* 객실 사용자 */

	// 객실 목록
	@RequestMapping(value = "/listRF")
	public ModelAndView listRF(ModelAndView mav, RoomVO rVO) {
		List<RoomVO> list = userS.RList(rVO);
		mav.addObject("listR", list);
		mav.setViewName("room/roomListForm");
		return mav;

	}

	// 객실 상세
	@RequestMapping(value = "/detailRF")
	public ModelAndView rdetailF(ModelAndView mav, RoomVO rVO) {
		List<RoomVO> detail = userS.RDetail(rVO);
		
		mav.addObject("detailR", detail);
		mav.addObject("roomNum", detail.get(0)); // 객실 번호만 받아오기 위한 add
		
		mav.setViewName("room/roomDetailForm");
		return mav;

	}

	/* 객실 관리자 */

	// 객실 관리 목록
	@RequestMapping(value = "/editL")
	public ModelAndView editL(ModelAndView mav, RoomVO rVO) {
		List<RoomVO> editList = adminS.RList(rVO);
		mav.addObject("editL", editList);
		mav.setViewName("editroom/editListForm");
		return mav;
	}

	// 새 객실 추가 폼(제작중)
	@RequestMapping(value = "/editI", method = RequestMethod.GET)
	public ModelAndView editI(ModelAndView mav, RoomVO rVO) {
		mav.setViewName("editroom/editInsertForm");
		return mav;
	}
	
	@RequestMapping(value = "/insR")
	public String insR(ModelAndView mav, RoomVO rVO) {
		
		System.out.println("인서트 컨트롤러 인");
		
		int cnt = adminS.insertR(rVO);
		if(cnt > 0) {
			mav.addObject("code", 200);
			System.out.println("200");
			
		}
		else {
			mav.addObject("code", 201);
			System.out.println("201");
		}
		mav.setViewName("jsonView");
		
		return "editroom/editInsertForm";
	}

	// 객실 정보 수정
	@RequestMapping(value = "/editD")
	public ModelAndView editD(ModelAndView mav, RoomVO rVO) {
		List<RoomVO> editDetail = adminS.RDetail(rVO);
		mav.addObject("editD", editDetail);
		mav.setViewName("editroom/editDetailForm");
		return mav;
	}

	// 해당 객실 전체 삭제
	@RequestMapping(value = "/delR")
	public String delR(RoomVO rVO) {
		
		int cnt = 0;
		cnt = adminS.deleteR(rVO);
		return "redirect:/editL";
	}

}