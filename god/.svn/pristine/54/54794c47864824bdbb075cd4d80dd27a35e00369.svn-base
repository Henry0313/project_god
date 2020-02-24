package com.project.god.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.god.domain.MemberVO;
import com.project.god.service.MemberService;

import lombok.extern.slf4j.Slf4j;

/**
 * 아이디 패스워드 찾기 및 패스워드 변경 컨트롤러
 * 
 * @author god
 *
 */

@Controller
@Slf4j
@RequestMapping("/member")
public class FindController {
	
	@Autowired
	private MemberService memberService;
	
	// 아이디 찾기 화면
	@RequestMapping("/find_id.do")
	public String findId() {
		
		log.info(" findId ");
		
		return "/member/find_id";
	}
	
	// 아이디 찾기 처리
	@RequestMapping("/find_id_proc.do")
	public String findIdProc(@RequestParam("memberName")String memberName,
							 @RequestParam("memberEmail") String memberEmail,
							 @RequestParam("memberCellphone")String memberCellphone,
							 Model model) throws Exception {
		
		log.info(" 회원 아이디 찾기 ");
		
		//검색 필드/값 선정
		String searchField = "";
		String searchValue = "";
		MemberVO memberVO = null;
		
		searchField = memberEmail.contentEquals("")? "memberCellphone" : "memberEmail";
		searchValue = searchField.contentEquals("memberCellphone")? memberCellphone: memberEmail; 
			
		log.info(" searchField : " + searchField);
		log.info(" searchValue : " + searchValue);
		
		memberVO = memberService.getMemberIdByInfo(memberName, searchField, searchValue);
		
		model.addAttribute("memberVO", memberVO);
		
		return "/member/find_result";
	}
	
	// 패스워드 찾기
	@RequestMapping("/find_pw.do") 
	public String findPw() { 
		
		log.info(" 패스워드 찾기 ");
		
		return "/member/find_pw"; 
	}
	 
	// 패스워드 찾기 처리
	@RequestMapping("/find_pw_proc.do")
	public String findPwProc(@RequestParam("memberId")String memberId,
							 @RequestParam("memberName")String memberName,
			 				 @RequestParam("memberEmail")String memberEmail,
			 				 @RequestParam("memberCellphone")String memberCellphone,
			 				 MemberVO memberVO,
			 				 Model model) throws Exception {
		
		log.info(" 패쓰워드 찾기 처리 ");
		
		String searchField = "";
		String searchValue = "";

		searchField = memberEmail.contentEquals("")? "memberCellphone" : "memberEmail";
		searchValue = searchField.contentEquals("memberCellphone")? memberCellphone: memberEmail; 
			
		log.info(" searchField : " + searchField);
		log.info(" searchValue : " + searchValue);
		
		memberVO = memberService.getMemberPwByInfo(memberId, memberName, searchField, searchValue);
		
		model.addAttribute("memberVO", memberVO);
		
		return "/member/find_pw_result";
	}
	
	// 패스워드 변경
	@RequestMapping("/pwUpdate.do")
	public String pwUpdate(MemberVO memberVO, Model model)throws Exception {
		
		log.info(" 패쓰워드 변경 ");
		
		BCryptPasswordEncoder passwordEncoder
        = new BCryptPasswordEncoder();
		memberVO.setMemberPw(passwordEncoder.encode(memberVO.getMemberPw()));
		
		memberService.pwUpdate(memberVO);
		
		return "/member/login";
	}
}
