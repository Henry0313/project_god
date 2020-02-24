package com.project.god.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.god.domain.CartListVO;
import com.project.god.domain.MemberVO;
import com.project.god.domain.OrderDetailVO;
import com.project.god.domain.OrderVO;
import com.project.god.domain.ProductVO;
import com.project.god.service.CartService;
import com.project.god.service.MemberService;
import com.project.god.service.OrderService;
import com.project.god.service.ProductService;

import lombok.extern.slf4j.Slf4j;

/**
 * 주문 컨트롤러
 * 
 * @author god
 *
 */

@Controller
@Slf4j
@RequestMapping("/products")
public class OrderController {

	@Autowired
	private OrderService orderService;

	@Autowired
	private CartService cartService;

	@Autowired
	private MemberService memberService;

	@Autowired
	private ProductService productService;

	// 주문 페이지
	@RequestMapping(value = "/order.do", method = RequestMethod.GET)
	public ModelAndView order(ModelAndView mav) throws Exception {

		log.info(" 주문 페이지 ");

		Map<String, Object> map = new HashMap<>();

		// String memberId = authentication.getName();

		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		String notMember = "anonymousUser";

		if (principal instanceof UserDetails) {
			String memberId = ((UserDetails) principal).getUsername();
			
			// 로그인 했을 시
			if (memberId != notMember) {

				List<CartListVO> cartList = cartService.cartList2(memberId);

				int cartSumPrice = 0;

				if (cartList.isEmpty()) {

				} else {
					cartSumPrice = cartService.cartSumPrice(memberId);
				}

				log.info(" cartList : " + cartList);

				map.put("cartSumPrice", cartSumPrice);
				map.put("cartList", cartList);

				mav.setViewName("/member/order_sheet");

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
	
	// 한 상품만 선택 주문
	@RequestMapping(value="/one_order.do", method=RequestMethod.GET)
	public ModelAndView oneOrder(@RequestParam int cartId, ModelAndView mav) throws Exception {
		
		log.info(" 한 상품만 선택 주문 ");
		
		Map<String, Object> map = new HashMap<>();
		
		//String memberId = authentication.getName();
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		String notMember = "anonymousUser";
		
		if (principal instanceof UserDetails) {
			String memberId = ((UserDetails)principal).getUsername();
			
			// 로그인 했을 시
			if (memberId != notMember) {
				
				List<CartListVO> cartList = cartService.cartList3(cartId);
				
				int cartSumPrice = 0;
				
				if (cartList.isEmpty()) {
					
				} else {
					cartSumPrice = cartService.oneCartSumPrice(cartId);
				}
				
				log.info(" cartList : " + cartList);
				
				map.put("cartSumPrice", cartSumPrice);
				map.put("cartList", cartList);
				
				mav.setViewName("/member/order_sheet");
				
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

	// 주문 처리
	@RequestMapping(value = "/order_proc.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String orderProc(@RequestParam Map<String, String> map,
							@RequestParam int cartId, HttpSession session) throws Exception {

		log.info(" 주문 처리 ");

		map.forEach((x, y) -> {
			log.info(" 인자 : " + x + "=" + y);
		});

		int cartLength = new Integer(map.get("cartLength").toString()); // 카트 갯수
		List<OrderDetailVO> orderDetailList = new ArrayList<>();
		OrderDetailVO tempOrderDetailVO = null;
		OrderVO orderVO = null;

		String orderId = "";
		List<String> orderIdList = new ArrayList<>();

		// productListImg=null, memberName=null, memberCellphone=null
		String memberId = map.get("memberId");
		MemberVO memberVO = memberService.getMember(memberId);
		ProductVO productVO = null;

		// orderId 입력
		orderId = orderService.generateOrderId();
		for (int i = 1; i <= cartLength; i++) {

			tempOrderDetailVO = new OrderDetailVO(map, i);

			// memberName=null 데이터 호출
			tempOrderDetailVO.setMemberName(memberVO.getMemberName());
			
			// memberCellphone=null 데이터 호출
			tempOrderDetailVO.setMemberCellphone(memberVO.getMemberCellphone());

			// productListImg=null 데이터 호출
			productVO = productService.getProduct(tempOrderDetailVO.getProductId());
			tempOrderDetailVO.setProductListImg(productVO.getProductListImg());

			orderIdList.add(orderId);

			tempOrderDetailVO.setOrderId(orderId);
			orderDetailList.add(tempOrderDetailVO);
		} //

		log.info("--");

		for (OrderDetailVO o : orderDetailList) {
			log.info(" o : " + o);
		}

		// 인자 영역
		//////////////////////////////////////////////////////////////////////////////////////

		// log.info(" orderVO : " + orderVO);
		// log.info(" orderDetailVO : " + orderDetailVO);

		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		String notMember = "anonymousUser";

		if (principal instanceof UserDetails) {

			if (memberId != notMember) {

				// order 테이블 데이터 우선 처리
				orderVO = new OrderVO(orderDetailList.get(0));
				orderVO.setMemberId(memberId);
				
				log.info(" orderId : " + orderVO.getOrderId());
				
				orderService.orderInfo(orderVO);
				
				log.info(" orderVO : " + orderVO);

				for (int i = 0; i < orderDetailList.size(); i++) {
					// order detail 데이터 입력
					orderService.orderDetailInfo(orderDetailList.get(i));

					log.info(" orderDetailVO : " + orderDetailList.get(i));
				}
				if (orderDetailList.size() > 1) {
					cartService.deleteAllCart(memberId);
				} else {
					cartService.deleteCart(cartId);
				}
			}
		} else {
			if (memberId == notMember) {

				return "redirect:/login/login.do";
			}
		}
		return "redirect:/member/order_details.do?memberId=" + memberVO.getMemberId();
	}
	
	// Order Sheet
	@RequestMapping("order_sheet.do")
	public String orderSheet() {
		
		log.info(" Order Sheet ");
		
		return "/member/order_sheet";
	}
	
	// 주문 내역 조회
	@RequestMapping("order_details.do")
	public String orderDetails() {
		
		log.info(" 주문 내역 조회 ");
		
		return "/member/order_details";
	}
}
