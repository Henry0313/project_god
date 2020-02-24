package com.project.god.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.god.domain.CartListVO;
import com.project.god.domain.CartVO;
import com.project.god.service.CartService;

import lombok.extern.slf4j.Slf4j;

/**
 * 카트 컨트롤러
 * 
 * @author god
 *
 */

@Controller
@Slf4j
@RequestMapping("/products")
public class Cart2Controller {

	@Autowired
	private CartService cartService;
	
	// 카트 리스트
	@RequestMapping(value="/cart2.do", method=RequestMethod.GET)
	public ModelAndView view(ModelAndView mav) throws Exception {
		
		log.info(" 카트 리스트 ");
		
		Map<String, Object> map = new HashMap<>();
		
		//String memberId = authentication.getName();
		
		// 현재 접속자 정보
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		// 로그인 안했을 시
		String notMember = "anonymousUser";
		
		if (principal instanceof UserDetails) {
			String memberId = ((UserDetails)principal).getUsername();
			
			// 로그인 했을 시
			if (memberId != notMember) {
				
				List<CartListVO> cartList = cartService.cartList2(memberId);
				
				int cartSumPrice = 0;
				
				if (cartList.isEmpty()) {
					
				} else {
					// 카트 총합계
					cartSumPrice = cartService.cartSumPrice(memberId);
				}
				
				log.info(" cartList : " + cartList);
				
				map.put("cartSumPrice", cartSumPrice);
				map.put("cartList", cartList);
				
				mav.setViewName("/member/cart2");
				
				mav.addObject("map", map);
			} 
		} else { // 로그인 안했을 시
			String memberId = principal.toString();
			
			log.info(" memberId : " + memberId);
			
			if (memberId == notMember) {
				
				mav.setViewName("/member/login");
			}
		}
		return mav;
	}
	
	// 카트에 담기
	@RequestMapping(value="/add_cart.do", method=RequestMethod.POST)
	public String addCart(@ModelAttribute CartVO cartVO) {
		
		log.info(" 카트 담기 ");
		
		// 현재 접속자 정보
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		// 로그인 안했을 시
		String notMember = "anonymousUser";
		
		// 로그인 했을 시
		if (principal instanceof UserDetails) {
			
			String memberId = ((UserDetails)principal).getUsername();
			
			if (memberId != notMember) {
				
				cartVO.setMemberId(memberId);
				
				cartService.addCart(cartVO);
			} 
		} else { // 로그인 안했을 시
			String memberId = principal.toString();
			
			if (memberId == notMember) {
				
				return "redirect:/login/login.do";
			}
		}
		return "redirect:/products/cart2.do";
	}
	
	// 카트 삭제
	@RequestMapping("/delete_cart.do")
	public String deleteCart(@RequestParam int cartId) throws Exception {
		
		log.info(" 카트 삭제 ");
		
		cartService.deleteCart(cartId);
		
		return "redirect:/products/cart2.do";
	}
	
	// 카트 비우기
	@RequestMapping("/delete_all_cart.do")
	public String deleteAllCart(Authentication authentication) throws Exception {
		
		log.info(" 카트 비우기 ");
		
		String memberId = authentication.getName();
		
		if (memberId != null) {
			cartService.deleteAllCart(memberId);
		}
		return "redirect:/products/cart2.do";
	}
	
	// 카트 수정
	@RequestMapping(value="update_cart.do", method=RequestMethod.POST)
	public String updateCart(@ModelAttribute CartVO cartVO) throws Exception {
		
		log.info(" 카트 수정 ");
		
		cartService.updateCart(cartVO);
		
		return "redirect:/products/cart2.do";
	}
}