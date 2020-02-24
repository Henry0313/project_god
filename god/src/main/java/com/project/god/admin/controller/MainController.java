package com.project.god.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

/**
 * 관리자 메인화면 컨트롤러
 * 
 * @author god
 *
 */

@Controller
@Slf4j
@RequestMapping("/admin")
public class MainController {
	
	@RequestMapping("/")
	public String adminHome() {
		
		log.info(" 관리자 Home ");
		
		return "redirect:/admin/admin_main.do";
	}
	
	@RequestMapping("/admin_main.do")
	public String adminMain() {
		
		log.info(" 관리자 Main ");
		
		return "/admin/admin_main";
	}
}
