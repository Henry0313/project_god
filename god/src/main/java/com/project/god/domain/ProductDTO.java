package com.project.god.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

/**
 * Product DTO
 * 상품 DTO
 * 
 * @author god
 *
 */

@Data
public class ProductDTO {
	
	/** 상품번호 */
	private int productId;
	
	/** 상품이름 */
	private String productName;
	
	/** 상품 가격 원가 */
	private String productPrice1;
	
	/** 상품 가격 판매가 */
	private String productPrice2;
	
	/** 상품 이미지 */
	private MultipartFile productImg;
	
	/** 썸네일 이미지 */
	private String productThumImg;
	
	/** 상품 리스트 이미지 */
	private MultipartFile productListImg;
	
	/** 상품 설명내용 */
	private String productContent;
	
	/** 상품 색상 */
	private String productColor;
	
	/** 상품 사이즈 */
	private String productSize;
	
	/** 상품 재고 수량 */
	private int productQuan;
	
	/* 상품 등록일 */
	// private Date productDate;
	
	/** 상품 노출여부 D : 진열(display), H : 숨김(hide), S : 품절(sold-out) */
	private String productInfo;
	
	/** 상품 조회수 */
	private int productReadCount;
	
	/** 상품 배송비 */
	private String productDeliveryFee;
	
	/** 카테고리 코드 */
	private String cateCode;
}
