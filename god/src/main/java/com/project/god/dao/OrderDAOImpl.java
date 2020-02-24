package com.project.god.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.god.domain.OrderDetailVO;
import com.project.god.domain.OrderVO;
import com.project.god.domain.ProductVO;
import com.project.god.mapper.OrderMapper;

import lombok.extern.slf4j.Slf4j;

/**
 * 주문 DAO Impl
 * 주문 DAO 구현 클래스
 * 
 * @author god
 *
 */

@Repository
@Slf4j
public class OrderDAOImpl implements OrderDAO {

	@Autowired
	private SqlSession sqlSession;
	
	// 주문 정보
	@Override
	public void orderInfo(OrderVO orderVO) throws Exception {

		log.info(" dao orderInfo ");
		
		sqlSession.insert("com.project.god.mapper.OrderMapper.orderInfo", orderVO);
	}
	
	// 주문 상세 정보
	@Override
	public void orderDetailInfo(OrderDetailVO orderDetailVO) throws Exception {
		
		log.info(" dao orderDetailInfo ");
		
		sqlSession.insert("com.project.god.mapper.OrderMapper.orderDetailInfo", orderDetailVO);
		
	}

	// 주문 목록
	@Override
	public List<OrderDetailVO> orderList(String memberId) throws Exception {

		log.info(" dao orderList ");
		
		return sqlSession.selectList("com.project.god.mapper.OrderMapper.orderList", memberId);
	}
	
	// 주문 아이디 하나씩만 가져오기
	@Override
	public List<OrderVO> orderListId(String memberId) throws Exception {
		
		log.info(" dao orderListId ");
		
		return sqlSession.selectList("com.project.god.mapper.OrderMapper.orderListId", memberId);
	}
	
	// 전체 주문목록
	@Override
	public List<OrderVO> getOrderList(int page, int rowsPerPage) throws Exception {
		
		log.info(" dao getOrderList ");
		
		return sqlSession.getMapper(OrderMapper.class).getOrderList(page, rowsPerPage);
	}
	
	// 상세 주문조회
	@Override
	public List<OrderDetailVO> getOrderView(String orderId) throws Exception {
		
		log.info(" dao getOrderView ");
		log.info(" orderId : " + orderId);
		
		return sqlSession.selectList("com.project.god.mapper.OrderMapper.getOrderView", orderId);
	}

	// 배송상태 처리
	@Override
	public void delivery(OrderVO orderVO) throws Exception {
		
		log.info(" dao orderDeliveryUpdate ");
		
		sqlSession.update("com.project.god.mapper.OrderMapper.orderDeliveryUpdate", orderVO);
	}

	// 배송 중일때 해당 구매 상품 재고 감소
	@Override
	public void productQuan(ProductVO productVO) throws Exception {
		
		log.info(" dao orderProductQuanUpdate ");
		log.info(" productVO : " + productVO);
		
		sqlSession.update("com.project.god.mapper.OrderMapper.productQuanUpdate", productVO);
	}

	// 주문 목록 개수
	@Override
	public int getOrderListCount() {
		log.info(" dao getOrderListCount ");
		return sqlSession.getMapper(OrderMapper.class).getOrderListCount();
	}
}
