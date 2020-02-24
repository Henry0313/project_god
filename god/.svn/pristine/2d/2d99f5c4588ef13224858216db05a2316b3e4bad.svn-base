package com.project.god.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

/**
 * Home 컨트롤러
 * 
 * @author god
 *
 */

@Controller
@Slf4j
public class HomeController {

	// HOME
	@RequestMapping("/")
	public String home() {
		
		log.info(" HOME ");
		
		return "/member/home";	
	}
	
	// 쇼핑몰 상단 우측 search버튼으로 검색 시
	@RequestMapping("/productSearch.do")
	public String prdSearch() {
		
		log.info(" 상품 검색 ");
		
		return "member/product_search";
	}
	
}
