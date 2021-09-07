package com.ncs.service;

import java.util.List;

import com.ncs.vo.ReplyVO;

public interface ReplyService {
	
	// 댓글 등록
	public int replyInsert(ReplyVO rVO);
	
	// 댓글 리스트
	public List<ReplyVO> replyList(ReplyVO rVO);
	  
	// 댓글 삭제 
	public void replyDelete(Integer re_turn);
	  
	// 댓글 수정
	public int replyUpdate(ReplyVO rVO);
	 

}//interface
