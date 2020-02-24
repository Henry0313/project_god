package com.project.god.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.god.domain.ProductVO;

public interface ProductMapper {
	
	/**
	 * 상품등록 Product
	 * 
	 * @param productVO 객체
	 * @throws Exception 예외처리
	 * 
	 */
	public void regiProduct(ProductVO productVO) throws Exception;
	
	/**
	 * Product 상품등록 마지막 Seq
	 * 
	 * @return 전체 게시판
	 */
	int getProductIdByLastSeq();
	
	/**
	 * 상품 목록 조회
	 * @param page 페이지
	 * @param rowsPerPage 페이지 당 행수
	 * @return 상품 리스트
	 * 
	 */
	List<ProductVO> getProductList(@Param("page") int page, 
			  					   @Param("rowsPerPage") int rowsPerPage);
	
	/**
	 * 상품 목록 수 조회
	 * 
	 * @return 상품 목록 수
	 * 
	 */
	int getProductListCount();
	
	/**
	 * 카테고리별 상품 목록 수
	 * 
	 * @param cateCode 카테고리 코드
	 * @return 카테고리별 상품 목록 수
	 */
	int getCateProductListCount(String cateCode);
	
	/**
	 * 검색/페이징을 이용한 상품 조회
	 * 
	 * @param searchWord 검색단어
	 * @param searchDate1 검색 시작 날짜
	 * @param searchDate2 검색 끝 날짜
	 * @param searchInfo 검색 상품 진열 상태
	 * @param searchPrice1 원가
	 * @param searchPrice2 판매가
	 * @param rowsPerPage 페이지당 행 수
	 * @param page 페이지
	 * @return productVO 상품 객체
	 */
	List<ProductVO> getProductBySearch(@Param("searchWord") String searchWord,
									   @Param("searchDate1") String searchDate1,
									   @Param("searchDate2") String searchDate2,
									   @Param("searchInfo") String searchInfo,
									   @Param("searchPrice1") String searchPrice1,
									   @Param("searchPrice2") String searchPrice2,
			   						   @Param("rowsPerPage") int rowsPerPage,
			   						   @Param("page") int page);
	
	/**
	 * 검색/페이징을 이용한 전체 상품 조회수
	 * 
	 * @param searchWord 검색단어
	 * @param searchDate1 검색 시작 날짜
	 * @param searchDate2 검색 끝 날짜
	 * @param searchInfo 검색 상품 진열 상태
	 * @param searchPrice1 원가
	 * @param searchPrice2 판매가
	 * @return 검색 결과
	 */
	int getAllProductsBySearch(@Param("searchWord") String searchWord,
							   @Param("searchDate1") String searchDate1,
							   @Param("searchDate2") String searchDate2,
							   @Param("searchInfo") String searchInfo,
							   @Param("searchPrice1") String searchPrice1,
							   @Param("searchPrice2") String searchPrice2);
	
	/**
	 * Category List
	 * 
	 * @return productVO 상품 객체
	 * 
	 */
	List<ProductVO> getCategoryList();
	
	/**
	 * 
	 * @param page 페이지
	 * @param rowsPerPage 페이지당 행수
	 * @param cateCode 카테고리 코드
	 * @return productVO 상품 객체
	 * @throws Exception 예외처리
	 */
	public List<ProductVO> getCateProductList(@Param("page") int page, 
											  @Param("rowsPerPage") int rowsPerPage, 
											  @Param("cateCode") String cateCode) throws Exception;

}
