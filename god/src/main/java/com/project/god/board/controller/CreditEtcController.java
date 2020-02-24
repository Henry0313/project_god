package com.project.god.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

/**
 * 입금 / 기타 문의 컨트롤러
 * 
 * @author god
 *
 */

@Controller
@Slf4j
@RequestMapping("/board")
public class CreditEtcController {
	
	// 입금 / 기타 문의
	@RequestMapping("/credit_etc.do")
	public String creditEtc() {
		
		log.info(" 입금/기타 문의 ");
		
		return "/member/credit_etc";
	}
	
	// 상세보기
	@RequestMapping("/credit_etc_detail.do")
	public String creditEtcDetail() {
		
		log.info(" 입금/기타 문의 상세보기 ");
		
		return "/member/credit_etc_detail";
	}
}
