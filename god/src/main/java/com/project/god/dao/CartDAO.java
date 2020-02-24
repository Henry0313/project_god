package com.project.god.dao;

import java.util.List;

import com.project.god.domain.CartListVO;
import com.project.god.domain.CartVO;

/**
 * 카트 DAO
 * 
 * @author god
 */

public interface CartDAO {
	
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
	 * @param memberId 회원 아이디
	 * @param cartId 카트번호
	 * @return 카트 리스트 객체
	 * @throws Exception 예외처리
	 * 
	 */
	public List<CartListVO> cartList(String memberId) throws Exception;
	public List<CartListVO> cartList3(int cartId) throws Exception;
	
	/**
	 * 카트 삭제
	 * 
	 * @param cartId 카트 번호
	 * @return 삭제할 카트 객체
	 * @throws Exception 예외처리
	 * 
	 */
	public void deleteCart(int cartId) throws Exception;
	
	/**
	 * 카트 비우기
	 * 
	 * @param memberId 회원 아이디
	 * @return 현재 접속한 아이디에 있는 카트 객체
	 * @throws Exception 예외처리
	 * 
	 */
	public void deleteAllCart(String memberId) throws Exception;
	
	/**
	 * 카트 수정
	 * 
	 * @param cartVO 카트 객체
	 * @return 수정할 카트 객체
	 * @throws Exception 예외처리
	 * 
	 */
	public void updateCart(CartVO cartVO) throws Exception;
	
	/**
	 * 카트 금액 합계
	 * 
	 * @param memberId 회원 아이디
	 * @return 카트 금액 합계
	 */
	int cartSumPrice(String memberId);
	
	/**
	 * 카트 금액 합계 (단일 상품)
	 * 
	 * @param cartId 카트 번호
	 * @return 카트 금액
	 */
	int oneCartSumPrice(int cartId);
	
	/**
	 * 개별 카트 조회
	 * 
	 * @param cartVO 카트 객체
	 * @return 카트 객체
	 * @throws Exception 예외처리
	 */
	CartListVO getCart(CartVO cartVO) throws Exception;
	
	/**
	 * 개별 카트 조회 개선판
	 * 
	 * @param cartVO 카트 객체
	 * @return 카트 객체
	 * @throws Exception 예외처리
	 */
	CartListVO getCart2(CartVO cartVO) throws Exception;
	
	/**
	 * 개별 카트 조회(카트 아이디)
	 * 
	 * @param cartId 카트 아이디
	 * @return 카트 객체
	 * @throws Exception 예외처리
	 */
	CartListVO getCartByCartId(int cartId) throws Exception;
	
	/**
	 * 카트 최근 아이디 가져오기 : -1(비정상 cart_id 없음)
	 * 
	 * @return 카트 최근 아이디
	 * @throws Exception 예외처리
	 */
	int getCurrCartId() throws Exception;
	
	/**
	 * 해당 카트 아이디 가져오기
	 * 
	 * @param cartVO 카트 객체
	 * @return 해당 카트 아이디
	 * @throws Exception 예외처리
	 */
	int getThisCartId(CartVO cartVO) throws Exception;
	
}
