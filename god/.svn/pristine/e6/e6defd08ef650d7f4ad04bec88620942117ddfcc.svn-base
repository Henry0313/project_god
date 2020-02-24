package com.project.god.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;

import com.project.god.dao.QnaProductDAO;
import com.project.god.domain.QnaProductVO;
import com.project.god.service.QnaProductService;

import lombok.extern.slf4j.Slf4j;

/**
 * QnaProduct ServiceImpl 
 * QnaProduct 게시판 서비스 구현 클래스
 * 
 * @author god
 *
 */

@Service
@Slf4j
public class QnaProductServiceImpl implements QnaProductService {

	@Autowired
	private QnaProductDAO qnaProductDAO;
	
	/*
	 * 트랜잭션 매니저(transactionManager)를 직접 와이어링 하거나  
	 * 트랜잭션 템플릿(transactionTemplate)을 와이어링 하는 방식 둘 중 하나를 사용하여 
	 * 트랜잭션 제어 프로그래밍을 할 수 있습니다. 
	 */
	
	@Autowired
    private DataSourceTransactionManager transactionManager;
	
	@Autowired
	private TransactionTemplate transactionTemplate;
	
	// QnaProduct 게시글 쓰기
	@Override
	public void writeQnaProduct(QnaProductVO qnaProductVO) throws Exception {
		
		log.info(" Service writeQnaProduct ");

        qnaProductDAO.writeQnaProduct(qnaProductVO);
    }
	
	// 게시판 마지막 Seq
	@Override
	public int getQnaProductIdByLastSeq() {

		log.info(" Service getQnaProductIdByLastSeq ");
		
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		
		int result = 0;
		
		try {
			result = qnaProductDAO.getQnaProductIdByLastSeq();
			transactionManager.commit(status);
				
		} catch(Exception e) {
			transactionManager.rollback(status);
	        log.error("Service getQnaProductIdByLastSeq Exception : " + e.getMessage());
		}
		
		return result;	
	}
	
	// 전체 게시판 조회
	@Override
	public List<QnaProductVO> getArticleQnaProductList(int page, int rowsPerPage) {

		log.info(" Service getArticleQnaProductList ");
		
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		
		List<QnaProductVO> list = null;
		log.info("rowsPerPage :"+rowsPerPage);
		
		try {
			list = qnaProductDAO.getArticleQnaProductList(page, rowsPerPage);
			transactionManager.commit(status);
				
		} catch(Exception e) {
			transactionManager.rollback(status);
	        log.error(" Service getArticleQnaProductList Exception : " + e.getMessage());
		}
		return list;
	}

	// 게시글 수
	@Override
	public int getQnaProductListCount() {
		
		log.info(" Service getQnaProductListCount ");
		
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		
		int result = 0;
		
		try {
			result = qnaProductDAO.getQnaProductListCount();
			transactionManager.commit(status);
				
		} catch(Exception e) {
	        transactionManager.rollback(status);
	        log.error(" Service getQnaProductListCount Exception : " + e.getMessage());
	    }
		log.info(" qnaProductDAO.getQnaProductListCount : " + qnaProductDAO.getQnaProductListCount());
		
		return result;
	}
	
	// QnaProduct 게시글 상세 보기
	@Override
	public QnaProductVO getQnaProduct(int qnaProductId) throws Exception {
		
		log.info(" Service getQnaProduct ");
		
		return qnaProductDAO.getQnaProduct(qnaProductId);
	}
	
	// 게시글 번호 및 비밀번호
	@Override
	public QnaProductVO getQnaProductByIdAndPw(int qnaProductId, String qnaProductPw) throws Exception {
		
		log.info(" Service getQnaProduct ");
		
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		
		QnaProductVO qnaProductVO = null;
		
		try {
			qnaProductVO = qnaProductDAO.getQnaProductByIdAndPw(qnaProductId, qnaProductPw);
			transactionManager.commit(status);
			
		} catch(Exception e) {
			transactionManager.rollback(status);
	        log.error(" Service getCountReplys Exception : " + e.getMessage());
		}
		return qnaProductVO;
	}
	
	// QnaProduct 게시글 조회수 증가
	@Override
	public void updateReadCount(int qnaProductId) throws Exception {
		
		log.info(" Service updateReadCount ");
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = transactionManager.getTransaction(def);
        
        boolean flag = false;
        
        try {
            flag = qnaProductDAO.updateReadCount(qnaProductId);
            
            if (flag == true) {
            		transactionManager.commit(status);
            } else {
            		throw new Exception();
            }
                
        } catch (Exception e) {
        	
        	log.error(" Service updateReadCount Exception : " + e.getMessage());
            
        	transactionManager.rollback(status);
            e.printStackTrace();            
        }
	}
	
