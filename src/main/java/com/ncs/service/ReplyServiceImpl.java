package com.ncs.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.ncs.vo.ReplyVO;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {

	@Inject
	SqlSession dao;
	// rootContext

	// 해당되는 mapper의 이름을 찾아가라
	private static final String NS = "reply.replyMapper";

	// 댓글 등록
	@Override
	public int replyInsert(ReplyVO rVO) {
		
		return dao.insert(NS + ".insertReply", rVO);
	} // insertReply

	// 댓글 리스트
	@Override
	public List<ReplyVO> replyList(ReplyVO rVO) {
		
		return dao.selectList(NS + ".selectReply", rVO);
	}

	// 댓글 삭제
	@Override public void replyDelete(Integer re_turn) {
		
		dao.selectOne(NS + ".deleteReply", re_turn);
	} // 사용자 질문목록 수정
	
	// 댓글 수정
	@Override
	public int replyUpdate(ReplyVO rVO) {
		
		return dao.update(NS + ".replyUpdate", rVO);
	} //replyUpdate

}// class
