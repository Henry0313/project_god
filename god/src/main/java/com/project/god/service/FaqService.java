package com.project.god.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.project.god.domain.FaqVO;

/**
 * Faq Service
 * Faq 게시판 관리 서비스
 * 
 * @author god
 *
 */

public interface FaqService {
	
	/**
	 * 글쓰기 Faq
	 * 
	 * @param faqVO
	 * @return 전체 게시판
	 * 
	 */
	boolean writeFaq(FaqVO faqVO);
	
	/**
	 * Faq 게시판 마지막 Seq
	 * 
	 * @return 전체 게시판
	 */
	int getFaqNumByLastSeq();
	
    /**
     * 전체 게시판  레코드(튜플) 조회(read)
     * 
     * @param page 페이지
     * @param rowsPerPage 페이지 당 행수
     * @return 전체 게시판
     * 
     */
	List<FaqVO> getArticleFaqList(int page, int rowsPerPage);
	
	/**
	 * 게시글 목록 수 조회
	 * 
	 * @return 게시글 목록 수
	 * 
	 */
	int getFaqListCount();
	
	/**
	 * 개별 게시글 조회
	 * 
	 * @param faqId 게시글 번호
	 * @return 게시판 객체
	 * @throws Exception 예외처리
	 * 
	 */
	public FaqVO getFaq(int faqId) throws Exception;
	
	/**
	 * 게시글 조회수 증가
	 * 
	 * @param faqId 게시글 번호
	 * @param session 세션
	 * @return 업데이트 성공 여부
	 * @throws Exception 예외처리
	 * 
	 */
	public void increaseFaqViewcnt(int faqId, HttpSession session) throws Exception;
	
	/**
	 * 이전 게시글
	 * 
	 * @param faqId 게시글 번호
	 * @return 이전 게시글 번호
	 * 
	 */
	int getPre(int faqId);
	
	/**
	 * 다음 게시글
	 * 
	 * @param faqId 게시글 번호
	 * @return 다음 게시글 번호
	 * 
	 */
	int getNext(int faqId);
	
	/**
	 * 게시글 수정
	 * 
	 * @param FaqVO 게시판 객체
	 * @return 수정 레코드(record, row) 개수
	 * @throws Exception 예외처리
     * 
     */
	public void updateFaq(FaqVO faqVO) throws Exception;
	
	/**
	 * 게시글 삭제
	 * 
	 * @param faqId 게시글 번호
	 * @return 삭제 레코드(record, row) 개수
	 * @throws Exception 예외처리
     * 
     */
	public void deleteFaq(int faqId) throws Exception;
	
	/**
	 * 검색/페이징을 이용한 게시글 조회
	 * 
	 * @param searchDate 검색기간
	 * @param searchKind 검색종류
	 * @param searchWord 검색단어
	 * @param page 페이지
     * @param rowsPerPage 페이지 당 행수
	 * @param isLike 유사 검색(Like) 여부 usage) 유사 검색 : true, 동등 검색 : false
	 * @return 검색 결과 게시글 객체
	 * 
	 */
	List<FaqVO> getFaqBySearch(String searchDate,
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
	 * @param isLike 유사 검색(Like) 여부 usage) 유사 검색 : true, 동등 검색 : false
	 * @return 검색 결과 전체 게시글 수
	 * 
	 */
	int getAllFaqsBySearch(String searchDate,
						   String searchKind, 
						   String searchWord);
}
