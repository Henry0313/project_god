package com.project.god.dao;

import java.util.List;

import com.project.god.domain.OrderDetailVO;
import com.project.god.domain.OrderVO;
import com.project.god.domain.ProductVO;

/**
 * Order DAO
 * 주문
 * 
 * @author god
 *
 */

public interface OrderDAO {

	/**
	 * 주문 정보
	 * 
	 * @param orderVO 주문 객체
	 * @throws Exception 예외처리
	 * 
	 */
	public void orderInfo(OrderVO orderVO) throws Exception;
	
	/**
	 * 주문 상세 정보
	 * 
	 * @param orderDetailVO 주문 상세정보 객체
	 * @throws Exception 예외처리
	 * 
	 */
	public void orderDetailInfo(OrderDetailVO orderDetailVO) throws Exception;
	
	/**
	 * 주문 아이디 하나씩만 가져오기
	 * 
	 * @param memberId 회원 아이디
	 * @return orderId 주문 아이디
	 * @throws Exception 예외처리
	 */
	public List<OrderVO> orderListId(String memberId) throws Exception;
	
	/**
	 * 전체 주문목록 (이용자)
	 * 
	 * @param memberId 회원 아이디
	 * @return orderDetailVO 주문 상세 객체 목록
	 * @throws Exception 예외처리
	 */
	public List<OrderDetailVO> orderList(String memberId) throws Exception;
	
	/**
	 * 전체 주문목록 (관리자)
	 * 
	 * @param page 페이지
	 * @param rowsPage 페이지 당 행수
	 * @return 전체 주문목록
	 * @throws Exception 예외처리
	 */
	List<OrderVO> getOrderList(int page, int rowsPage) throws Exception;
	
	/**
	 * 상세 주문조회 (관리자, 이용자)
	 * 
	 * @param orderId 주문 번호
	 * @return orderDetailVO 주문 상세 객체 정보
	 * @throws Exception 예외처리
	 */
	List<OrderDetailVO> getOrderView(String orderId) throws Exception;
	
	/**
	 * 배송상태 처리
	 * 
	 * @param orderVO (아이디, 주문상태처리)
	 * @throws Exception 예외처리
	 */
	public void delivery(OrderVO orderVO) throws Exception;
	
	/**
	 * 상품 배송 중일때 해당 구매 상품 재고 감소
	 * 
	 * @param productVO 상품 정보
	 * @throws Exception 예외처리
	 */
	public void productQuan(ProductVO productVO) throws Exception;
	
	/**
	 * 주문 목록 개수
	 *
	 * @return 주문 목록 개수
	 */
	int getOrderListCount();
}
