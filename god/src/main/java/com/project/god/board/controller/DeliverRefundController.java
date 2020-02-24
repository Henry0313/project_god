package com.project.god.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

/**
 * 배송 후 교환/반품 컨트롤러
 * 
 * @author god
 *
 */

@Controller
@Slf4j
@RequestMapping("/board")
public class DeliverRefundController {
	
	// 배송 후 교환/반품
	@RequestMapping("/deliver_refund.do")
	public String deliverRefund() {
		
		log.info(" 배송 후 교환/반품 ");
		
		return "/member/deliver_refund";
	}
}
