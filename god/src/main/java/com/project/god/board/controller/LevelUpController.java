package com.project.god.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

/**
 * 등업신청 컨트롤러
 * 
 * @author god
 *
 */

@Controller
@Slf4j
@RequestMapping("/board")
public class LevelUpController {
	
	// 등업신청
	@RequestMapping("/levelup.do")
	public String levelUp() {
		
		log.info("등업신청");
		
		return "/member/levelup";
	}
}
