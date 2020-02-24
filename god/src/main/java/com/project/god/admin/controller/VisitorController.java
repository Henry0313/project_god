package com.project.god.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

/**
 * 관리자 통계 : 방문자수 / 페이지뷰 컨트롤러
 * 
 * @author god
 *
 */

@Controller
@Slf4j
@RequestMapping("/admin")
public class VisitorController {
	
	// 방문자수 / 페이지뷰
	@RequestMapping("/admin_visitor.do")
	public String visitor() {
		
		log.info(" 방문자수/페이지뷰 ");
		
		return "/admin/admin_visitor";
	}
}
