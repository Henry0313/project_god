package com.project.god.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

/**
 * 관리자 탈퇴회원 리스트 컨트롤러
 * 
 * @author god
 *
 */

@Controller
@Slf4j
@RequestMapping("/admin")
public class DropoutListController {
	
	// 탈퇴회원 리스트
	@RequestMapping("/admin_dropout_list.do")
	public String dropoutList() {
		
		log.info(" 탈퇴회원 리스트 ");
		
		return "/admin/admin_dropout_list";
	}
}
