package com.project.god.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.god.domain.OrderDetailVO;
import com.project.god.domain.OrderVO;
import com.project.god.domain.PageVO;
import com.project.god.domain.ProductVO;
import com.project.god.service.OrderService;

import lombok.extern.slf4j.Slf4j;

/**
 * 관리자 주문 컨트롤러
 * 
 * @author god
 *
 */

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminOrderController {
	
	@Autowired
	private OrderService orderService; 

	// 주문 리스트
	@RequestMapping(value="/admin_order_list.do/{page}",
				    method = {RequestMethod.POST, RequestMethod.GET})
	public String orderList(@PathVariable("page") int page, Model model) throws Exception {
		
		log.info(" 전체 주문 리스트 ");
		
		int limit = 10 ; // 페이지당 글수
		
		List<OrderVO> orderList;
		
		page = page!=0 ? page : 1; // page 설정
		
		// 총 상품 개수
		int orderListCount = orderService.getOrderListCount();
		
		orderList = orderService.getOrderList(page, limit);
		
		// 총 페이지 수
		int maxPage =(int)((double)orderListCount / limit+0.95);
		
		// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21,...)
   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   		
   		// 현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30, ...)
   	    int endPage = startPage + 10 - 1;
		
   	    if (endPage > maxPage) endPage = maxPage;
   	    
   	    PageVO pageVO = new PageVO();
		pageVO.setEndPage(endPage);
		pageVO.setProductListCount(orderList.size());
		pageVO.setMaxPage(maxPage);
		pageVO.setPage(page);
		pageVO.setStartPage(startPage);
		pageVO.setProductListTotCount(orderListCount);
		
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("productList", orderList);
		model.addAttribute("orderVO", orderList);
		
		return "/admin/admin_order_list";
	}
	
	// 주문 관리 상세
	@RequestMapping(value="/admin_order_detail.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String orderListDetail(@RequestParam("orderId") String orderId,
								  Model model) throws Exception {
		
		log.info(" 주문 관리 상세 ");
		
		List<OrderDetailVO> order = orderService.getOrderView(orderId);
		log.info(" order : " + order);
		
		model.addAttribute("orderVOs", order);
		
		return "/admin/admin_order_detail";
	}

	// 주문 배송상태 처리
	@RequestMapping(value="/admin_order_delivery.do",
					method = {RequestMethod.POST, RequestMethod.GET})
	public String delivery(@ModelAttribute("orderVO")OrderVO orderVO)throws Exception {
		
		log.info(" 주문 배송상태 처리 ");
		
		String delivery = orderVO.getOrderDelivery();
		orderService.delivery(orderVO);
		List<OrderDetailVO> orderView = orderService.getOrderView(orderVO.getOrderId());
		
		ProductVO productVO = new ProductVO();
		
		// 배송완료 단계로 넘어가면 상품 재고 감소
		if(delivery == "배송 완료" || delivery.trim().contentEquals("배송 완료")) {
			
			log.info(" 배송 완료 수량 감소 : " + orderVO.getOrderDelivery());
			
			for(OrderDetailVO i : orderView) {
				productVO.setProductId(i.getProductId());
				productVO.setProductQuan(i.getCartQuan());
				orderService.productQuan(productVO);
			}
		}
		else {
			log.info(" 배송 완료 아님 ");
		}
		
		return "redirect:/admin/admin_order_detail.do?orderId=" + orderVO.getOrderId();
	}
	
	// 주문 취소 리스트
	@RequestMapping("/admin_order_cancel.do")
	public String boardOrderCancel() {
		
		log.info(" 주문 취소 리스트 ");
		
		return "/admin/admin_order_cancel";
	}
	
	// 교환/환불 신청 리스트
	@RequestMapping("/admin_order_change.do")
	public String boardOrderChange() {
		
		log.info(" 교환/환불 신청 리스트 ");
		
		return "/admin/admin_order_change";
	}
	
	// 교환/환불 신청 상세 페이지
	@RequestMapping("/admin_order_change_detail.do")
	public String boardOrderChangeDetail() {
		
		log.info(" 교환/환불 신청 상세 ");
		
		return "/admin/admin_order_change_detail";
	}
}
