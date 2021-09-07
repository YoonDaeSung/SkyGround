package com.ncs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ncs.service.ReplyService;
import com.ncs.vo.ReplyVO;

@Controller
public class ReplyController {
	
	@Autowired // 얘는 외부로부터 주입 받는다
	@Qualifier("replyService")
	private ReplyService rService;
	
	// 댓글버튼 클릭시 ajax로 밑에 댓글 등록폼 나오게하기
	@RequestMapping(value = "/replyfCon")
	public ModelAndView reflyfCon(ModelAndView mav) {
		
		mav.setViewName("qna/replyInsertForm"); 
		return mav;
	} // reflyfCon()
	
	// Reply 댓글등록
	@RequestMapping(value = "/replyCon")
	public ModelAndView replyCon(ModelAndView mav, ReplyVO rVO) {
		
		// MAV가 VIEW에 해당하는 .jsp를 관리 spring 제공 클래스 (ModelANd)
		int cnt = rService.replyInsert(rVO);
		
		if (cnt > 0) {
			mav.addObject("code", 200);
//			System.out.println("댓글등록 200");
			
		} else {
			mav.addObject("code", 201);
//			System.out.println("등록실패 201");
		}
		
		mav.setViewName("jsonView");
		return mav;
	} // questionCon()
		
	// 댓글  리스트
	@RequestMapping(value = "/replyListCon")
	public ModelAndView replyListCon(ModelAndView mav, ReplyVO rVO) {
		
		List<ReplyVO> rlist = rService.replyList(rVO);
//		System.out.println(rlist);
		
		mav.addObject("replyList", rlist);
		mav.setViewName("qna/replyListForm");
		
		return mav;
	} // replyListCon()
		
	// 댓글 삭제
	@RequestMapping(value = "/replyDeleteCon")
	public ModelAndView questionDeleteCon(ModelAndView mav, ReplyVO rVO, @RequestParam("re_turn")int re_turn) {
		
		rService.replyDelete(re_turn);
		
		mav.setViewName("jsonView");
		return mav;
	} //questionDeleteCon()
	
	// reply 수정완료
	@RequestMapping(value = "/replyComplete")
	public ModelAndView replyComplete(ModelAndView mav, ReplyVO rVO) {
			
		System.out.println("*********댓글수정 하기 안전하게 컨트롤러로 넘어옴"+rVO);
		int cnt = rService.replyUpdate(rVO);
			
		if(cnt > 0) //js에서 계속 수정이 되지않았다고 떠서 여기서 만저줘야함
			mav.addObject("code", 200);
		else {
			mav.addObject("code", 201);
			}
			mav.setViewName("qna/qnaDetailForm"); 
			return mav;
	} // qnaUpdatefCon()
	
} // ReplyController