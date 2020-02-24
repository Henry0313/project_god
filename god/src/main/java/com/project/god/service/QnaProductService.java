package com.project.god.service;

import java.util.List;

import com.project.god.domain.QnaProductVO;

/**
 * Qna Product Service
 * Qna Product 게시판 관리 서비스
 * 
 * @author god
 *
 */

public interface QnaProductService {
	
	/**
	 * 글쓰기 QnaProduct
	 * 
	 * @param qnaProductVO 상품문의 객체
	 * @throws Exception 예외처리
	 * 
	 */
	public void writeQnaProduct(QnaProductVO qnaProductVO) throws Exception;
	
	/**
	 * QnaProduct 게시판 마지막 Seq
	 * 
	 * @return 전체 게시판
	 * 
	 */
	int getQnaProductIdByLastSeq();
	
    /**
     * 전체 게시판  레코드(튜플) 조회(read)
     * 
     * @param page 페이지
     * @param rowsPerPage 페이지 당 행수
     * @return 전체 게시판
     * 
     */
	List<QnaProductVO> getArticleQnaProductList(int page, int rowsPerPage);
	
	/**
	 * 게시글 목록 수 조회
	 * 
	 * @return 게시글 목록 수
	 * 
	 */
	int getQnaProductListCount();
	
	/**
	 * 개별 게시글 조회
	 * 
	 * @param qnaProductId 게시글 번호
	 * @return 게시판 객체
	 * @throws Exception 예외처리
	 * 
	 */
	public QnaProductVO getQnaProduct(int qnaProductId) throws Exception;
	
	/**
	 * 게시글 번호 및 비밀번호
	 * 
	 * @param qnaProductId 게시글 번호
	 * @param qnaProductPw 게시글 비밀번호
	 * @return 게시판 객체
	 * @throws Exception 예외처리
	 * 
	 */
	public QnaProductVO getQnaProductByIdAndPw(int qnaProductId, String qnaProductPw) throws Exception;
	
	/**
	 * 게시글 조회수 증가
	 * 
	 * @param qnaProductId 게시글 번호
	 * @throws Exception 예외처리
	 * 
	 */
	void updateReadCount(int qnaProductId) throws Exception;
	
	/**
	 * 이전 게시글
	 * 
	 * @param qnaProductId 게시글 번호
	 * @return 이전 게시글 번호
	 */
	int getPre(int qnaProductId);
	
	/**
	 * 다음 게시글
	 * 
	 * @param qnaProductId 게시글 번호
	 * @return 다음 게시글 번호
	 */
	int getNext(int qnaProductId);
	
	/**
	 * 게시글 수정
	 * 
	 * @param qnaProductVO 게시판 객체
	 * @throws Exception 예외처리
     * 
     */
	public void updateQnaProduct(QnaProductVO qnaProductVO) throws Exception;
	
	/**
	 * 게시글 삭제
	 * 
	 * @param qnaProductId 게시글 번호
	 * @throws Exception 예외처리
     * 
     */
	public void deleteQnaProduct(int qnaProductId) throws Exception;
	
	/**
	 * 검색/페이징을 이용한 게시글 조회
	 * 
	 * @param searchDate 검색기간
	 * @param searchKind 검색종류
	 * @param searchWord 검색단어
	 * @param page 페이지
     * @param rowsPerPage 페이지 당 행수
	 * @return 검색 결과 게시글 객체
	 * 
	 */
	List<QnaProductVO> getQnaProductBySearch(String searchDate,
										     String searchKind, 
										     String searchWord, 
										     int rowsPerPage,
										     int page);
	
	/**
	 * 검색/페이징을 이용한 전체 게시글 조회수
	 * 
	 * @param searchDate 검색기간
	 * @param searchKind 검색종류
	 * @param searchWord 검색단어
	 * @return 검색 결과 전체 게시글 수
	 * 
	 */
	int getAllQnaProductsBySearch(String searchDate,
							      String searchKind, 
							      String searchWord);
	
	/**
	 * 댓글 달기 reply
	 * 
	 * @param qnaProductVO 상품문의 객체
	 * @return 댓글 달기 성공여부
	 * @throws Exception 예외처리
	 * 
	 */
	public boolean replyWriteQnaProduct(QnaProductVO qnaProductVO) throws Exception;
	
	/**
	 * 답변 게시글 원글 및 게시글 순서 수정
	 * 
	 * @param qnaProductReRef 관련글 번호
	 * @param qnaProductReSeq 관련글 중 출력 순서
	 * @throws Exception 예외처리
	 */
	void updateQnaProductByRefAndSeq(int qnaProductReRef, int qnaProductReSeq) throws Exception;
	
	/**
	 * 답글 게시글 수
	 * 
	 * @param qnaProductId 상품문의 번호
	 * @return 답글 게시글 수
	 * @throws Exception 예외처리
	 */
	int getCountReplys(int qnaProductId) throws Exception;
	
}
