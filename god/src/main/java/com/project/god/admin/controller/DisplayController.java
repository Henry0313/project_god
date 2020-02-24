package com.project.god.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

/**
 * 관리자 상품 진열 컨트롤러
 * 
 * @author god
 *
 */

@Controller
@Slf4j
@RequestMapping("/admin")
public class DisplayController {
	
	// 상품 진열
	@RequestMapping("/admin_display.do")
	public String display() {
		
		log.info(" 상품진열 ");
		
		return "/admin/admin_display";
	}
}
