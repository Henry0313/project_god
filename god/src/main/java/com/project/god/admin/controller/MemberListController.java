package com.project.god.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

/**
 * 관리자 회원 리스트 컨트롤러
 * 
 * @author god
 *
 */

@Controller
@Slf4j
@RequestMapping("/admin")
public class MemberListController {
	
	// 회원 리스트
	@RequestMapping("/admin_member_list.do")
	public String memberList() {
		
		log.info(" 회원 리스트 ");
		
		return "/admin/admin_member_list";
	}
	
	// 회원 정보 상세보기
	@RequestMapping("/admin_member_detail.do")
	public String memberDetail() {
		
		log.info(" 회원정보 상세 ");
		
		return "/admin/admin_member_detail";
	}
}
