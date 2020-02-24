package com.project.god.domain;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Order VO
 * 
 * @author god
 *
 */

@Data
@NoArgsConstructor
public class OrderVO {

	/** 주문번호 */
	private String orderId;
	
	/** 주문한 회원 */
	private String memberId;
	
	/** 주문수령자 */
	private String orderName;
	
	/** 주문지 우편번호 */
	private String orderZip;
	
	/** 주문지 주소 */
	private String orderAddr;
	
	/** 주문지 상세주소 */
	private String orderAddrDetail;
	
	/** 주문 연락처 */
	private String orderPhone;
	
	/** 주문 핸드폰번호 */
	private String orderCellphone;
	
	/** 주문 메세지 */
	private String orderMsg;
	
	/** 주문 총 금액 */
	private int orderAmount;
	
	/** 주문일 */
	private Date orderDate;
	
	/** 주문상태처리 */
	private String orderDelivery;
	
	
	public OrderVO(OrderDetailVO orderDetailVO) {
		this.orderId = orderDetailVO.getOrderId();
		this.memberId = orderDetailVO.getMemberId();
		this.orderName = orderDetailVO.getOrderName();
		this.orderZip = orderDetailVO.getOrderZip();
		this.orderAddr = orderDetailVO.getOrderAddr();
		this.orderAddrDetail = orderDetailVO.getOrderAddrDetail();
		this.orderPhone = orderDetailVO.getOrderPhone();
		this.orderCellphone = orderDetailVO.getOrderCellphone();
		this.orderMsg = orderDetailVO.getOrderMsg();
		this.orderAmount = orderDetailVO.getOrderAmount();
		// Date -> Timestamp
		this.orderDate = Date.valueOf(orderDetailVO.getOrderDate().toString().substring(0,10));
		this.orderDelivery = orderDetailVO.getOrderDelivery();
	}
}
