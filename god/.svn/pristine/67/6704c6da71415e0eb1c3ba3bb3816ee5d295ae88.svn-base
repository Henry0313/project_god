package com.project.god.dao;

import java.util.List;

import com.project.god.domain.CategoryVO;
import com.project.god.domain.ProductDTO;
import com.project.god.domain.ProductVO;

/**
 * 상품 DAO
 * 상품관리 
 * 
 * @author god
 *
 */

public interface ProductDAO {
	
	/**
	 * 상품등록 Product
	 * 
	 * @param productVO 객체
	 * @return 상품 정보
	 * @throws Exception 예외처리
	 * 
	 */
	public void regiProduct(ProductVO productVO) throws Exception;
	
	/**
	 * 상품 번호 마지막 Seq
	 * 
	 * @return 마지막 상품 번호
	 */
	int getProductIdByLastSeq();
	
	/**
	 * 상품 목록 조회
	 * 
	 * @param page 페이지
	 * @param rowsPerPage 페이지 당 행수
	 * @return 상품 리스트
	 * 
	 */
	List<ProductVO> getProductList(int page, int rowsPerPage);
	
	/**
	 * 상품 보기
	 * 
	 * @param productId 상품 번호
	 * @return 상품 정보
	 * @throws Exception 예외처리
	 */
	public ProductVO getProduct(int productId) throws Exception;
	
	/**
	 * 상품 조회수 증가
	 * 
	 * @param productId 상품 번호
	 * @return 상품 조회수 +1
	 * @throws Exception 예외처리
	 * 
	 */
	public void increaseProductViewcnt(int productId) throws Exception;
	
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
	 * 
	 */
	int getCateProductListCount(String cateCode);
	
	/**
	 * 검색/페이징을 이용한 상품 조회
	 * 
	 * @param searchWord 검색단어
	 * @param searchDate1 검색 시작 날짜
	 * @param searchDate2 검색 끝 날짜
	 * @param searchInfo 검색 상품 진열 상태
	 * @param searchPrice1 검색 가격 시작
	 * @param searchPrice2 검색 가격 끝
	 * @param page 페이지
     * @param rowsPerPage 페이지 당 행수
	 * @param isLike 유사 검색(Like) 여부 usage) 유사 검색 : true, 동등 검색 : false
	 * @return 검색 결과 상품 객체
	 * 
	 */
	List<ProductVO> getProductBySearch(String searchWord,
									   String searchDate1,
									   String searchDate2,
									   String searchInfo,
									   String searchPrice1,
									   String searchPrice2,
							   		   int rowsPerPage,
							   		   int page);
	
	/**
	 * 검색/페이징을 이용한 전체 상품 수 조회
	 * 
	 * @param searchWord 검색단어
	 * @param searchDate1 검색 시작 날짜
	 * @param searchDate2 검색 끝 날짜
	 * @param searchInfo 검색 상품 진열 상태
	 * @param searchPrice1 검색 가격 시작
	 * @param searchPrice2 검색 가격 끝
	 * @param isLike 유사 검색(Like) 여부 usage) 유사 검색 : true, 동등 검색 : false
	 * @return 검색 결과 전체 상품 수
	 * 
	 */
	int getAllProductsBySearch(String searchWord,
							   String searchDate1,
							   String searchDate2,
							   String searchInfo,
							   String searchPrice1,
							   String searchPrice2);
	
	/**
	 * Category List
	 * 
	 * @return 카테고리 목록
	 * @throws Exception 예외처리
	 * 
	 */
	public List<CategoryVO> getCategoryList() throws Exception;
	
	/**
	 * 카테고리별 상품 리스트
	 * 
	 * @param cateCode 카테고리 코드
	 * @param page 페이지
     * @param rowsPerPage 페이지 당 행수
	 * @return 카테고리별 리스트 페이지
	 * @throws Exception
	 */
	public List<ProductVO> getCateProductList(int page, int rowsPerPage, String cateCode) throws Exception;
	
	/**
	 * 상품 삭제
	 * 
	 * @param productVO 상품 객체
	 * @return 상품 정보 삭제
	 * @throws Exception 예외처리
	 * 
	 */
	public void deleteProduct(ProductVO productVO) throws Exception;

	/**
	 * 상품 수정
	 * 
	 * @param productDTO 상품 객체
	 * @return 상품 수정
	 * @throws Exception 예외처리
	 * 
	 */
	void updateProduct(ProductDTO productDTO) throws Exception;
	
	/**
	 * 상품 진열 여부 수정 (하단 버튼)
	 * 
	 * @param productDTO 상품 객체
	 * @return 상품 수정
	 * @throws Exception 예외처리
	 * 
	 */
	void dUpdateProduct(ProductDTO productDTO) throws Exception;
	void hUpdateProduct(ProductDTO productDTO) throws Exception;
}
