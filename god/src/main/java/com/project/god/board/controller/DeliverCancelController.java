package com.project.god.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

/**
 * 배송 전 변경/취소 컨트롤러
 * 
 * @author god
 *
 */

@Controller
@Slf4j
@RequestMapping("/board")
public class DeliverCancelController {
	
	// 배송 전 변경/취소
	@RequestMapping("/deliver_cancel.do")
	public String deliverCancel() {
		
		log.info(" 배송 전 변경/취소 ");
		
		return "/member/deliver_cancel";
	}
}
