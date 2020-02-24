package com.project.god.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.god.domain.CartListVO;
import com.project.god.domain.CartVO;

import lombok.extern.slf4j.Slf4j;

/**
 * 카트 DAO Impl
 * 
 * @author god
 */

@Repository
@Slf4j
public class CartDAOImpl implements CartDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	// 카트에 담기
	@Override
	public void addCart(CartVO cartVO) {
		
		log.info(" dao addCart ");
		
		sqlSession.insert("com.project.god.mapper.CartMapper.addCart", cartVO);
	}

	// 카트 리스트
	@Override
	public List<CartListVO> cartList(String memberId) throws Exception {
		
		log.info(" dao cartList ");
		
		return sqlSession.selectList("com.project.god.mapper.CartMapper.cartList", memberId);
	}
	
	// 카트 리스트
	@Override
	public List<CartListVO> cartList3(int cartId) throws Exception {
		
		log.info(" dao cartList ");
		
		return sqlSession.selectList("com.project.god.mapper.CartMapper.cartList3", cartId);
	}
	
	// 카트 삭제
	@Override
	public void deleteCart(int cartId) throws Exception {
		
		log.info(" dao deleteCart ");
		
		sqlSession.delete("com.project.god.mapper.CartMapper.deleteCart", cartId);
	}
	
	// 카트 비우기
	@Override
	public void deleteAllCart(String memberId) throws Exception {
		
		log.info(" dao deleteAllCart ");
		
		sqlSession.delete("com.project.god.mapper.CartMapper.deleteAllCart", memberId);
	}
	
	// 카트 수정
	@Override
	public void updateCart(CartVO cartVO) throws Exception {
		
		log.info(" dao updateCart ");
		
		sqlSession.update("com.project.god.mapper.CartMapper.updateCart", cartVO);
	}
	
	// 카트 금액 합계
	@Override
	public int cartSumPrice(String memberId) {
		
		log.info(" dao cartSumPrice ");
		
		return sqlSession.selectOne("com.project.god.mapper.CartMapper.cartSumPrice", memberId) == null? 0 : 
			   sqlSession.selectOne("com.project.god.mapper.CartMapper.cartSumPrice", memberId);
	}
	
	// 카트 금액 합계 (단일 상품)
	@Override
	public int oneCartSumPrice(int cartId) {
		
		log.info(" dao oneCartSumPrice ");
		
		return sqlSession.selectOne("com.project.god.mapper.CartMapper.oneCartSumPrice", cartId);
	}

	// 카트 개별 조회
	@Override
	public CartListVO getCart(CartVO cartVO) throws Exception {
		
		log.info(" dao getCart ");
		List<CartListVO> cartListVO = sqlSession.selectList("com.project.god.mapper.CartMapper.getCart", cartVO);
		
		log.info(" cartListVO.size() : " + cartListVO.size());
		
		return cartListVO.get(0);
	}
	
	// 카트 개별 조회 개선판
	@Override
	public CartListVO getCart2(CartVO cartVO) throws Exception {
		
		log.info(" dao getCart2 ");
		List<CartListVO> cartListVO = sqlSession.selectList("com.project.god.mapper.CartMapper.getCart2", cartVO);
		
		log.info(" cartListVO.size() : "+cartListVO.size()); // 테이블 내 카트 레코드 수
		
		return cartListVO==null ? null : cartListVO.get(0);
	}

	// 개별 카트 조회(카트 아이디)
	@Override
	public CartListVO getCartByCartId(int cartId) throws Exception {
		
		log.info(" dao getCartByCartId ");
		return sqlSession.selectOne("com.project.god.mapper.CartMapper.getCartByCartId", cartId);
	}

	// 카트 최근 아이디 가져오기
	@Override
	public int getCurrCartId() throws Exception {

		log.info(" dao getCurrCartId ");
		return sqlSession.selectOne("com.project.god.mapper.CartMapper.getCurrCartId");
	}

	// 해당 카트 아이디 가져오기 : -1(비정상 cart_id 없음)
	@Override
	public int getThisCartId(CartVO cartVO) throws Exception {

		log.info(" dao getThisCartId ");
		
		int result = 0;
		
		if (sqlSession.selectOne("com.project.god.mapper.CartMapper.getThisCartId", cartVO)==null) {
			result = -1;
		} else {
			result = sqlSession.selectOne("com.project.god.mapper.CartMapper.getThisCartId", cartVO);
		}
		
		return result;
	}
}
