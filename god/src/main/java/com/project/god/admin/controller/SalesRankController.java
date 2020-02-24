package com.project.god.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

/**
 * 관리자 통계 : 상품 판매 순위 컨트롤러
 * 
 * @author god
 *
 */

@Controller
@Slf4j
@RequestMapping("/admin")
public class SalesRankController {
	
	// 상품 판매 순위
	@RequestMapping("/admin_sales_rank.do")
	public String salesRank() {
		
		log.info(" 상품 판매 순위 ");
		
		return "/admin/admin_sales_rank";
	}
}
