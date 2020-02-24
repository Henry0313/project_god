package com.project.god.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

/**
 * BEST REVIEW 컨트롤러
 * 
 * @author god
 *
 */

@Controller
@Slf4j
@RequestMapping("/board")
public class BestReviewController {
	
	// BEST REVIEW
	@RequestMapping("/best_review.do")
	public String bestReview() {
		
		log.info(" BEST REVIEW ");
		
		return "/member/best_review";
	}
}
