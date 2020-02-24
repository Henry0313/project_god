package com.project.god.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.god.domain.QnaProductVO;
import com.project.god.mapper.QnaProductMapper;

import lombok.extern.slf4j.Slf4j;

/**
 * 상품문의 DAO Impl
 * QnaProduct DAO 구현 클래스
 * 
 * @author god
 *
 */

@Repository
@Slf4j
public class QnaProductDAOImpl implements QnaProductDAO {

	@Autowired
	private SqlSession sqlSession;

	// QnaProduct 게시글 쓰기
	@Override
	public void writeQnaProduct(QnaProductVO qnaProductVO) throws Exception {

		log.info(" dao writeQnaProduct ");
		
		sqlSession.getMapper(QnaProductMapper.class).writeQnaProduct(qnaProductVO);
		
	}
	
	// 마지막 게시글 번호
	@Override
	public int getQnaProductIdByLastSeq() {

		log.info(" dao getQnaProductIdByLastSeq ");
		
		return sqlSession.getMapper(QnaProductMapper.class).getQnaProductIdByLastSeq();
	}	
	
	// 게시판 리스트 조회
	@Override
	public List<QnaProductVO> getArticleQnaProductList(int page, int rowsPerPage) {

		log.info(" dao getArticleQnaProductList ");
		
		return sqlSession.getMapper(QnaProductMapper.class).getArticleQnaProductList(page, rowsPerPage);
	}

	// 전체 게시글 수
	@Override
	public int getQnaProductListCount() {

		log.info(" dao getQnaProductListCount ");
		
		return sqlSession.getMapper(QnaProductMapper.class).getQnaProductListCount();
	}
	
	// QnaProduct 게시글 상세 보기
	@Override
	public QnaProductVO getQnaProduct(int qnaProductId) throws Exception {
		
		log.info(" dao getQnaProduct ");
		
		return sqlSession.selectOne("com.project.god.mapper.QnaProductMapper.getQnaProduct", qnaProductId);
	} //
	
	// QnaProduct 게시글 비밀번호 확인
	@Override
	public QnaProductVO getQnaProductByIdAndPw(int qnaProductId, String qnaProductPw) throws Exception {
		
		log.info(" dao getQnaProductByIdAndPw ");
		
		return sqlSession.getMapper(QnaProductMapper.class).getQnaProductByIdAndPw(qnaProductId, qnaProductPw);
	}
	
	// QnaProduct 게시글 조회수 증가
	@Override
	public boolean updateReadCount(int qnaProductId) throws Exception {

		log.info(" dao updateQnaProductReadCount ");
		
		boolean flag = false;
		
		try {
			sqlSession.getMapper(QnaProductMapper.class).updateReadCount(qnaProductId);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} 	
		
		return flag;
	}
	
	// QnaProduct 게시글 이전글
	@Override
	public int getPre(int qnaProductId) {
		
		log.info(" dao getPre ");
		
		return sqlSession.getMapper(QnaProductMapper.class).getPre(qnaProductId);
	}
	
	// QnaProduct 게시글 다음글
	@Override
	public int getNext(int qnaProductId) {
		
		log.info(" dao getNext ");
		
		return sqlSession.getMapper(QnaProductMapper.class).getNext(qnaProductId);
	}
	
	// QnaProduct 게시글 수정
	@Override
	public void updateQnaProduct(QnaProductVO qnaProductVO) throws Exception {

		log.info(" dao updateQnaProduct ");
		
		sqlSession.update("com.project.god.mapper.QnaProductMapper.updateQnaProduct", qnaProductVO);
	}
	
	// QnaProduct 게시글 삭제
	@Override
	public void deleteQnaProduct(int qnaProductId) throws Exception {

		log.info(" dao deleteQnaProduct ");
		
		sqlSession.delete("com.project.god.mapper.QnaProductMapper.deleteQnaProduct", qnaProductId);
	}

	// QnaProduct 검색/페이징을 이용한 게시글 조회
	@Override
	public List<QnaProductVO> getQnaProductBySearch(String searchDate,
									  String searchKind, 
									  String searchWord, 
									  int rowsPerPage, 
									  int page) {

		log.info(" dao getQnaProductBySearch ");
		log.info(" 검색 기간 : {}", searchDate);
		log.info(" 검색 구분 : {}", searchKind);
		log.info(" 검색어 : {}", searchWord);
		
		return sqlSession.getMapper(QnaProductMapper.class).getQnaProductBySearch(searchDate, searchKind, searchWord, rowsPerPage, page);
	}

	// QnaProduct 검색/페이징을 이용한 전체 게시글 조회수
	@Override
	public int getAllQnaProductsBySearch(String searchDate, String searchKind, String searchWord) {
		
		log.info(" dao getAllQnaProductsBySearch ");
		log.info(" 검색 기간 : {}", searchDate);
		log.info(" 검색 구분 : {}", searchKind);
		log.info(" 검색어 : {}", searchWord);
		
		return sqlSession.getMapper(QnaProductMapper.class).getAllQnaProductsBySearch(searchDate, searchKind, searchWord);
	}

	// QnaProduct 댓글 달기 reply
	@Override
	public boolean replyWriteQnaProduct(QnaProductVO qnaProductVO) throws Exception {
		
		log.info(" dao replyWriteQnaProduct ");
		
		boolean flag = false; 
		
		try {
			sqlSession.getMapper(QnaProductMapper.class).replyWriteQnaProduct(qnaProductVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}

	// QnaProduct 답변 게시글 원글 및 게시글 순서 수정
	@Override
	public void updateQnaProductByRefAndSeq(int qnaProductReRef, int qnaProductReSeq) throws Exception {

		log.info(" dao updateQnaProductByRefAndSeq ");
		
		sqlSession.getMapper(QnaProductMapper.class).updateQnaProductByRefAndSeq(qnaProductReRef, qnaProductReSeq);
	}

	// QnaProduct 답글 게시글 수
	@Override
	public int getCountReplys(int qnaProductId) throws Exception {
		
		log.info(" dao getCountReplys ");
		
		return sqlSession.getMapper(QnaProductMapper.class).getCountReplys(qnaProductId);
	}
}
