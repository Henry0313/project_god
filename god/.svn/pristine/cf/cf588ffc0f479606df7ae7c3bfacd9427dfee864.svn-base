package com.project.god.domain;



import java.sql.Timestamp;
import java.util.Map;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * OrderDetail VO
 * 
 * @author god
 *
 */

@Data
@NoArgsConstructor
public class OrderDetailVO {
	
	/* order table */
	/** 주문번호 */
	private String orderId;
	
	/** 회원아이디 */
	private String memberId;
	
	/** 주문 수령자 이름 */
	private String orderName;
	
	/** 주문 우편번호 */
	private String orderZip;
	
	/** 주문 기본주소 */
	private String orderAddr;
	
	/** 주문 상세주소 */
	private String orderAddrDetail;
	
	/** 주문 일반전화 */
	private String orderPhone;
	
	/** 주문 휴대전화 */
	private String orderCellphone;
	
	/** 주문 메세지 */
	private String orderMsg;
	
	/** 주문 금액 */
	private int orderAmount;
	
	/** 주문일 */
	private Timestamp orderDate;
	
	/** 주문상태 현황 */
	private String orderDelivery;
	
	
	/* order_datail table */
	/** 주문상세번호 */
	private int orderDetailId;
	
	/** 상품 번호 */
	private int productId;
	
	/** 주문 색상 */
	private String cartColor;
	
	/** 주문 사이즈 */
	private String cartSize;
	
	/** 주문 수량 */
	private int cartQuan;
	
	
	/* product table */
	/** 상품명 */
	private String productName;
	
	/** 상품 썸네일 이미지 */
	private String productThumImg;
	
	/** 상품 리스트 이미지 */
	private String productListImg;
	
	/** 상품 판매가 */
	private int productPrice2;
	
	
	/* member table*/
	/** 회원 이름 */
	private String memberName;
	
	/** 회원 휴대전화 */
	private String memberCellphone;
	
	
	public OrderDetailVO(Map<String, String> map, int num) {
		// orderId는 추후에 생성 
		String tempOrderId = map.get("orderId") == null ? "" : map.get("orderId").toString();
		this.orderId = tempOrderId;
		this.memberId = map.get("memberId");
		this.orderName = map.get("orderName");
		this.orderZip = map.get("orderZip");
		this.orderAddr = map.get("orderAddr");
		this.orderAddrDetail = map.get("orderAddrDetail");
		this.orderPhone = map.get("orderPhone");
		this.orderCellphone = map.get("orderCellphone");
		this.orderMsg = map.get("orderMsg");
		this.orderAmount = new Integer(map.get("orderAmount"));
		
		String tempDate = map.get("orderDate")+ " 00:00:00";
		this.orderDate = Timestamp.valueOf(tempDate);
		this.orderDelivery = map.get("orderDelivery");
		
		// orderDetailId는 시퀀스로 생성
		int tempOrderDetailId = map.get("orderDetailId") == null ? 0 : new Integer(map.get("orderDetailId"));
		this.orderDetailId = tempOrderDetailId;
		this.productId = new Integer(map.get("productId"+"_"+num));
		this.cartColor = map.get("cartColor"+"_"+num);
		this.cartSize = map.get("cartSize"+"_"+num);
		this.cartQuan = new Integer(map.get("cartQuan"+"_"+num));
		this.productName = map.get("productName"+"_"+num);
		this.productThumImg = map.get("productThumImg"+"_"+num);
		this.productListImg = map.get("productListImg"+"_"+num);
		this.memberName = map.get("memberName");
		this.memberCellphone = map.get("memberCellphone");
	}
}
