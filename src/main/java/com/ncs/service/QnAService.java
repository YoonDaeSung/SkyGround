package com.ncs.service;

import java.util.List;
import java.util.Map;

import com.ncs.vo.QnAVO;

public interface QnAService {
	
	// 사용자 질문 등록
	public int questionInsert(QnAVO qVO);
	
	// 사용자 질문 등록 리스트
	public List<QnAVO> questionList(Map<String, Object> map);
	
	// 사용자 질문 검색 
	public List<QnAVO> questionSearch(QnAVO qVO);
	
	// 사용자 질문 리스트 중 세부사항
	public QnAVO questionDetail(QnAVO qVO);
	
	// 사용자 질문 삭제
	public QnAVO questionDelete(QnAVO qVO);
	
	// 사용자 질문 수정
	public int questionUpdate(QnAVO qVO);
	
	/* ------게시판 페이징------ */
	// 전체 글 갯수
	public int getCount(Map<String, Object> map);
	
	// 이전글 정보
	public QnAVO getPrev(int qt_turn);
	
	// 다음글 정보
	public QnAVO getNext(int qt_turn);
	
}//interface
