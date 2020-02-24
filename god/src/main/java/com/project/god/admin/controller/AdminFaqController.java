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
import org.springframework.web.servlet.ModelAndView;

import com.project.god.domain.PageVO;
import com.project.god.domain.PreNextVO;
import com.project.god.domain.FaqVO;
import com.project.god.service.FaqService;

import lombok.extern.slf4j.Slf4j;

/**
 * 관리자 FAQ 게시판 컨트롤러
 * 
 * @author god
 *
 */

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminFaqController {
	
	@Autowired
	private FaqService faqService;
	
	// FAQ 게시판 목록
	@RequestMapping("/admin_board_faq.do/{page}")
	public String boardFaq(@PathVariable("page") int page, Model model) {
		
		log.info(" FAQ 게시판 목록 ");
		
		int limit = 10; // 페이지당 글수
		List<FaqVO> articleFaqList;
		page = page!=0 ? page : 1; // page 설정

		int faqListCount = faqService.getFaqListCount();
		
		articleFaqList= faqService.getArticleFaqList(page, limit);
		
		// 총 페이지 수
   		int maxPage=(int)((double)faqListCount/limit+0.95); //0.95를 더해서 올림 처리
   		
		// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21,...)
   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   		
		// 현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30, ...)
   	    int endPage = startPage + 10 - 1;
   	    
   	    if (endPage > maxPage) endPage = maxPage;
   	    
   	    PageVO pageVO = new PageVO();
		pageVO.setEndPage(endPage);
		pageVO.setFaqListCount(faqListCount);
		pageVO.setMaxPage(maxPage);
		pageVO.setPage(page);
		pageVO.setStartPage(startPage);
		
		log.info(" PageVO : " + pageVO);
		
		// 페이지
		model.addAttribute("pageVO", pageVO);
		
		// FAQ 리스트
		model.addAttribute("articleFaqList", articleFaqList);
		
		return "/admin/admin_board_faq";
	}
	
	// FAQ 게시판 검색 게시글 보기
	@RequestMapping("/faqListbySearch.do")
	public String faqListbySearch(@RequestParam(value="page", defaultValue="1") int page,
								  @RequestParam("search_date") String searchDate,
								  @RequestParam("search_kind") String searchKind,
								  @RequestParam("search_word") String searchWord, Model model) {
		
		log.info(" FAQ 검색 게시글 보기 ");
		
		int limit = 10; // 페이지당 글수
		List<FaqVO> articleFaqList;

		// 총 게시글 & 총 게시글 수 
		articleFaqList= faqService.getFaqBySearch(searchDate, searchKind, searchWord.trim(),
												  limit, page);
		
		int listCount = faqService.getAllFaqsBySearch(searchDate, searchKind, searchWord);
		
		log.info(" 검색 게시글 수 : {}", listCount);
		
		// 총 페이지 수
   		int maxPage=(int)((double)listCount/limit+0.95); //0.95를 더해서 올림 처리
		// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21,...)
   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30, ...)
   	    int endPage = startPage + 10 - 1;
   	    
   	    if (endPage > maxPage) endPage = maxPage;
   	    
   	    PageVO pageVO = new PageVO();
		pageVO.setEndPage(endPage);
		pageVO.setFaqListCount(listCount);
		pageVO.setMaxPage(maxPage);
		pageVO.setPage(page);
		pageVO.setStartPage(startPage);
		
		// 페이지
		model.addAttribute("pageVO", pageVO);
		
		// FAQ 리스트
		model.addAttribute("articleFaqList", articleFaqList);
		
		// 추가 : 페이징 부분에서 검색 페이지 주소 반영위한 플래그 변수
		// 검색어 재전송
		model.addAttribute("search_YN", "search");
		model.addAttribute("search_date", searchDate);
		model.addAttribute("search_kind", searchKind);
		model.addAttribute("search_word", searchWord);
		
		return "/admin/admin_board_faq";
	}
	
	// FAQ 게시판 상세내용 조회
	@RequestMapping(value="/admin_board_faq_detail.do", method=RequestMethod.GET)
	public ModelAndView view(@RequestParam int faqId, HttpSession session) throws Exception {
		
		log.info(" FAQ 상세보기 ");
		
		// 조회수 증가 처리
		faqService.increaseFaqViewcnt(faqId, session);
		
		// 이전글
		int preId = faqService.getPre(faqId);
		// 다음글
		int nextId = faqService.getNext(faqId);
		
		PreNextVO preNextVO = new PreNextVO();
		preNextVO.setPreId(preId);
		preNextVO.setNextId(nextId);
		
		// 모델(데이터) + 뷰(화면)를 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();
		
		// 뷰의 이름
		mav.setViewName("/admin/admin_board_faq_detail");
		
		// 뷰에 전달할 데이터
		mav.addObject("dto", faqService.getFaq(faqId));
		mav.addObject("preId", faqService.getPre(faqId));
		mav.addObject("nextId", faqService.getNext(faqId));
		
		// 이전글 제목
		mav.addObject("preTitle", faqService.getFaq(preId));
		// 다음글 제목
		mav.addObject("nextTitle", faqService.getFaq(nextId));
		
		return mav;
	}
	
	// FAQ 수정하기
	@RequestMapping(value="/update.do", method=RequestMethod.POST)
	public String update(@ModelAttribute FaqVO faqVO) throws Exception {
		
		log.info(" FAQ 게시글 수정 ");
		
		faqService.updateFaq(faqVO);
		
		return "redirect:/admin/admin_board_faq_detail.do?faqId=" + faqVO.getFaqId();
	}
	
	// FAQ 삭제하기
	@RequestMapping("/delete.do")
	public String delete(@RequestParam int faqId) throws Exception {
		
		log.info(" FAQ 게시글 삭제 ");
		
		faqService.deleteFaq(faqId);
		
		return "redirect:/admin/admin_board_faq.do/1";
	}
}
