package com.project.god.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

/**
 * 관리자 웹 사이트 개선 게시판 컨트롤러
 * 
 * @author god
 *
 */

@Controller
@Slf4j
@RequestMapping("/admin")
public class WebImproveController {
	
	// 웹 사이트 개선 게시판
	@RequestMapping("/admin_web_improve.do")
	public String webImprove() {
		
		log.info(" 웹 사이트 개선 게시판 ");
		
		return "/admin/admin_web_improve";
	}
	
	// 글쓰기
	@RequestMapping("/admin_web_improve_write.do")
	public String webImproveWrite() {
		
		log.info(" 웹 사이트 개선 게시판 글쓰기 ");
		
		return "/admin/admin_web_improve_write";
	}
}
