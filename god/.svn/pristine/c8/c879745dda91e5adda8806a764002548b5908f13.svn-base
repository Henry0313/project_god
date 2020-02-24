package com.project.god.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.god.domain.PageVO;
import com.project.god.domain.ProductVO;
import com.project.god.service.ProductService;

import lombok.extern.slf4j.Slf4j;

/**
 * 상품 컨트롤러
 * 
 * @author god
 *
 */

@Controller
@Slf4j
@RequestMapping("/products")
public class ProductsController {
	
	@Autowired
	private ProductService productService;
	
	// 상품 조회
	@RequestMapping(value="/product_detail.do", method=RequestMethod.GET)
	public ModelAndView view(@RequestParam("productId") int productId,
							 HttpSession session) throws Exception {
		
		log.info(" 상품 조회 ");
		
		// 상품 조회수 증가 처리
		productService.increaseProductViewcnt(productId, session);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/member/product_detail");
		
		mav.addObject("dto", productService.getProduct(productId));
		
		return mav;
	}
	
	// 카테고리별 상품 리스트
	@RequestMapping("/list.do/{code}/{page}")
	public String getCateProductList(@PathVariable("code") String cateCode, 
									 @PathVariable("page") int page, Model model) throws Exception {
		
		log.info(" 상품 리스트 ");
		
		log.info(" cateCode : " + cateCode);
		
		int limit = 12; // 페이지당 글수
		
		List<ProductVO> cateProductList;
		
		page = page!=0 ? page : 1; // page 설정
		
		// 총페이지수
		int cateProductListCount = productService.getCateProductListCount(cateCode);
		
		log.info(" cateProductListCount : " + cateProductListCount);
				
		cateProductList = productService.getCateProductList(page, limit, cateCode);
				
		// 총 페이지 수
   		int maxPage=(int)((double)cateProductListCount/limit + 0.95); //0.95를 더해서 올림 처리
   		
		// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21,...)
   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   		
		// 현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30, ...)
   	    int endPage = startPage + 10 - 1;
   	    
   	    if (endPage > maxPage) endPage = maxPage;
   	    
   	    PageVO pageVO = new PageVO();
		pageVO.setEndPage(endPage);
		pageVO.setCateProductListCount(cateProductList.size());
		pageVO.setMaxPage(maxPage);
		pageVO.setPage(page);
		pageVO.setStartPage(startPage);
		pageVO.setCateProductListTotCount(cateProductListCount);
		
		log.info(" PageVO : " + pageVO);
		
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("cateProductList", cateProductList);
		
		log.info(" cateProductList : " + cateProductList);
		
		return "/member/products";
	}
}
