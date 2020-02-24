package com.project.god.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.god.domain.QnaProductVO;
import com.project.god.domain.PageVO;
import com.project.god.domain.QnaProductDTO;
import com.project.god.service.QnaProductService;

import lombok.extern.slf4j.Slf4j;

/**
 * Q&A 상품문의 컨트롤러
 * 
 * @author god
 *
 */

@Controller
@Slf4j
@RequestMapping("/board")
public class QnaProductController {
	
	@Autowired
	private QnaProductService qnaProductService;
	
	// 상품 문의 글쓰기
	@RequestMapping(value="/qna_write.do", method=RequestMethod.GET)
	public String qnaProductWrite() {
		
		log.info(" 상품문의 게시판 글쓰기 ");
		
		return "/member/qna_write";
	}
	
	// 게시글 작성처리
	@RequestMapping(value="insert.do", method = RequestMethod.POST,
					produces = "text/plain; charset=UTF-8")
	public String insert(@ModelAttribute("qnaProductDTO") QnaProductDTO qnaProductDTO)
						 											throws Exception {
		
		log.info(" 상품문의 게시글 작성처리 ");
		
		log.info(" VO : {}", qnaProductDTO);
		
		int qnaProductId = 0;
		
		// 추가 : 신규 qnaProductId 값 구하기 (sequence)
		qnaProductId = qnaProductService.getQnaProductIdByLastSeq();
		
		log.info(" 시퀀스 게시글 번호 : " + qnaProductId);
		
		QnaProductVO qnaProductVO = new QnaProductVO(qnaProductDTO);
		
		qnaProductVO.setQnaProductId(qnaProductId);
		qnaProductVO.setQnaProductReRef(qnaProductId);
		
		qnaProductService.writeQnaProduct(qnaProductVO);
		
		return "redirect:/board/qna_product.do/1";
	}
	
	// 상품문의 게시판
	@RequestMapping("/qna_product.do/{page}")
	public String QnaProduct(@PathVariable("page") int page, Model model) {
		
		log.info(" 상품문의 게시판 ");
		
		int limit = 10; // 페이지당 글수
		List<QnaProductVO> articleQnaProductList;
		
		page = page!=0 ? page : 1; // page 설정

		// 총페이지수
		int qnaProductListCount = qnaProductService.getQnaProductListCount();
		
		articleQnaProductList= qnaProductService.getArticleQnaProductList(page, limit);
		
		// 총 페이지 수
   		int maxPage=(int)((double)qnaProductListCount/limit + 0.95); //0.95를 더해서 올림 처리
   		
		// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21,...)
   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   		
		// 현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30, ...)
   	    int endPage = startPage + 10 - 1;
   	    
   	    if (endPage > maxPage) endPage = maxPage;
   	    
   	    PageVO pageVO = new PageVO();
		pageVO.setEndPage(endPage);
		pageVO.setQnaProductListCount(qnaProductListCount);
		pageVO.setMaxPage(maxPage);
		pageVO.setPage(page);
		pageVO.setStartPage(startPage);
		
		log.info(" PageVO : " + pageVO);
		
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("articleQnaProductList", articleQnaProductList);
		
		return "/member/qna_product";
	}
	
	// 상품문의 게시판 상세내용 조회
	@RequestMapping(value="/qna_product_detail.do", method=RequestMethod.GET)
	public ModelAndView view(@RequestParam int qnaProductId, HttpSession session) throws Exception {
		
		log.info(" 상품문의 게시판 상세내용 조회 ");
		
		// 조회수 증가 처리
		qnaProductService.updateReadCount(qnaProductId);
		
		// 모델(데이터) + 뷰(화면)를 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();
		
		// 뷰의 이름
		mav.setViewName("/member/qna_product_detail");
		
		// 뷰에 전달할 데이터
		mav.addObject("dto", qnaProductService.getQnaProduct(qnaProductId));
		
		return mav;
	}
	
