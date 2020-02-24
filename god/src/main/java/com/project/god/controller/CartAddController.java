package com.project.god.controller;

import java.sql.Date;
import java.util.NavigableSet;
import java.util.TreeSet;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.god.dao.CartDAO;
import com.project.god.domain.CartVO;
import com.project.god.service.CartService;

import lombok.extern.slf4j.Slf4j;

/**
 * 카트 담기(session 이용) 컨트롤러
 * 
 * @author god
 *
 */

@Controller
@Slf4j
@RequestMapping("/products")
public class CartAddController {

	@Autowired
	private CartService cartService;
	
	@Autowired
	private CartDAO cartDAO;
	
	/*
	// 카트에 담기
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/add_cart.do", method=RequestMethod.POST)
	public String addCart(@ModelAttribute CartVO cartVO, HttpSession session) throws Exception {
		
		log.info(" 카트 담기 ");
		
		// session collection
		NavigableSet<CartVO> carts = new TreeSet<>();
		CartVO tempCartVO = null; // 세션 전용
		CartVO updateCartVO = null; // 업데이트 전용
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		String notMember = "anonymousUser";
		
		if (principal instanceof UserDetails) {
			String memberId = ((UserDetails)principal).getUsername();
			
			if (memberId != notMember) {
				cartVO.setMemberId(memberId);
				
				log.info(" 카트 담기 cartVO : "+cartVO);
				
				// cart 세션 생성
				if (session.getAttribute("CART_SESSION")!=null) { // cart 있을 때
					
					log.info(" 카트 있을 때 ");
					
					cartVO.setCartDate(new Date(System.currentTimeMillis()));
					
					// 동일상품 추가할 때 카트 id DB 존재여부 확인
					int realCartId = cartService.getThisCartId(cartVO);
					
					log.info(" SESSION CART ID : " + realCartId);
					
					if(realCartId==-1) { // 기존 DB에 id가 없을 경우 신규 생성
						// cart table에 data 삽입
						cartService.addCart(cartVO);
						
					} else { // 기존 DB에 id가 있을 경우
						log.info(" 신규 수량 : " + cartVO.getCartQuan());
						
						// 기존 수량 + 신규 수량 = 업데이트 수량
						updateCartVO = new CartVO();
						updateCartVO.setCartQuan(cartService.getCartByCartId(realCartId).getCartQuan()
												+ cartVO.getCartQuan());
						updateCartVO.setCartId(realCartId);
						
						log.info(" 업데이트 cart : " + updateCartVO);
						
						cartService.updateCart(updateCartVO);
					}
					
					try {
						carts = (NavigableSet<CartVO>)session.getAttribute("CART_SESSION");
						
						log.info(" 세션 갯수 : " + carts.size());
						
						for(CartVO c : carts) {
							log.info(" c : " + c);
						}
						
						// 신규 추가
						// 새로운 세션 카트 아이디 반영
						realCartId = (realCartId==-1) ? cartDAO.getCurrCartId() : realCartId;
						cartVO.setCartId(realCartId); // 신규 제품 카트목록 추가 아이디
						
						carts.add(cartVO);
						session.setAttribute("CART_SESSION", carts); // cart 세션 생성
						
					} catch (ClassCastException e) {
						
						log.info(" cast Exception "); // 
						
						///////////////////////////////////////////////////////////////////////
						
						// 카트에 1개 있을 때 추가할 경우 수량 중복 되는 경우 패치
						
						tempCartVO = (CartVO)session.getAttribute("CART_SESSION"); // 기존 카트
						
						log.info(" tempCartVO : " + tempCartVO);
						
						carts = new TreeSet<>(); // 카트 초기화
						carts.add(tempCartVO);
						
						// cartVO.setCartId(currCartId);
						// cartVO.setCartDate(currDate);
						
						log.info(" 변경 수량 : " + cartVO.getCartQuan());
						log.info(" cartVO : " + cartVO);
						
						// 새로운 세션 카트 아이디 반영
						realCartId = (realCartId==-1) ? cartDAO.getCurrCartId() : realCartId;
						cartVO.setCartId(realCartId); // 신규 제품 카트목록 추가 아이디
						
						log.info(" 신규 세션 카트 : " + cartVO);
						
						carts.add(cartVO);
						
						session.setAttribute("CART_SESSION", carts); // cart 세션 생성
						
						log.info(" 카트 현황 ");
						
						for(CartVO c : (NavigableSet<CartVO>)session.getAttribute("CART_SESSION")) {
							log.info(" c : " + c);
						}
					} //try
					
				} // cart 세션 있을 때 끝 
				
				else { // cart 없을 때
					log.info(" 카트 없을 때 ");
					
					cartVO.setCartDate(new Date(System.currentTimeMillis()));
					
					// 동일상품 추가할 때 카트 id DB 존재여부 확인
					int realCartId = cartService.getThisCartId(cartVO);
					
					if(realCartId==-1) { // 기존 DB에 id가 없을 경우 신규 생성
						// cart table에 data 삽입
						cartService.addCart(cartVO);
						
					} else { // 기존 DB에 id가 있을 경우
						log.info(" 신규 수량 : " + cartVO.getCartQuan());
						// 기존 수량 + 신규 수량 = 업데이트 수량
						updateCartVO = new CartVO();
						updateCartVO.setCartQuan(cartService.getCartByCartId(realCartId).getCartQuan()
						 						+ cartVO.getCartQuan());
						updateCartVO.setCartId(realCartId);
						
						log.info(" 업데이트 cart : " + updateCartVO);
						
						cartService.updateCart(updateCartVO);
					}
					
					// 새로운 세션 카트 아이디 반영
					realCartId = (realCartId==-1) ? cartDAO.getCurrCartId() : realCartId;
					cartVO.setCartId(realCartId); // 신규 제품 카트목록 추가 아이디
					
					carts = new TreeSet<>(); // 신규 생성
					carts.add(cartVO);
					session.setAttribute("CART_SESSION", carts);
					//session.setAttribute("CART_SESSION", cartVO);
					
					carts=(NavigableSet<CartVO>)session.getAttribute("CART_SESSION");
					
					log.info("추가 후 카트 현황 ");
					
					for(CartVO c : carts) {
						log.info(" c : " + c);
					}
				}
			} 
		} else {
			String memberId = principal.toString();
			
			if (memberId == notMember) {
				
				return "redirect:/login/login.do";
			}
		}
		log.info(" SESSION ");
		
		try {
			for(CartVO c : (NavigableSet<CartVO>)session.getAttribute("CART_SESSION")) {
				log.info(" c : " + c);
			}
		} catch (Exception e) {
			log.info(" c : " + (CartVO)session.getAttribute("CART_SESSION"));
		}
		return "redirect:/products/cart.do";
	}
	*/
}
