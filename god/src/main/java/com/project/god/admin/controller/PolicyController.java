package com.project.god.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

/**
 * 관리자 정책관리 컨트롤러
 * 
 * @author god
 *
 */

@Controller
@Slf4j
@RequestMapping("/admin")
public class PolicyController {
	
	// 정책관리
	@RequestMapping("/admin_policy.do")
	public String policy() {
		
		log.info(" 정책관리 ");
		
		return "/admin/admin_policy";
	}
}