	// 상품문의 수정하기
	@RequestMapping(value="/qna_product_update.do", method=RequestMethod.POST)
	public String update(@ModelAttribute QnaProductVO qnaProductVO) throws Exception {
		
		log.info(" 상품문의 게시글 수정 ");
		
		qnaProductService.updateQnaProduct(qnaProductVO);
		
		return "redirect:/board/qna_product_detail.do?qnaProductId=" + qnaProductVO.getQnaProductId();
	}
	
	// 상품문의 삭제하기
	@RequestMapping("qna_product_delete.do")
	public String delete(@RequestParam int qnaProductId) throws Exception {
		
		log.info(" 상품문의 게시글 삭제 ");
		
		qnaProductService.deleteQnaProduct(qnaProductId);
		
		return "redirect:/board/qna_product.do/1";
	}
	
	// 상품문의 댓글달기
	@RequestMapping("/replyWriteQnaProductProc.do")
	@ResponseBody
	public String replyWriteQnaProductProc(QnaProductVO qnaProductVO) throws Exception { 
		
		log.info(" 상품문의 댓글달기 ");

		log.info(" QnaProductVO : "+qnaProductVO);
		
		boolean msg = false;
		
		// 답글 등록 관련 변수
		int reRef = qnaProductVO.getQnaProductId(); // 댓글의 원 게시글 번호
		int reLev = qnaProductVO.getQnaProductReLev(); // 댓글의 레벨
		int reSeq = qnaProductVO.getQnaProductReSeq(); // 댓글의 순서
		
		qnaProductService.updateQnaProductByRefAndSeq(reRef, reSeq);
		
		// 답글 관련 인자 계산
		reSeq = reSeq + 1;
		reLev = reLev + 1;
		
		qnaProductVO.setQnaProductReSeq(reSeq);
		qnaProductVO.setQnaProductReLev(reLev);
		
		// 원글 번호 -> 원글 참고 번호
		qnaProductVO.setQnaProductReRef(reRef);
		
		msg = qnaProductService.replyWriteQnaProduct(qnaProductVO);
		
		return msg + "";
	}
	
	// 상품문의 상세보기
	@RequestMapping(value="/qna_product_detail_check.do",
					method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView qnaProductPage(@RequestParam("qnaProductId") int qnaProductId,
									   HttpSession session) throws Exception {
		
		log.info(" 상품문의 상세보기 ");

		// 모델(데이터) + 뷰(화면)를 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();
		
		// 뷰의 이름
		mav.setViewName("/member/qna_product_check");
		
		// 뷰에 전달할 데이터
		mav.addObject("defaultQnaProductVO", qnaProductService.getQnaProduct(qnaProductId));
		
		return mav;
	}
	
	// 상품문의 상세보기 비밀번호 확인
	@RequestMapping(value="/qna_product_pw_proc.do", method = {RequestMethod.GET, RequestMethod.POST},
					produces="text/plain; charset=UTF-8")
	@ResponseBody
	public String qnaProductPwCheck(@RequestParam("qnaProductId") int qnaProductId,
									@RequestParam("qnaProductPw") String qnaProductPw,
									Model model) throws Exception {
		
		log.info(" 상품문의 상세보기 비밀번호 확인 ");
		
		String msg="";
		
		log.info(" qnaProductId :"+qnaProductId);
		log.info(" qnaProductPw :"+qnaProductPw);
		
		try {
			QnaProductVO qnaProdutVO =
					qnaProductService.getQnaProductByIdAndPw(qnaProductId, qnaProductPw);
			
			log.info(" qnaProdutVO :"+qnaProdutVO);
			
			if(qnaProdutVO==null) {
				throw new NullPointerException();
			}
			msg = "입력한 비밀번호가 일치합니다";
		} catch (NullPointerException e) {
			
			log.error(" 에러 : "+ e.toString());
			
			msg = "입력한 비밀번호가 일치하지 않습니다";
		}
		return msg;
	}
}
