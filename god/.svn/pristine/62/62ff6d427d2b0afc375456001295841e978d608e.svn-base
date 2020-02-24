package com.project.god.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

/**
 * 배송 문의 컨트롤러
 * 
 * @author god
 *
 */

@Controller
@Slf4j
@RequestMapping("/board")
public class DeliverController {
	
	// 배송 문의
	@RequestMapping("/deliver.do")
	public String deliver() {
		
		log.info(" 배송 문의 ");
		
		return "/member/deliver";
	}
	
	// 상세보기
	@RequestMapping("/deliver_detail.do")
	public String deliverDetail() {
		
		log.info(" 배송문의 상세보기 ");
		
		return "/member/deliver_detail";
	}
}
