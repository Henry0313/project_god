package com.project.god.domain;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Product VO
 * 
 * @author god
 *
 */

@Data
@NoArgsConstructor
public class ProductVO {

	/** 상품번호 */
	private int productId;
	
	/** 상품이름 */
	private String productName;
	
	/** 상품 가격 원가 */
	private String productPrice1;
	
	/** 상품 가격 판매가 */
	private String productPrice2;
	
	/** 상품 이미지 */
	private String productImg;
	
	/** 썸네일 이미지 */
	private String productThumImg;
	
	/** 상품 리스트 이미지 */
	private String productListImg;
	
	/** 상품 설명내용 */
	private String productContent;
	
	/** 상품 색상 */
	private String productColor;
	
	/** 상품 사이즈 */
	private String productSize;
	
	/** 상품 재고 수량 */
	private int productQuan;
	
	/** 상품 등록일 */
	private Date productDate;
	
	/** 상품 노출여부 D : 진열(display), H : 숨김(hide), S : 품절(sold-out) */
	private String productInfo;
	
	/** 상품 조회수 */
	private int productReadCount;
	
	/** 상품 배송비 */
	private String productDeliveryFee;
	
	/** 카테고리 코드 */
	private String cateCode;
	
	
	/** ProductDTO -> ProductVO */
	public ProductVO(ProductDTO product) {
		
		this.productId = product.getProductId();
		this.productName = product.getProductName();
		this.cateCode = product.getCateCode();
		this.productPrice1 = product.getProductPrice1();
		this.productPrice2 = product.getProductPrice2();
		this.productContent = product.getProductContent();
		this.productColor = product.getProductColor();
		this.productSize = product.getProductSize();
		this.productQuan = product.getProductQuan();
		// this.productDate = product.getProductDate();
		this.productInfo = product.getProductInfo();
		this.productReadCount = product.getProductReadCount();
		this.productDeliveryFee = product.getProductDeliveryFee();
		
		// 파일명 저장
		this.productImg = product.getProductImg().getOriginalFilename();
		// 썸네일 파일명은 setter로 추가저장해야함
		this.productListImg = product.getProductListImg().getOriginalFilename();
	}
	
}
