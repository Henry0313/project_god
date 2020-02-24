package com.project.god.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.god.domain.CategoryVO;
import com.project.god.domain.ProductDTO;
import com.project.god.domain.ProductVO;
import com.project.god.mapper.ProductMapper;

import lombok.extern.slf4j.Slf4j;

/**
 * 상품 DAO Impl
 * 상품관리 
 * 
 * @author god
 *
 */

@Repository
@Slf4j
public class ProductDAOImpl implements ProductDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static String namespace = "com.project.god.mapper.ProductMapper";
	
	// Product 상품등록
	@Override
	public void regiProduct(ProductVO productVO) throws Exception {

		log.info(" dao regiProduct ");
		
		sqlSession.getMapper(ProductMapper.class).regiProduct(productVO);
	}
	
	// 마지막 상품번호
	@Override
	public int getProductIdByLastSeq() {

		log.info(" dao getProductIdByLastSeq ");
		
		return sqlSession.getMapper(ProductMapper.class).getProductIdByLastSeq();
	}	
		
	// 상품 리스트
	@Override
	public List<ProductVO> getProductList(int page, int rowsPerPage) {
		
		log.info(" dao getProductList ");
		
		return sqlSession.getMapper(ProductMapper.class).getProductList(page, rowsPerPage);
	}
	
	// 상품 보기
	@Override
	public ProductVO getProduct(int productId) throws Exception {
		
		log.info(" dao getProduct ");
		return sqlSession.selectOne(namespace + ".getProduct", productId);
	}
	
	// 상품 조회수
	@Override
	public void increaseProductViewcnt(int productId) throws Exception {

		log.info(" dao increaseProductViewcnt ");
		
		sqlSession.update(namespace + ".increaseProductViewcnt", productId);
	}
	
	// 전체 상품 수
	@Override
	public int getProductListCount() {

		log.info(" dao getProductListCount ");
		
		return sqlSession.getMapper(ProductMapper.class).getProductListCount();
	}
	
	// 카테고리별 전체 상품 수
	@Override
	public int getCateProductListCount(String cateCode) {

		log.info(" dao getCateProductListCount ");
		
		return sqlSession.getMapper(ProductMapper.class).getCateProductListCount(cateCode);
	}
	
	// 상품 검색
	@Override
	public List<ProductVO> getProductBySearch(String searchWord,
											  String searchDate1,
											  String searchDate2,
											  String searchInfo,
											  String searchPrice1,
											  String searchPrice2,
									  	  	  int rowsPerPage, 
									  	  	  int page) {

		log.info(" dao getProductBySearch ");
		log.info(" 검색 시작 날짜 : {}", searchDate1);
		log.info(" 검색 끝 날짜 : {}", searchDate2);
		log.info(" 검색 상품 진열 상태 : {}", searchInfo);
		log.info(" 검색어 : {}", searchWord);
		log.info(" 검색 시작 가격 : {}", searchPrice1);
		log.info(" 검색 끝 가격 : {}", searchPrice2);
		
		return sqlSession.getMapper(ProductMapper.class).getProductBySearch(searchWord,
																			searchDate1,
																			searchDate2,
																			searchInfo,
																			searchPrice1,
																			searchPrice2,
																			rowsPerPage,
																			page);
	}

	// 검색 결과 수
	@Override
	public int getAllProductsBySearch(String searchWord,
									  String searchDate1,
									  String searchDate2,
									  String searchInfo,
									  String searchPrice1,
									  String searchPrice2) {
		
		return sqlSession.getMapper(ProductMapper.class).getAllProductsBySearch(searchWord,
																				searchDate1,
																				searchDate2,
																				searchInfo,
																				searchPrice1,
																				searchPrice2);
	}
	
	// 카테고리 목록
	@Override
	public List<CategoryVO> getCategoryList() throws Exception {

		log.info(" dao getCategoryList ");
		
		return sqlSession.selectList(namespace + ".getCategoryList");
	}
	
	// 카테고리별 상품 목록
	@Override
	public List<ProductVO> getCateProductList(int page, int rowsPerPage, String cateCode) throws Exception {
		
		log.info(" dao getCateProductList ");
		
		return sqlSession.getMapper(ProductMapper.class).getCateProductList(page, rowsPerPage, cateCode);
	}
	
	// 상품 삭제
	@Override
	public void deleteProduct(ProductVO productVO) throws Exception {
		
		log.info(" dao deleteProduct ");
		
		sqlSession.delete("com.project.god.mapper.ProductMapper.deleteProduct", productVO);
	}

	// 상품 수정
	@Override
	public void updateProduct(ProductDTO productDTO) throws Exception {
		
		log.info(" dao updateProduct ");
		
		sqlSession.update("com.project.god.mapper.ProductMapper.updateProduct", productDTO);
	}
	
	// 상품 진열 여부 수정 (하단 버튼)
	// 진열
	@Override
	public void dUpdateProduct(ProductDTO productDTO) throws Exception {
		
		log.info(" dao dUpdateProduct ");
		
		sqlSession.update("com.project.god.mapper.ProductMapper.dUpdate", productDTO);
	}
	
	// 숨김
	@Override
	public void hUpdateProduct(ProductDTO productDTO) throws Exception {
		
		log.info(" dao hUpdateProduct ");
		
		sqlSession.update("com.project.god.mapper.ProductMapper.hUpdate", productDTO);
	}
}
