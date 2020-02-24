package com.project.god.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.god.domain.CategoryVO;
import com.project.god.domain.PageVO;
import com.project.god.domain.ProductDTO;
import com.project.god.domain.ProductVO;
import com.project.god.service.ProductService;

import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONArray;

/**
 * 관리자 상품 리스트 컨트롤러
 * 
 * @author god
 *
 */

@Controller
@Slf4j
@RequestMapping("/admin")
public class ProductListController {
	
	@Autowired
	ProductService productService;
	
	// 상품 리스트
	@RequestMapping(value="/admin_product_list.do/{page}", method=RequestMethod.GET)
	public String productList(@PathVariable("page") int page, Model model) throws Exception {
		
		log.info(" 상품 리스트 ");
		
		int limit = 5; // 페이지당 글수
		
		List<ProductVO> productList;
		List<CategoryVO> categoryList = null;
		
		page = page!=0 ? page : 1; // page 설정

		// 총 상품 개수
		int productListCount = productService.getProductListCount();
		
		productList = productService.getProductList(page, limit);
		categoryList = productService.getCategoryList();
		
		// 총 페이지 수
   		int maxPage=(int)((double)productListCount/limit + 0.95); //0.95를 더해서 올림 처리
   		
		// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21,...)
   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   		
		// 현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30, ...)
   	    int endPage = startPage + 10 - 1;
   	    
   	    if (endPage > maxPage) endPage= maxPage;
   	    
   	    PageVO pageVO = new PageVO();
		pageVO.setEndPage(endPage);
		pageVO.setProductListCount(productListCount);
		pageVO.setMaxPage(maxPage);
		pageVO.setPage(page);
		pageVO.setStartPage(startPage);
		pageVO.setProductListTotCount(productListCount);
		
		log.info(" PageVO : " + pageVO);
		
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("productList", productList);
		model.addAttribute("categoryList", JSONArray.fromObject(categoryList));
		
		log.info(" productList : " + productList);
		log.info(" categoryList : " + categoryList);
		
		return "/admin/admin_product_list";
	}
	
	// 상품 리스트 검색 상품 보기
	@RequestMapping("/productListbySearch.do")
	public String productListbySearch(@RequestParam(value="page", defaultValue="1") int page,
								  	  @RequestParam("search_word") String searchWord,
								  	  @RequestParam("search_date1") String searchDate1,
								  	  @RequestParam("search_date2") String searchDate2,
								  	  @RequestParam("search_info") String searchInfo,
								  	  @RequestParam("search_price1") String searchPrice1,
								  	  @RequestParam("search_price2") String searchPrice2,
								  	  Model model) {
		
		log.info(" 검색 상품 보기 ");
		
		int limit = 5; // 페이지당 글수
		List<ProductVO> productList;
		
		// 총 상품 개수
		int productListTotCount = productService.getProductListCount();
		
		// 검색된 상품 개수
		int allProductsListCount = productService.getAllProductsBySearch(searchWord, searchDate1,
																		 searchDate2, searchInfo,
																		 searchPrice1, searchPrice2);

		// 총 게시글 & 총 게시글 수 
		productList = productService.getProductBySearch(searchWord.trim(), searchDate1, searchDate2,
														searchInfo, searchPrice1, searchPrice2,
														limit, page);
		
		int productListCount = productService.getAllProductsBySearch(searchWord, searchDate1,
																	 searchDate2, searchInfo,
																	 searchPrice1, searchPrice2);
		
		log.info(" 검색 상품 수 : {}", productListCount);
		
		// 총 페이지 수
   		int maxPage=(int)((double)productListCount/limit + 0.95); //0.95를 더해서 올림 처리
		// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21,...)
   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30, ...)
   	    int endPage = startPage + 10 - 1;
   	    
   	    if (endPage > maxPage) endPage = maxPage;
   	    
   	    PageVO pageVO = new PageVO();
		pageVO.setEndPage(endPage);
		pageVO.setProductListCount(allProductsListCount);
		pageVO.setMaxPage(maxPage);
		pageVO.setPage(page);
		pageVO.setStartPage(startPage);
		pageVO.setProductListTotCount(productListTotCount);
		
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("productList", productList);
		
		// 추가 : 페이징 부분에서 검색 페이지 주소 반영위한 플래그 변수
		// 검색어 재전송
		model.addAttribute("search_YN", "search");
		model.addAttribute("search_date1", searchDate1);
		model.addAttribute("search_date2", searchDate2);
		model.addAttribute("search_info", searchInfo);
		model.addAttribute("search_price1", searchPrice1);
		model.addAttribute("search_price2", searchPrice2);
		model.addAttribute("search_word", searchWord);
		 
		return "/admin/admin_product_list";
	}
	
	// 상품 수정 버튼 눌렀을 시 개별 조회
	@RequestMapping(value="/viewProduct")
	public String viewProduct(@ModelAttribute("productVO") ProductVO productVO, Model model,
							  HttpServletRequest request) throws Exception {
		
		log.info(" 상품 개별 조회 ");
		
		int productId = Integer.parseInt(request.getParameter("productId"));
		productVO.setProductId(productId);
		
		ProductVO resultVO = productService.getProduct(productId);
		
		model.addAttribute("result", resultVO);
		
		return "/admin/admin_product_update";
	}
	
	// 상품 삭제
	@ResponseBody
	@RequestMapping(value="/delete_product.do", method=RequestMethod.POST)
	public String deleteProduct(@RequestParam(value="checkBox[]") List<String> chArr,
								ProductVO productVO) throws Exception {
		
		log.info(" 상품 삭제 ");
		
		int productId = 0;
		
		for(String i : chArr) {
			productId = Integer.parseInt(i);
			productVO.setProductId(productId);
			productService.deleteProduct(productVO);
		}
		
		return "redirect:/admin/admin_product_list.do/1";
	}
	
	// 상품 수정
	@RequestMapping(value="update_product.do")
	public String updateProduct(@ModelAttribute("productDTO") ProductDTO productDTO)
								throws Exception {
		
		log.info(" 상품 수정 ");
		
		try {
			productService.updateProduct(productDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/admin/admin_product_list.do/1";
	}
	
	// 상품 진열 여부 수정 (하단 버튼)
	// 진열
	@RequestMapping(value="dUpdate_product.do")
	public String dUpdateProduct(@ModelAttribute("productDTO") ProductDTO productDTO)
								 throws Exception {
		
		log.info(" 상품 진열 여부 수정 (하단 버튼) - 진열 ");
		
		try {
			productService.dUpdateProduct(productDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/admin/admin_product_list.do/1";
	}
	
	// 숨김
	@RequestMapping(value="hUpdate_product.do")
	public String hUpdateProduct(@ModelAttribute("productDTO") ProductDTO productDTO)
								 throws Exception {
		
		log.info(" 상품 진열 여부 수정 (하단 버튼) - 숨김 ");
		
		try {
			productService.hUpdateProduct(productDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/admin/admin_product_list.do/1";
	}
}
