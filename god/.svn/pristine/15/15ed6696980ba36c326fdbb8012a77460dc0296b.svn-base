package com.project.god.service.impl;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.project.god.dao.OrderDAO;
import com.project.god.domain.OrderDetailVO;
import com.project.god.domain.OrderVO;
import com.project.god.domain.ProductVO;
import com.project.god.service.OrderService;

import lombok.extern.slf4j.Slf4j;

/**
 * Order ServiceImpl
 * 주문 서비스 구현 클래스
 * 
 * @author god
 *
 */

@Service
@Slf4j
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	// 주문 정보
	@Override
	public void orderInfo(OrderVO orderVO) throws Exception {

		log.info(" service orderInfo ");
		
		orderDAO.orderInfo(orderVO);
	}

	// 주문 상세 정보
	@Override
	public void orderDetailInfo(OrderDetailVO orderDetailVO) throws Exception {

		log.info(" service orderDetailInfo ");
		
		orderDAO.orderDetailInfo(orderDetailVO);
	}
	
	// 주문 아이디 하나씩만 가져오기
	@Override
	public List<OrderVO> orderListId(String memberId) throws Exception {
		
		log.info(" service orderListId ");
		
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		
		List<OrderVO> orders = null;
		
		try {
			orders = orderDAO.orderListId(memberId);
			transactionManager.commit(status);

		} catch (Exception e) {
			transactionManager.rollback(status);
			log.error("OrderService.orderListId : " + e.getMessage());
		}
		
		return orders;
	}

	// 주문 목록
	@Override
	public List<OrderDetailVO> orderList(String memberId) throws Exception {

		log.info(" service orderList ");
		
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		
		List<OrderDetailVO> orders = null;
		
		try {
			orders = orderDAO.orderList(memberId);
			transactionManager.commit(status);

		} catch (Exception e) {
			transactionManager.rollback(status);
			log.error("OrderService.orderList : " + e.getMessage());
		}
		
		return orders;
	}
	
	// 전체 주문 조회
	@Override
	public List<OrderVO> getOrderList(int page, int rowsPerPage) throws Exception {
		
		log.info(" getOrderList ");
		
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		
		List<OrderVO> orders = null;
		
		try {
			orders = orderDAO.getOrderList(page, rowsPerPage);
			transactionManager.commit(status);

		} catch (Exception e) {
			transactionManager.rollback(status);
			log.error("OrderService.getOrderList : " + e.getMessage());
		}
		
		return orders;
	}

	// 상세주문 조회
	@Override
	public List<OrderDetailVO> getOrderView(String orderId) throws Exception {
		
		log.info(" getOrderView ");
		
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		
		List<OrderDetailVO> orders = null;
		
		try {
			orders = orderDAO.getOrderView(orderId);
			transactionManager.commit(status);

		} catch (Exception e) {
			transactionManager.rollback(status);
			log.error("OrderService.getOrderView : " + e.getMessage());
		}
		
		log.info(" OrderService orders : " + orders);
		log.info(" orderId : " + orderId);
		
		return orders;
	}

	// 주문 상태 처리
	@Override
	@Transactional(readOnly=true)
	public void delivery(OrderVO orderVO)throws Exception {
		
		log.info(" delivery ");
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);

		log.info(" orderVO : " + orderVO);
		try {
			orderDAO.delivery(orderVO);
			transactionManager.commit(status);

		} catch (Exception e) {
			transactionManager.rollback(status);
			log.error(" delivery : " + e.getMessage());
		}
		
	}

	// 주문 배송중일때 해당 구매상품 재고 감소
	@Override
	@Transactional(readOnly=true)
	public void productQuan(ProductVO productVO) throws Exception {
		
		log.info(" productQuan ");
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);

		log.info(" productVO : " + productVO);
		try {
			orderDAO.productQuan(productVO);
			transactionManager.commit(status);

		} catch (Exception e) {
			transactionManager.rollback(status);
			log.error(" productQuan : " + e.getMessage());
		}
	}

	// 주문 목록 개수
	@Override
	public int getOrderListCount() {
		
		log.info(" Service getOrderListCount ");
		
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		
		int num = 0;
		
		try {
			num = orderDAO.getOrderListCount();
			transactionManager.commit(status);
				
		} catch(Exception e) {
	        transactionManager.rollback(status);
	        log.error("Service getProductListCount Exception : " + e.getMessage());
	    }
		log.info(" getProductListCount() : " + orderDAO.getOrderListCount());
		
		return num;
	}

	// 주문 아이디 생성
	@Override
	public String generateOrderId() throws Exception {

		log.info(" generateOrderId ");
		
		String orderId = "";
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
		
		for (int i=1; i<=6; i++) {
			subNum += (int)(Math.random() * 10);
		}
		
		orderId = ymd + "_" + subNum;
		
		return orderId;
	}
}
