package com.project.god.service;

import java.util.List;
import java.util.NavigableSet;

import com.project.god.domain.CartListVO;
import com.project.god.domain.CartVO;

/**
 * 카트 서비스
 * 
 * @author god
 *
 */

public interface CartService {
	
	/**
	 * 카트 담기
	 * 
	 * @param CartVO 카트 객체
	 * @return 카트에 담을 객체
	 * 
	 */
	void addCart(CartVO cartVO);

	/**
	 * 카트 리스트
	 * 
	 * @param CartListVO 카트 리스트 객체
	 * @return 카트 리스트
	 * @throws Exception 예외처리
	 * 
	 */
	public List<CartListVO> cartList2(String memberId) throws Exception;
	
	/**
	 * 카트 리스트
	 * 
	 * @param CartListVO 카트 리스트 객체
	 * @return 카트 리스트
	 * @throws Exception 예외처리
	 * 
	 */
	public List<CartListVO> cartList3(int cartId) throws Exception;
	
	/**
	 * 카트 리스트
	 * 
	 * @param memberId 회원 아이디
	 * @param cartVOList 세션 카트
	 * @return 카트 리스트
	 * @throws Exception 예외처리
	 * 
	 */
	public List<CartListVO> cartList(String memberId, NavigableSet<CartVO> cartVOList) throws Exception;
	
	/**
	 * 카트 삭제
	 * 
	 * @param cartId 카트 번호
	 * @return 카트 삭제 여부
	 * @throws Exception 예외처리
	 * 
	 */
	public boolean deleteCart(int cartId) throws Exception;
	
	/**
	 * 카트 비우기
	 * 
	 * @param memberId 회원 아이디
	 * @return 카트 비우기
	 * @throws Exception 예외처리
	 * 
	 */
	public void deleteAllCart(String memberId) throws Exception;
	
	/**
	 * 카트 수정
	 * 
	 * @param cartVO 카트 객체
	 * @return 카트 수정 여부
	 * @throws Exception 예외처리
	 * 
	 */
	public boolean updateCart(CartVO cartVO) throws Exception;

	/**
	 * 카트 금액 합계
	 * 
	 * @param memberId 회원 아이디
	 * @return 카트 금액 합계
	 * 
	 */
	int cartSumPrice(String memberId);
	
	/**
	 * 카트 금액 합계 (단일 상품)
	 * 
	 * @param cartId 카트 번호
	 * @return 카트 금액 합계
	 * 
	 */
	int oneCartSumPrice(int cartId);
	
	/**
	 * 개별 카트 조회(카트 아이디)
	 * 
	 * @param cartId 카트 아이디
	 * @return 카트 리스트 객체
	 * @throws Exception 예외처리
	 * 
	 */
	CartListVO getCartByCartId(int cartId) throws Exception;
	
	/**
	 * 해당 카트 아이디 가져오기
	 * 
	 * @param cartVO 카트 객체
	 * @return 해당 카트 아이디
	 * @throws Exception 예외처리
	 * 
	 */
	int getThisCartId(CartVO cartVO) throws Exception;
	
}
