package com.project.god.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.project.god.dao.ProductDAO;
import com.project.god.domain.CategoryVO;
import com.project.god.domain.ProductDTO;
//import com.project.god.domain.CategoryVO;
import com.project.god.domain.ProductVO;
import com.project.god.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductDAO productDAO;
	
	/*
	 * 트랜잭션 매니저(transactionManager)를 직접 와이어링 하거나  
	 * 트랜잭션 템플릿(transactionTemplate)을 와이어링 하는 방식 둘 중 하나를 사용하여 
	 * 트랜잭션 제어 프로그래밍을 할 수 있습니다. 
	 */
	
	@Autowired
    private DataSourceTransactionManager transactionManager;
	
	// 플래그 변수를 익명 클래스 메서드 안에 등록하는 에러나는 부분을 패치 -> 멤버 변수화 
	//private boolean flag = false;
	
	// Product 상품 등록
	@Override
	public void regiProduct(ProductVO productVO) throws Exception {
		
		log.info(" Service regiProduct ");

        productDAO.regiProduct(productVO);
	}

	// 상품등록 마지막 Seq
	@Override
	public int getProductIdByLastSeq() {

		log.info(" Service getProductIdByLastSeq ");
		
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		
		int result = 0;
		
		try {
			result = productDAO.getProductIdByLastSeq();
			transactionManager.commit(status);
				
		} catch(Exception e) {
			transactionManager.rollback(status);
	        log.error("Service getProductIdByLastSeq Exception : " + e.getMessage());
		}
		
		return result;	
	}
	
	// 상품 리스트
	@Override
	public List<ProductVO> getProductList(int page, int rowsPerPage) {
		
		log.info(" Service getProductList ");
		
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		
		List<ProductVO> productList = null;
		log.info("rowsPerPage :"+rowsPerPage);
		
		try {
			log.info(" rowsPerPage : " + rowsPerPage);
			productList = productDAO.getProductList(page, rowsPerPage);
			transactionManager.commit(status);
				
		} catch(Exception e) {
			transactionManager.rollback(status);
	        log.error(" Service getProductList Exception : " + e.getMessage());
		}
		
		return productList;
	}
	
	// 상품 보기
	@Override
	public ProductVO getProduct(int productId) throws Exception {
		
		log.info(" Service getProduct ");
		
		return productDAO.getProduct(productId);
	}
	
	// 상품 조회수 증가
	@Override
	public void increaseProductViewcnt(int productId, HttpSession session) throws Exception {
		
		log.info(" Service increaseProductViewcnt ");
		
		long update_time = 0;
		
		// 세션에 저장된 조회시간 검색
		// 최초로 조회할 경우 세션에 저장된 값이 없기 때문에 if문은 실행 X
		if (session.getAttribute("update_time_" + productId) != null) {
			update_time = (long)session.getAttribute("update_time_" + productId);
		}
		// 시스템의 현재시간을 current_time에 저장
		long current_time = System.currentTimeMillis();
		// 일정시간이 경과 후 조회수 증가 처리
		// 시스템현재시간 - 열람시간 > 일정시간(조회수 증가가 가능하도록 지정한 시간)
		if (current_time - update_time > 5*1000) {
			productDAO.increaseProductViewcnt(productId);
			// 세션에 시간을 저장 : "update_time_" + faqId는 다른 변수와 중복되지 않게 명명한 것
			session.setAttribute("update_time_" + productId, current_time);
		}
        
	}
	
	// 전체 상품 수
	@Override
	public int getProductListCount() {
		
		log.info(" Service getProductListCount ");
		
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		
		int result = 0;
		
		try {
			result = productDAO.getProductListCount();
			transactionManager.commit(status);
				
		} catch(Exception e) {
	        transactionManager.rollback(status);
	        log.error(" Service getProductListCount Exception : " + e.getMessage());
	    }
		log.info(" productDAO.getProductListCount() : " + productDAO.getProductListCount());
		
		return result;
	}
	
	// 카테고리별 전체 상품 수
	@Override
	public int getCateProductListCount(String cateCode) {
		
		log.info(" Service getCateProductListCount ");
		
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		
		int result = 0;
		
		try {
			result = productDAO.getCateProductListCount(cateCode);
			transactionManager.commit(status);
				
		} catch(Exception e) {
	        transactionManager.rollback(status);
	        log.error(" Service getCateProductListCount Exception : " + e.getMessage());
	    }
		log.info(" productDAO.getCateProductListCount : " + productDAO.getCateProductListCount(cateCode));
		
		return result;
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
		log.info(" Service getProductBySearch ");
		
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		
		List<ProductVO> result = null;
		
		try {
			result = productDAO.getProductBySearch(searchWord, searchDate1, searchDate2, searchInfo, searchPrice1, searchPrice2, rowsPerPage, page);
			transactionManager.commit(status);
				
		} catch(Exception e) {
			transactionManager.rollback(status);
	        log.error(" Service getProductBySearch Exception : " + e.getMessage());
		}
		return result;
	}

	// 검색 상품 수
	@Override
	public int getAllProductsBySearch(String searchWord,
									  String searchDate1,
									  String searchDate2,
									  String searchInfo,
									  String searchPrice1,
									  String searchPrice2) {
		
		log.info(" Service getAllProductsBySearch ");
		
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		
		int result = 0;
		
		try {
			result = productDAO.getAllProductsBySearch(searchWord, searchDate1, searchDate2, searchInfo, searchPrice1, searchPrice2);
			transactionManager.commit(status);
				
		} catch(Exception e) {
			transactionManager.rollback(status);
	        log.error("Service getAllProductsBySearch Exception : " + e.getMessage());
		}
		
		return result;
	}
	
	// 카테고리 목록
	@Override
	public List<CategoryVO> getCategoryList() throws Exception {

		log.info(" Service getCategoryList ");
		
		return productDAO.getCategoryList();
	}
	
	// 카테고리별 상품 리스트
	@Override
	public List<ProductVO> getCateProductList(int page, int rowsPerPage, String cateCode) throws Exception {

		log.info(" Service getCateProductList ");
		
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		
		List<ProductVO> list = null;
		log.info("rowsPerPage :"+rowsPerPage);
		
		try {
			list = productDAO.getCateProductList(page, rowsPerPage, cateCode);
			
			transactionManager.commit(status);
				
		} catch(Exception e) {
			transactionManager.rollback(status);
	        log.error(" Service getCateProductList Exception : " + e.getMessage());
		}
		return list;
	}
	
	// 상품 삭제
	@Override
	public void deleteProduct(ProductVO productVO) throws Exception {
		
		log.info(" service deleteProduct ");
		
		productDAO.deleteProduct(productVO);
	}

	// 상품 수정
	@Override
	public void updateProduct(ProductDTO productDTO) throws Exception {
		
		log.info(" service updateProduct ");
		
		productDAO.updateProduct(productDTO);
	}
	
	// 상품 진열 여부 수정 (하단 버튼)
	// 진열
	@Override
	public void dUpdateProduct(ProductDTO productDTO) throws Exception {
		
		log.info(" service dUpdateProduct ");
		
		productDAO.dUpdateProduct(productDTO);
	}
	
	// 숨김
	@Override
	public void hUpdateProduct(ProductDTO productDTO) throws Exception {
		
		log.info(" service hUpdateProduct ");
		
		productDAO.hUpdateProduct(productDTO);
	}
}
