package com.project.god.admin.controller;

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

import com.project.god.domain.PageVO;
import com.project.god.domain.PreNextVO;
import com.project.god.domain.QnaProductDTO;
import com.project.god.domain.QnaProductVO;
import com.project.god.service.QnaProductService;

import lombok.extern.slf4j.Slf4j;

/**
 * 관리자 Q&A 상품관리 게시판 컨트롤러
 * 
 * @author god
 *
 */

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminQnaProductController {
	
	@Autowired
	private QnaProductService qnaProductService;
	
	// 상품관리 게시글 작성화면
	@RequestMapping(value="/admin_qna_write.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String qnaProductWrite() {
		
		log.info(" 상품관리 게시판 글쓰기 ");
		
		return "/admin/admin_qna_write";
	}
	
	// 상품관리 게시글 작성 처리
	@RequestMapping(value="/qna_product_write.do", method = RequestMethod.POST,
					produces = "text/plain; charset=UTF-8")
	public String writeQnaProductProc(@ModelAttribute("qnaProductDTO") 
									  QnaProductDTO qnaProductDTO) throws Exception {
	
		log.info(" writeQnaProductProc ");
				
		log.info(" VO : {}", qnaProductDTO);
		
		int qnaProductId = 0;
		
		// 추가 : 신규 qnaProductId 값 구하기 (sequence)
		qnaProductId = qnaProductService.getQnaProductIdByLastSeq();
		
		log.info("시퀀스 게시글 번호 : " + qnaProductId);
		
		QnaProductVO qnaProductVO = new QnaProductVO(qnaProductDTO);
		
		qnaProductVO.setQnaProductId(qnaProductId);
		qnaProductVO.setQnaProductReRef(qnaProductId);
		
		qnaProductService.writeQnaProduct(qnaProductVO);
		
		return "redirect:/admin/admin_board_qna_product.do/1";
	}
	
	// 답글 작성처리
	@RequestMapping(value="/reply_qna_write_proc.do", method = RequestMethod.POST,
					produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String replyWriteQnaProductProc(QnaProductVO qnaProductVO) throws Exception { 
		
		log.info(" Q&A 상품등록 답글 작성 처리 ");
		
		log.info(" qnaProductVO : " + qnaProductVO);
		
		boolean msg = false;
		
		// 답글 등록 관련 변수
		int reRef = qnaProductVO.getQnaProductId(); // 댓글의 원 게시글 번호
		
		log.info(" reRef : " + reRef);
		
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
	
	// Q&A 상품등록 게시판
	@RequestMapping("/admin_board_qna_product.do/{page}")
	public String boardQna(@PathVariable("page") int page, Model model) {
		
		log.info(" Q&A 상품등록 게시판 ");
		
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
		
		return "/admin/admin_qna_product";
	}
	
	// Q&A 상품등록 게시판 검색 게시글
	@RequestMapping("/qnaProductListbySearch.do")
	public String qnaListbySearch(@RequestParam(value="page", defaultValue="1") int page,
								  @RequestParam("search_date") String searchDate,
								  @RequestParam("search_kind") String searchKind,
								  @RequestParam("search_word") String searchWord, Model model) {
		
		log.info(" Q&A 상품등록 게시판 검색 게시글 ");
		
		int limit = 10; // 페이지당 글수
		List<QnaProductVO> articleQnaProductList;
		
		// page = page!=0 ? page : 1; // page 설정

		// 총 게시글 & 총 게시글 수 
		articleQnaProductList= qnaProductService.getQnaProductBySearch(searchDate,
																	   searchKind,
																	   searchWord.trim(),
																	   limit, page);
		
		int listCount = qnaProductService.getAllQnaProductsBySearch(searchDate,
																	searchKind,
																	searchWord);
		
		log.info(" 검색 게시글 수 : {}", listCount);
		
		// 총 페이지 수
   		int maxPage=(int)((double)listCount/limit+0.95); //0.95를 더해서 올림 처리
		// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21,...)
   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30, ...)
   	    int endPage = startPage + 10 - 1;
   	    
   	    if (endPage> maxPage) endPage= maxPage;
   	    
   	    PageVO pageVO = new PageVO();
		pageVO.setEndPage(endPage);
		pageVO.setQnaProductListCount(listCount);
		pageVO.setMaxPage(maxPage);
		pageVO.setPage(page);
		pageVO.setStartPage(startPage);
		
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("articleQnaProductList", articleQnaProductList);
		
		// 추가 : 페이징 부분에서 검색 페이지 주소 반영위한 플래그 변수
		// 검색어 재전송
		model.addAttribute("search_YN", "search");
		model.addAttribute("search_date", searchDate);
		model.addAttribute("search_kind", searchKind);
		model.addAttribute("search_word", searchWord);
		
		return "/admin/admin_qna_product";
	}
	
	// Q&A 상품등록 게시판 상세내용 조회
	@RequestMapping(value="/admin_board_qna_product_detail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView view(@RequestParam int qnaProductId, HttpSession session) throws Exception {
		
		log.info(" Q&A 상품등록 게시판 상세내용 조회 ");
		
		// 조회수 증가 처리
		qnaProductService.updateReadCount(qnaProductId);
		
		// 이전글
		int preId = qnaProductService.getPre(qnaProductId);
		// 다음글
		int nextId = qnaProductService.getNext(qnaProductId);
		
		PreNextVO preNextVO = new PreNextVO();
		preNextVO.setPreId(preId);
		preNextVO.setNextId(nextId);
		
		// 모델(데이터) + 뷰(화면)를 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();
		
		// 뷰의 이름
		mav.setViewName("/admin/admin_qna_product_detail");
		
		// 뷰에 전달할 데이터
		mav.addObject("qnaProductVO", qnaProductService.getQnaProduct(qnaProductId));
		mav.addObject("preId", qnaProductService.getPre(qnaProductId));
		mav.addObject("nextId", qnaProductService.getNext(qnaProductId));
		
		// 이전글 제목
		mav.addObject("preTitle", qnaProductService.getQnaProduct(preId));
		// 다음글 제목
		mav.addObject("nextTitle", qnaProductService.getQnaProduct(nextId));
		
		return mav;
	}
	
	// Q&A 상품등록 게시판 상세내용 수정하기
	@RequestMapping(value="/admin_board_qna_product_update.do", method=RequestMethod.POST)
	public String update(@ModelAttribute QnaProductVO qnaProductVO) throws Exception {
		
		log.info(" Q&A 상품등록 게시판 상세내용 수정하기 ");
		
		qnaProductService.updateQnaProduct(qnaProductVO);
		
		return "redirect:/admin/admin_board_qna_product_detail.do?qnaProductId="
				+ qnaProductVO.getQnaProductId();
	}
	
	// Q&A 상품등록 게시판 삭제하기
	@RequestMapping("qna_product_delete.do")
	public String delete(@RequestParam int qnaProductId) throws Exception {
		
		log.info(" Q&A 상품등록 게시판 삭제하기 ");
		
		qnaProductService.deleteQnaProduct(qnaProductId);
		
		return "redirect:/admin/admin_board_qna_product.do/1";
	}
}
