package com.ncs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.ncs.vo.QnAVO;

@Service("qnaService") // serviceimpl id값
public class QnAServiceImpl implements QnAService {

	@Inject
	SqlSession dao;

	private static final String NS = "qna.qnaMapper";
	// 해당되는 mapper의 이름을 찾아가라

	// 사용자 질문 등록
	@Override
	public int questionInsert(QnAVO qVO) {
		return dao.insert(NS + ".insertQuestion", qVO);
		// NS = qnA.qnAMapper에 있는 insertQuestion를 실행
	} // questionInsert

	// 사용자 질문 등록 리스트
	@Override
	public List<QnAVO> questionList(Map<String, Object> map) {
		return dao.selectList(NS + ".selectQuestion", map);
	} // questionList

	// 사용자 질문 검색
	@Override
	public List<QnAVO> questionSearch(QnAVO qVO) {
		return dao.selectList(NS + ".questionSearchMapper", qVO);
	}

	// 사용자 질문 리스트 중 세부사항
	@Override
	public QnAVO questionDetail(QnAVO qVO) {
		return dao.selectOne(NS + ".questionDetailMapper", qVO);
	}

	// 사용자 질문 삭제
	@Override
	public QnAVO questionDelete(QnAVO qVO) {
		return dao.selectOne(NS + ".questionDeleteMapper", qVO);
	}
	
	// 사용자 질문 수정
	@Override
	public int questionUpdate(QnAVO qVO) {
		return dao.update(NS + ".questionUpdateMapper", qVO);
	}
	
	/* ------게시판 페이징------ */
	// 전체 글 갯수
	@Override
	public int getCount(Map<String, Object> map) {
		return dao.selectOne(NS + ".getCount", map);
	}
	
	// 이전글 정보
	@Override
	public QnAVO getPrev(int qt_turn) {
		return dao.selectOne(NS + ".getPrev", qt_turn);
	}
	
	// 다음글 정보
	@Override
	public QnAVO getNext(int qt_turn) {
		return dao.selectOne(NS + ".getNext", qt_turn);
	}
	
}// QnAServiceImpl