	// QnaProduct 게시글 이전글
	@Override
	public int getPre(int qnaProductId) {
		
		log.info(" Service getPre ");
		
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		
		int result = 0;
		
		try {
			result = qnaProductDAO.getPre(qnaProductId);
			transactionManager.commit(status);
				
		} catch(Exception e) {
	        transactionManager.rollback(status);
	        log.error(" Service getPre Exception : " + e.getMessage());
	    }
		
		log.info(" qnaProductDAO.getPre : " + qnaProductDAO.getPre(qnaProductId));
		
		return result;
	}
	
	// FAQ 게시글 다음글
	@Override
	public int getNext(int qnaProductId) {
		
		log.info(" Service getNext ");
		
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		
		int result = 0;
		
		try {
			result = qnaProductDAO.getNext(qnaProductId);
			transactionManager.commit(status);
				
		} catch(Exception e) {
	        transactionManager.rollback(status);
	        log.error(" Service getNext Exception : " + e.getMessage());
	    }
		
		log.info(" qnaProductDAO.getNext : " + qnaProductDAO.getNext(qnaProductId));
		
		return result;
	}
	
	// QnaProduct 게시글 수정
	@Override
	public void updateQnaProduct(QnaProductVO qnaProductVO) throws Exception {

		log.info(" Service updateQnaProduct ");
		
		qnaProductDAO.updateQnaProduct(qnaProductVO);
	}
	
	// QnaProduct 게시글 삭제
	@Override
	public void deleteQnaProduct(int qnaProductId) throws Exception {

		log.info(" Service deleteQnaProduct ");

		qnaProductDAO.deleteQnaProduct(qnaProductId);
	}
	
	// QnaProduct 검색/페이징을 이용한 게시글 조회
	@Override
	public List<QnaProductVO> getQnaProductBySearch(String searchDate,
													String searchKind, 
													String searchWord, 
													int rowsPerPage, 
													int page) {
		log.info(" Service getQnaProductBySearch ");
		
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		
		List<QnaProductVO> result = null;
		
		try {
			result = qnaProductDAO.getQnaProductBySearch(searchDate, searchKind, searchWord, rowsPerPage, page);
			transactionManager.commit(status);
				
		} catch(Exception e) {
			transactionManager.rollback(status);
	        log.error(" Service getQnaProductBySearch Exception : " + e.getMessage());
		}
		return result;
	}

	// QnaProduct 검색/페이징을 이용한 전체 게시글 조회수
	@Override
	public int getAllQnaProductsBySearch(String searchDate, String searchKind, String searchWord) {
		
		log.info(" Service getAllQnaProductsBySearch ");
		
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		
		int result = 0;
		
		try {
			result = qnaProductDAO.getAllQnaProductsBySearch(searchDate, searchKind, searchWord);
			transactionManager.commit(status);
				
		} catch(Exception e) {
			transactionManager.rollback(status);
	        log.error(" Service getQnaProductBySearch Exception : " + e.getMessage());
		}
		return result;
	}

	// QnaProduct 댓글 달기 reply
	@Override
	public boolean replyWriteQnaProduct(QnaProductVO qnaProductVO) throws Exception {

		log.info(" Service replyWriteQnaProduct ");
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = transactionManager.getTransaction(def);
        
        boolean flag = false;
        
        try {
            flag = qnaProductDAO.replyWriteQnaProduct(qnaProductVO);
            
            if (flag == true) {
            		transactionManager.commit(status);
            } else {
            		throw new Exception();
            }
                
        } catch (Exception e) {
        	
        	log.error(" Service replyWriteQnaProduct Exception : " + e.getMessage());
            
        	transactionManager.rollback(status);
            flag = false;
            e.printStackTrace();            
        }
		return flag;
	}
	
	// QnaProduct 답변 게시글 원글 및 게시글 순서 수정
	@Override
	public void updateQnaProductByRefAndSeq(int qnaProductReRef, int qnaProductReSeq) throws Exception {
		
		log.info(" Service updateQnaProductByRefAndSeq ");
		
		transactionTemplate.execute(new TransactionCallbackWithoutResult() {

			@Override
			protected void doInTransactionWithoutResult(TransactionStatus status) {

				try {
					qnaProductDAO.updateQnaProductByRefAndSeq(qnaProductReRef, qnaProductReSeq);
				} catch (Exception e) {
					status.setRollbackOnly(); 
		            log.debug(" Service updateQnaProductByRefAndSeq Exception : " + e.getMessage());
				}
			}
		});
	}

	// QnaProduct 답글 게시글 수
	@Override
	@Transactional(readOnly=true)
	public int getCountReplys(int qnaProductId) throws Exception {
		
		log.info(" Service getCountReplys ");
		
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		
		int result = 0;
		
		try {
			result = qnaProductDAO.getCountReplys(qnaProductId);
			transactionManager.commit(status);
		} catch(Exception e) {
			transactionManager.rollback(status);
	        log.error("Service getCountReplys Exception : " + e.getMessage());
		}
		return result;	
	}
}