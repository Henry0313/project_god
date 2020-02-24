package com.project.god.service.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.NavigableSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.god.dao.CartDAO;
import com.project.god.domain.CartListVO;
import com.project.god.domain.CartVO;
import com.project.god.service.CartService;

import lombok.extern.slf4j.Slf4j;

/**
 * 카트 서비스 Impl
 * 
 * @author god
 *
 */

@Service
@Slf4j
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDAO cartDAO;
	
	// 카트에 담기
	@Override
	public void addCart(CartVO cartVO) {
		
		log.info(" service addCart ");
		
		cartDAO.addCart(cartVO);
	}

	// 카트 리스트
	@Override
	public List<CartListVO> cartList2(String memberId) throws Exception {
		
		log.info(" service cartList ");
		
		return cartDAO.cartList(memberId);
	}
	
	// 카트 리스트
	@Override
	public List<CartListVO> cartList3(int cartId) throws Exception {
		
		log.info(" service cartList ");
		
		return cartDAO.cartList3(cartId);
	}
	
	// 카트 리스트
	@Override
	public List<CartListVO> cartList(String memberId, NavigableSet<CartVO> cartVOList) throws Exception {
		
		log.info(" service cartList ");
		
		List<CartListVO> cartListVOList = new ArrayList<>();
		
		CartListVO cartListVO = null;
		
		// 세션 카트 -> 카트리스트로 대응(ThumImg 등 부가정보 추가)
		for(CartVO cartVO : cartVOList) {
			
			log.info(" cartVO : " + cartVO);
			
			// 날짜 인자 없으면 오늘 날짜로 셋팅
			if(cartVO.getCartDate()==null) cartVO.setCartDate(new Date(System.currentTimeMillis()));
			
			try {
				cartListVO = new CartListVO();
				cartListVO = cartDAO.getCart2(cartVO);
				cartListVO.setCartQuan(cartVO.getCartQuan()); // 변경 수량 반영
				
				cartListVOList.add(cartListVO);
			} catch (NullPointerException e) {
				log.info(" 빈 카트 상태 ");
			}
			
		}
		
		return cartListVOList;
	}
	
	// 카트 삭제
	@Override
	public boolean deleteCart(int cartId) throws Exception {
		
		log.info(" service deleteCart ");
		
		boolean flag = false;
		
		try {
			cartDAO.deleteCart(cartId);
			flag = true;
		} catch (Exception e) {
			flag = false;
		}
		return flag;
	}
	
	// 카트 비우기
	@Override
	public void deleteAllCart(String memberId) throws Exception {
		
		log.info(" service deleteAllCart ");
		
		cartDAO.deleteAllCart(memberId);
	}
	
	// 카트 수정
	@Override
	public boolean updateCart(CartVO cartVO) throws Exception {
		
		log.info(" service updateCart ");
		
		boolean flag = false;
		
		try {
			cartDAO.updateCart(cartVO);
			flag = true;
		} catch (Exception e) {
			flag = false;
		}
		return flag;
	}
	
	// 카트 금액 합계
	@Override
	public int cartSumPrice(String memberId) {
		
		log.info(" service cartSumPrice ");
		
		return cartDAO.cartSumPrice(memberId);
	}
	
	// 카트 금액 합계 (단일 상품)
	@Override
	public int oneCartSumPrice(int cartId) {
		
		log.info(" service oneCartSumPrice ");
		
		return cartDAO.oneCartSumPrice(cartId);
	}

	// 개별 카트 조회(카트 아이디)
	@Override
	public CartListVO getCartByCartId(int cartId) throws Exception {
		
		log.info(" service getCartByCartId ");
		
		return cartDAO.getCartByCartId(cartId);
	}

	// 해당 카트 아이디 가져오기 : -1(비정상 cart_id 없음)
	@Override
	public int getThisCartId(CartVO cartVO) throws Exception {

		log.info(" service getThisCartId ");
		
		return cartDAO.getThisCartId(cartVO);
	}
}
