package com.project.god.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.god.domain.MemberVO;
import com.project.god.service.MemberService;

import lombok.extern.slf4j.Slf4j;

/**
 * Update 컨트롤러
 * 
 * @author god
 *
 */

@Controller
@Slf4j
@RequestMapping("/member")
public class UpdateController {
	
	@Autowired
	private MemberService memberService;
	
	// 회원정보 수정
	@RequestMapping("/update.do")
	public String update(@RequestParam("memberId") String memberId,
			 			 Model model) throws Exception {
		
		log.info("회원정보수정");
		log.info("# 회원아이디 :"+memberId);
		
		// 기존 회원정보 가져오기
		MemberVO memberVO = memberService.getMember(memberId);
		
		log.info(" memberVO : " + memberVO);
		
		// 기존 정보 인자 전송
		model.addAttribute("defaultMemberVO", memberVO);
		
		return "/member/update";
	}
	
	// 회원정보 수정 처리
	@RequestMapping(value="/update_proc.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String updateProc(@ModelAttribute("memberVO")MemberVO memberVO,
							 Model model) throws Exception {
		
		log.info(" 회원정보수정처리 ");
		log.info(" memberVO : " + memberVO);
		log.info(" memberVO.getMemberPw()1 : " + memberVO.getMemberPw());
		
		String oldMemberPw = ""; //기존 패쓰워드
		String memberPw = memberVO.getMemberPw(); // 신규 패쓰워드
		String msg = "";
				
		oldMemberPw = memberService.getMember(memberVO.getMemberId()).getMemberPw();
		
		// 패스워드 암호화
		BCryptPasswordEncoder passwordEncoder
        = new BCryptPasswordEncoder();
		
		// 비밀번호 입력란이 null일 경우 기존 비번으로
		if(memberPw == null || memberPw.trim().contentEquals("")) {
		   memberVO.setMemberPw(oldMemberPw);
		}
		else {
			memberVO.setMemberPw(passwordEncoder.encode(memberVO.getMemberPw()));
		}
		
		log.info(" memberPw : " + memberPw);
		log.info(" memberVO.getMemberPw()2 : " + memberVO.getMemberPw());
		
		log.info(" memberVO@22 : " + memberVO);
		
		if (memberService.updateMember(memberVO)==true) {
			msg="회원수정에 성공했습니다.";
		} else {
			msg="회원수정에 실패했습니다.";
		}
		
		model.addAttribute("msg", msg);
		
		memberVO = memberService.getMember(memberVO.getMemberId());
		
		// 기존 정보 인자 전송
		model.addAttribute("defaultMemberVO", memberVO);
	
		return "/member/update";
	}
	
	// 회원 탈퇴
	@RequestMapping("delete.do")
	public String deleteMember(@ModelAttribute("memberId")String memberId,
								HttpServletRequest request,
								HttpServletResponse response) throws Exception {
		
		log.info(" deleteMember_role ");
		log.info(" deleteMember ");
		
		memberService.deleteMember(memberId);
		
		log.info(" memberId : " + memberId);
		
		Authentication auth 
    	= SecurityContextHolder.getContext()
    						   .getAuthentication();
		
		log.info(" auth : " + auth);
	    
	    // logout !
	    if (auth != null) {    
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    }
		return "/member/logout";
	}
}
