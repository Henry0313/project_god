package com.project.god.domain;

import java.sql.Date;

import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

/**
 * Cart VO
 * 
 * @author god
 *
 */
@ToString
@Slf4j
public class CartVO implements Comparable<CartVO> {

	/** 장바구니 번호 */
	private int cartId;
	
	/** 회원 아이디 */
	private String memberId;
	
	/** 상품 번호 */
	private int productId;
	
	/** 수량 */
	private int cartQuan;
	
	/** 등록일 */
	private Date cartDate;
	
	/** 상품 색상 */
	private String cartColor;
	
	/** 상품 사이즈 */
	private String cartSize;
	
	public CartVO() {}
	
	public CartVO(int cartId, String memberId, int productId, int cartQuan, Date cartDate, String cartColor,
			String cartSize) {
		this.cartId = cartId;
		this.memberId = memberId;
		this.productId = productId;
		this.cartQuan = cartQuan;
		this.cartDate = cartDate;
		this.cartColor = cartColor;
		this.cartSize = cartSize;
	}
	
	// CartListVO -> CartVO 변환
	public CartVO(CartListVO cartListVO) {
		
		this.cartId = cartListVO.getCartId();
		this.memberId = cartListVO.getMemberId();
		this.productId = cartListVO.getProductId();
		this.cartQuan = cartListVO.getCartQuan();
		this.cartDate = cartListVO.getCartDate();
		this.cartColor = cartListVO.getCartColor();
		this.cartSize = cartListVO.getCartSize();
	}
	
	@Override
	public int compareTo(CartVO o) {
		
		log.info(" compareTO ");
		
		int result = 0;
		
		if(Integer.compare(this.productId, o.productId)==0 &&
		   this.cartColor.compareTo(o.getCartColor())==0 && 
		   this.cartSize.compareTo(o.getCartSize())==0) 
		{
			log.info(" 동일 상품 ");
			log.info(" VO 수량 : " + this.getCartQuan());
			log.info(" 기존 수량 : " + o.getCartQuan());
			
			// 같은 상품일 경우
			if(!this.equals(o)) {
				o.setCartQuan(this.cartQuan + o.getCartQuan());
			}
			
			result = 0;
		} else { 
			
			log.info(" 다른 상품 ");
			
			// 다른 상품일 경우 (productId, cartColor, cartSize 중에서 하나라도 다를 경우)
			//  this.cartQuan = o.getCartQuan(); // 패치
			result = 1;
		}
		return result;
	}
	
	public int getCartQuan() {
		return cartQuan;
	}
	
	public void setCartQuan(int cartQuan) {
		
		this.cartQuan = cartQuan;
	}
	
	
	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public Date getCartDate() {
		return cartDate;
	}

	public void setCartDate(Date cartDate) {
		this.cartDate = cartDate;
	}

	public String getCartColor() {
		return cartColor;
	}

	public void setCartColor(String cartColor) {
		this.cartColor = cartColor;
	}

	public String getCartSize() {
		return cartSize;
	}

	public void setCartSize(String cartSize) {
		this.cartSize = cartSize;
	}

}
