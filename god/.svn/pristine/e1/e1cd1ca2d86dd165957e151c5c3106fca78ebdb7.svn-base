package com.project.god.service;

import java.util.List;

import com.project.god.domain.OrderDetailVO;
import com.project.god.domain.OrderVO;
import com.project.god.domain.ProductVO;

/**
 * Order Service
 * 주문 서비스
 * 
 * @author god
 *
 */
public interface OrderService {

	/**
	 * 주문 정보
	 * 
	 * @param orderVO 주문 객체
	 * @return 주문 정보
	 * @throws Exception 예외처리
	 * 
	 */
	public void orderInfo(OrderVO orderVO) throws Exception;
	
	/**
	 * 주문 상세 정보
	 * 
	 * @param orderDetailVO 주문상세 객체
	 * @return 주문 상세 정보
	 * @throws Exception 예외처리
	 * 
	 */
	public void orderDetailInfo(OrderDetailVO orderDetailVO) throws Exception;
	
	/**
	 * 주문 목록
	 * 
	 * @param orderVO 주문 객체
	 * @return 주문 목록
	 * @throws Exception 예외처리
	 * 
	 */
	public List<OrderDetailVO> orderList(String memberId) throws Exception;
	
	/**
	 * 주문 아이디 하나씩만 가져오기
	 * 
	 * @param memberId 회원 아이디
	 * @return 주문 아이디
	 * @throws Exception 예외처리
	 * 
	 */
	public List<OrderVO> orderListId(String memberId) throws Exception;
	
	/**
	 * 전체 주문조회
	 * 
	 * @param page 페이지
	 * @param rowsPage 페이지 당 행수
	 * @return 저장오류메세지
	 * @throws Exception 예외처리
	 * 
	 */
	public List<OrderVO> getOrderList(int page, int rowsPerPage) throws Exception;
	
	/**
	 * 상세주문조회
	 * @param orderId 주문번호
	 * @return 저장오류메시지
	 * @throws Exception 예외처리
	 * 
	 */
	List<OrderDetailVO> getOrderView(String orderId) throws Exception;
	
	/**
	 * 주문상태처리
	 * 
	 * @param orderVO (아이디, 주문상태처리)
	 * @return 주문 상태
	 * @throws Exception 예외처리
	 * 
	 */
	public void delivery(OrderVO orderVO)throws Exception;
	
	/**
	 * 주문 배송 중일때 해당 구매상품 재고 감소
	 * 
	 * @param productVO 상품 정보
	 * @return 해당 구매 상품 재고
	 * @throws Exception 예외처리
	 * 
	 */
	public void productQuan(ProductVO productVO) throws Exception;
	
	/**
	 * 주문 목록 개수
	 * 
	 * @return 주문 목록 개수
	 */
	int getOrderListCount();
	
	/**
	 * 주문 아이디 생성
	 * 
	 * @return 주문 아이디
	 * @throws Exception 예외처리
	 */
	public String generateOrderId() throws Exception;
	
}
