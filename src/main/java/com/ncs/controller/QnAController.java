package com.ncs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ncs.common.PageUtil;
import com.ncs.service.QnAService;
import com.ncs.vo.MemberVO;
import com.ncs.vo.QnAVO;

@Controller
public class QnAController {

	// Serviceimpl 의 해당아이디를 명시
	@Autowired // 얘는 외부로부터 주입 받는다
	@Qualifier("qnaService") // Serviceimpl 의 해당아이디를 명시
	private QnAService qService; // 외부에서생성된 클래스를 사용하는데
	// new를 사용하지않고

	// Q&A 질문  리스트 
	@RequestMapping(value = "/qnaListF")
	public ModelAndView qnaListF(ModelAndView mav, QnAVO qVO, 
			@RequestParam(value="pageNum", defaultValue="1") int pageNum,
			@RequestParam(value="keyField", required=false) String keyField,
			@RequestParam(value="keyword", required=false) String keyword) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 검색
		map.put("keyField", keyField);
		map.put("keyword", keyword);
		
		// 페이징
		int totalRowCount = qService.getCount(map);
		
		PageUtil pu = new PageUtil(pageNum, totalRowCount, 10, 10);
		
		map.put("startNum", String.valueOf(pu.getStartRow()) );
		map.put("endNum", String.valueOf(pu.getEndRow()) );

		List<QnAVO> qlist = qService.questionList(map);
		mav.addObject("qnaList", qlist);
		
		// 검색
		mav.addObject("keyField", keyField);
		mav.addObject("keyword", keyword);
		
		// 페이징
		mav.addObject("startPageNum", pu.getStartPageNum() );
		mav.addObject("endPageNum", pu.getEndPageNum() );
		mav.addObject("totalpageCount", pu.getTotalPageCount() );
		mav.addObject("pageNum", pageNum);
		
		mav.setViewName("qna/qnaListForm");
		return mav;
	} // qnaListF()

	// Q&A 디테일뷰
	@RequestMapping(value = "/qnaDetailF")
	public ModelAndView qnaDetailF(ModelAndView mav) {
		
		mav.setViewName("qna/qnaDetailForm");
		return mav;
	} // qnaDetailF()

	// QnQ 질문등록
	@RequestMapping(value = "/questionCon") // js에서 지정해준 매핑네임을 찾는다
	public ModelAndView questionCon(ModelAndView mav, QnAVO qVO) {
		
		// MAV가 VIEW에 해당하는 .jsp를 관리 spring 제공 클래스 (ModelANd)
		int cnt = qService.questionInsert(qVO);

		if (cnt > 0) {
			mav.addObject("code", 200);
			System.out.println("질문등록 200");
		} else {
			mav.addObject("code", 201);
			System.out.println("질문등록 201");
		}
		
		mav.setViewName("jsonView");
		return mav;
	} // questionCon()

	// QnA 리스트 중 검색
	@RequestMapping(value = "/questionSearchCon") // js에서 지정해준 매핑네임을 찾는다
	public ModelAndView questionSearchCon(ModelAndView mav, QnAVO qVO) {

		List<QnAVO> qlist = qService.questionSearch(qVO);
		mav.addObject("qnaSearch", qlist);
		
		if (qlist.size() > 0) {
			mav.addObject("code", 200);

		} else {
			mav.addObject("code", 201);

		}

		mav.setViewName("qna/qnaSearchResult");
		return mav;
	} // questionSearchCon()

	// QnA 디테일 뷰
	@RequestMapping(value = "/questionDetailCon") // js에서 지정해준 매핑네임을 찾는다
	public ModelAndView questionDetailCon(HttpServletRequest request, ModelAndView mav, QnAVO qVO, 
			@RequestParam int qt_turn) {

		qVO = qService.questionDetail(qVO);
		
		if (request.getSession().getAttribute("loginUser") != null) {
			MemberVO mVO = (MemberVO) request.getSession().getAttribute("loginUser");
			
//			System.out.println("확인 : " + mVO.getEmail().equals(qVO.getEmail()) ); 
			
			String loginUser = mVO.getEmail(); // 현재 로그인한 사용자.
			String writer = qVO.getEmail(); // 현재 글의 등록된 email.(작성자)
			
			if (loginUser != null && loginUser.equals(writer) ) {
	
				mav.addObject("code", 200);
			} // 내부 if
		
		} // 외부 if
		
		mav.addObject("qnaDetail", qVO);
		
		// 이전 글, 다음 글 보기
		mav.addObject("prev", qService.getPrev(qt_turn) );
		mav.addObject("next", qService.getNext(qt_turn) );
		
		
		mav.setViewName("qna/qnaDetailForm");
		
		return mav;
	}// questionDetailCon()

	// QnA 디테일 삭제
	@RequestMapping(value = "/questDeleteCon") // js에서 지정해준 매핑네임을 찾는다
	public ModelAndView questionDeleteCon(ModelAndView mav, QnAVO qVO) {

//		System.out.println("***questionDeleteCon -> " + qVO);
		
		qVO = qService.questionDelete(qVO);
		
		mav.addObject("qnaDelete", qVO);
		mav.setViewName("qna/qnaListForm");
		
		return mav;
	} //questDeleteCon()
	
	// QnA 수정 화면
	@RequestMapping(value = "/qnaUpdatefCon")
	public ModelAndView qnaUpdatefCon(ModelAndView mav, QnAVO qVO) {
		
		qVO = qService.questionDetail(qVO);
		
		mav.addObject("qnaDetail", qVO);
		mav.setViewName("qna/qnaUpdateForm"); 
		
		return mav;
	} // qnaUpdatefCon()
	
	
	// QnA 수정
	@RequestMapping(value = "/questUpdateCon") // js에서 지정해준 매핑네임을 찾는다
	public ModelAndView questUpdateCon(ModelAndView mav, QnAVO qVO) {

		System.out.println("디테일 데이터 QVO : "+qVO);
		int cnt = qService.questionUpdate(qVO);
		
		if(cnt > 0) //js에서 계속 수정이 되지않았다고 떠서 여기서 만저줘야함
			mav.addObject("code", 200);
		else {
			mav.addObject("code", 201);
		}
		
		mav.setViewName("qna/qnaDetailForm");
		return mav;
	}//questUpdateCon
	
}// QnAController