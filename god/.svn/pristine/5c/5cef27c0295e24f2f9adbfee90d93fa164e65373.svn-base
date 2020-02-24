package com.project.god.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.NavigableSet;
import java.util.TreeSet;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.god.dao.CartDAO;
import com.project.god.domain.CartListVO;
import com.project.god.domain.CartVO;
import com.project.god.service.CartService;

import lombok.extern.slf4j.Slf4j;

/**
 * 카트(session 이용) 컨트롤러
 * 
 * @author god
 *
 */

@Controller
@Slf4j
@RequestMapping("/products")
public class CartController {

	@Autowired
	private CartService cartService;
	
	@Autowired
	private CartDAO cartDAO;
	
	/*
	// 카트 리스트
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/cart.do", method=RequestMethod.GET)
	public String view(HttpSession session, Model model) throws Exception {
		
		log.info(" 카트 리스트 ");
		
		Map<String, Object> map = new HashMap<>();
		List<CartListVO> cartListVOList = null; // 인자 전달용
		NavigableSet<CartVO> cartList = new TreeSet<>(); // 세션
		
		String path = "";
				
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		String notMember = "anonymousUser";
		
		if (principal instanceof UserDetails) {
			String memberId = ((UserDetails)principal).getUsername();
			
			if (memberId != notMember) {
				
				// cart session 가져오기
				if(session.getAttribute("CART_SESSION")!=null) { //
					
					try {
						cartList = (NavigableSet<CartVO>)session.getAttribute("CART_SESSION");
						
					} catch (ClassCastException e) {
					
						cartList.add((CartVO)session.getAttribute("CART_SESSION"));
					}
					
					// 기존수량
					for(CartVO c:cartList) {
						log.info(" cart : " + c);
						// log.info(" 기존 수량 : " + c.getCartQuan());
					}
					
					// NavigableSet<CartVO> -> List<CartListVO> 변환
					try {
						cartListVOList = cartService.cartList(memberId, cartList);
						
					} catch (IndexOutOfBoundsException e) {
					
						log.error(" e : " + e);
						// e.printStackTrace();
					}
				}
				
				int cartSumPrice = 0;
				
				if (cartList!=null) {
					cartSumPrice = cartService.cartSumPrice(memberId);
				}
				
				log.info(" cartList : " + cartList);
				log.info(" cartList 갯수 : " + cartList.size());
				log.info(" cartListVOList : " + cartListVOList==null ? "없음" : "있음");

				model.addAttribute(" cartSumPrice : ", cartSumPrice);
				
				// if(cartListVOList!=null) {
					/*if(cartListVOList.size()==1) {
						log.info(" size = 1 :");
						model.addAttribute("cartVO", cartListVOList.get(0));
					}*/
					//if (cartListVOList.size()>=2) {
						// log.info(" size = 2 :");
//						model.addAttribute("cartList", cartListVOList);					
					//}
				// } //
/*				path="/member/cart";
			} 
		} else {
			String memberId = principal.toString();
			
			log.info(" memberId : " + memberId);
			
			if (memberId == notMember) {
				
				path="/member/login";
			}
		}
		return path;
	}	*/
	/*
	// 카트 삭제
	@RequestMapping("/delete_cart.do")
	public String deleteCart(@RequestParam int cartId) throws Exception {
		
		log.info(" 카트 삭제 ");
		
		cartService.deleteCart(cartId);
		
		return "redirect:/products/cart.do";
	}
	
	// 개별 카트 삭제
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/cart_delete_proc.do", produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String deleteOneCart(@RequestParam ("cart_id") int cartId, HttpSession session) throws Exception {
		
		log.info(" 개별 카트 삭제 ");
		
		String msg = "";
		NavigableSet<CartVO> carts = null;
		
		// 카트 세션에서 삭제
		try {
			carts = (NavigableSet<CartVO>)session.getAttribute("CART_SESSION");
		} catch (ClassCastException e) {
			carts = new TreeSet<>();
			carts.add((CartVO)session.getAttribute("CART_SESSION"));
		}
		CartListVO cartListVO = cartService.getCartByCartId(cartId);
		CartVO cartVO = new CartVO(cartListVO);
		
		// 카트세션과 DB 동시삭제
		if(carts.remove(cartVO) == true && cartService.deleteCart(cartId) == true) {
			msg = "카트가 삭제 되었습니다";
		} else {
			msg = "카트가 삭제 실패 하였습니다";
		}
		return msg;
	}
	
	// 카트 비우기
	@RequestMapping("/delete_all_cart.do")
	public String deleteAllCart(Authentication authentication, HttpSession session) throws Exception {
		
		log.info(" 전체 카트 삭제 ");
		
		String memberId = authentication.getName();
		if (memberId != null) {
			cartService.deleteAllCart(memberId);
		}
		return "redirect:/products/cart.do";
	}
	
	// 카트 수정
	@RequestMapping(value="update_cart.do", method=RequestMethod.POST)
	public String updateCart(@ModelAttribute CartVO cartVO) throws Exception {
		
		log.info(" 카트 수정 ");
		
		log.info(" cartVO : " + cartVO);
		
		cartService.updateCart(cartVO);
		
		return "redirect:/products/cart.do";
	}
	
	// 카트 수정 (ajax)
	@SuppressWarnings("unchecked")
	@RequestMapping(value="cart_update_proc.do", method=RequestMethod.POST,
					produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String updateCartAjax(@RequestParam ("cart_id") int cartId,
								 @RequestParam ("cart_quan") int cartQuan,
								 HttpSession session) throws Exception {
		
		log.info(" 카트 수정 ajax ");
		
		String msg = "";
		// session collection
		NavigableSet<CartVO> carts = new TreeSet<>(); // 세션
		
		CartVO cartVO = null;
		
		CartListVO cartListVO = null;
		
		log.info(" cart_id : " + cartId);
		log.info(" cart_quan : " + cartQuan);
		
		// cart 세션
		if (session.getAttribute("CART_SESSION")!=null) { // cart 비었을 때
			log.info(msg);
			log.info(" 세션 상태 : "+session.getAttribute("CART_SESSION"));
			// log.info(" 세션 상태 : "+(NavigableSet<CartVO>)session.getAttribute("CART_SESSION"));
			
			try {
				carts = (NavigableSet<CartVO>)session.getAttribute("CART_SESSION");
			} catch (ClassCastException e) {
				carts.add((CartVO)session.getAttribute("CART_SESSION"));
			}
			
			// cart 정보 가져오기
			cartListVO = cartService.getCartByCartId(cartId);
			cartListVO.setCartQuan(cartQuan); // 수량변경
			
			// 세션 변경
			cartVO = new CartVO(cartListVO);
			session.setAttribute("CART_SESSION", cartVO);
			
			// cart테이블 변경
			msg = cartService.updateCart(cartVO)==true ? "업데이트 성공" : "업데이트 실패";
		}
		return msg;
	}
	*/
}
