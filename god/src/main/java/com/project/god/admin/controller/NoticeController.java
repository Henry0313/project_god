package com.project.god.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

/**
 * 관리자 공지사항 컨트롤러
 * 
 * @author god
 *
 */

@Controller
@Slf4j
@RequestMapping("/admin")
public class NoticeController {
	
	// 공지사항
	@RequestMapping("/admin_notice.do")
	public String notice() {
		
		log.info(" 공지사항 ");
		
		return "/admin/admin_notice";
	}
	
	// 글쓰기
	@RequestMapping("/admin_notice_write.do")
	public String noticeWrite() {
		
		log.info(" 공지사항 글쓰기 ");
		
		return "/admin/admin_notice_write";
	}
}
