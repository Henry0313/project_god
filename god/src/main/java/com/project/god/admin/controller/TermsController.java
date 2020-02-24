package com.project.god.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

/**
 * 관리자 약관관리 컨트롤러
 * 
 * @author god
 *
 */

@Controller
@Slf4j
@RequestMapping("/admin")
public class TermsController {
	
	// 약관관리
	@RequestMapping("/admin_terms.do")
	public String terms() {
		
		log.info(" 약관관리 ");
		
		return "/admin/admin_terms";
	}
}
