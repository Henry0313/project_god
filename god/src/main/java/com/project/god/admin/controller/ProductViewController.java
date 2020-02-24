package com.project.god.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

/**
 * 관리자 통계 : 상품 조회수 컨트롤러
 * 
 * @author god
 *
 */

@Controller
@Slf4j
@RequestMapping("/admin")
public class ProductViewController {
	
	// 상품 조회수
	@RequestMapping("/admin_product_view.do")
	public String productView() {
		
		log.info(" 상품 조회수 ");
		
		return "/admin/admin_product_view";
	}
}
