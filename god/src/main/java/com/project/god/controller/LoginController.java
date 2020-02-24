package com.project.god.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

/**
 * 로그인 컨트롤러
 * 
 * @author god
 *
 */

@Controller
@Slf4j
public class LoginController {

	// 로그인 화면
	@RequestMapping("/login/login.do")
	public String login() {

		log.info(" 로그인 ");

		return "/member/login";
	}

	// 로그인 처리
	@RequestMapping("/login/login_proc.do")
	public String loginProc() {
		
		log.info(" 로그인 처리 ");
		
		return "/member/login";
	}

	// 로그인 에러
	@RequestMapping(value = "/login/login_error.do", method = RequestMethod.GET)
	public String loginError(ModelMap model, HttpSession session) {

		/*
	    Authentication auth 
    	= SecurityContextHolder.getContext()
    						   .getAuthentication();

	    log.info("# auth : "+auth);
	    log.error("# auth.getCredentials : "+auth.getCredentials().toString());
	    log.error("# auth.getDetails : "+auth.getDetails().toString());
	    */
		
        // Spring CustomProvider 인증(Auth) 에러 메시지 처리
        Object secuSess = session.getAttribute("SPRING_SECURITY_LAST_EXCEPTION");
 
        log.info("# 인증 오류 메시지 : " + secuSess);
		
		model.addAttribute("error", "true");
		// model.addAttribute("msg", "로그인 인증 정보가 잘못되었습니다.");
		model.addAttribute("msg", secuSess);

		return "/member/login";
	} //

//	@RequestMapping(value = "/login/welcome", method = RequestMethod.GET)
//	public ModelAndView defaultPage() {
//
//		log.info("welcome");
//
//		ModelAndView model = new ModelAndView();
//		model.addObject("title", "Spring Security Password Encoder");
//		model.addObject("message", "This is default page!");
//		model.setViewName("/member/welcome");
//		return model;
//		
//	}
	
	// 로그아웃
    @RequestMapping(value="/login/logout_proc.do", method = RequestMethod.GET)
    public String logout(ModelMap model,
    					 HttpServletRequest request,
    					 HttpServletResponse response) {
    	
    	log.info(" 로그아웃 ");
    	
	    Authentication auth 
		    	= SecurityContextHolder.getContext()
		    						   .getAuthentication();
	    
	    log.info(" auth : " + auth);
	    
	    // logout !
	    if (auth != null) {    
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    }
	    return "/member/logout";
    } //
}
