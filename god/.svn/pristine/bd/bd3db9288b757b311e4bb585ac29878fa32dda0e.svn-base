package com.project.god.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
//import org.springframework.transaction.support.TransactionTemplate;

import com.project.god.dao.FaqDAO;
import com.project.god.domain.FaqVO;
import com.project.god.service.FaqService;

import lombok.extern.slf4j.Slf4j;

/**
 * Faq ServiceImpl 
 * Faq 게시판 서비스 구현 클래스
 * 
 * @author god
 *
 */

@Service
@Slf4j
public class FaqServiceImpl implements FaqService {

	@Autowired
	private FaqDAO faqDAO;
	
	/*
	 * 트랜잭션 매니저(transactionManager)를 직접 와이어링 하거나  
	 * 트랜잭션 템플릿(transactionTemplate)을 와이어링 하는 방식 둘 중 하나를 사용하여 
	 * 트랜잭션 제어 프로그래밍을 할 수 있습니다. 
	 */
	
	@Autowired
    private DataSourceTransactionManager transactionManager;
	
//	@Autowired
//	private TransactionTemplate transactionTemplate;
	
	// 플래그 변수를 익명 클래스 메서드 안에 등록하는 에러나는 부분을 패치 -> 멤버 변수화 
	private boolean flag = false;
	
	// 게시글 쓰기
	@Override
	public boolean writeFaq(final FaqVO faqVO) {
		
		log.info(" Service writeFaq ");

		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
 
        TransactionStatus status = transactionManager.getTransaction(def);
        
        try {
            flag = faqDAO.writeFaq(faqVO);
            
            if (flag == true) {
            	transactionManager.commit(status);
            } else {
            	throw new Exception();
            }
                
        } catch (Exception e) {
        	
            transactionManager.rollback(status);
            flag = false;
            e.printStackTrace();            
        }
        
        return flag;
    }
	
	// 게시판 마지막 Seq
	@Override
	public int getFaqNumByLastSeq() {

		log.info(" Service getFaqNumByLastSeq ");
		
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		
		int result = 0;
		
		try {
			result = faqDAO.getFaqNumByLastSeq();
			transactionManager.commit(status);
				
		} catch(Exception e) {
			transactionManager.rollback(status);
	        log.error("Service getFaqNumByLastSeq Exception : " + e.getMessage());
		}
		
		return result;	
	}
	
	// 전체 게시판 조회
	@Override
	public List<FaqVO> getArticleFaqList(int page, int rowsPerPage) {

		log.info(" Service getArticleFaqList ");
		
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		
		List<FaqVO> list = null;
		
		try {
			list = faqDAO.getArticleFaqList(page, rowsPerPage);
			transactionManager.commit(status);
				
		} catch(Exception e) {
			transactionManager.rollback(status);
	        log.error("Service getArticleFaqList Exception : " + e.getMessage());
		}
		
		return list;
	}

	// 게시글 수 조회
	@Override
	public int getFaqListCount() {
		
		log.info(" Service getFaqListCount ");
		
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		
		int result = 0;
		
		try {
			result = faqDAO.getFaqListCount();
			transactionManager.commit(status);
				
		} catch(Exception e) {
	        transactionManager.rollback(status);
	        log.error("Service getFaqListCount Exception : " + e.getMessage());
	    }
		
		log.info(" faqDAO.getFaqListCount : " + faqDAO.getFaqListCount());
		
		return result;
	}
	
	// FAQ 상세 게시글 조회
	@Override
	public FaqVO getFaq(int faqId) throws Exception {
		
		log.info(" Service getFaq ");
		
		return faqDAO.getFaq(faqId);
	}
	
	// 게시글 조회수 증가
	@Override
	public void increaseFaqViewcnt(int faqId, HttpSession session) throws Exception {
		
		log.info(" Service increaseFaqViewcnt ");
		
		long update_time = 0;
		
		// 세션에 저장된 조회시간 검색
		// 최초로 조회할 경우 세션에 저장된 값이 없기 때문에 if문은 실행 X
		if (session.getAttribute("update_time_" + faqId) != null) {
			update_time = (long)session.getAttribute("update_time_" + faqId);
		}
		// 시스템의 현재시간을 current_time에 저장
		long current_time = System.currentTimeMillis();
		// 일정시간이 경과 후 조회수 증가 처리
		// 시스템현재시간 - 열람시간 > 일정시간(조회수 증가가 가능하도록 지정한 시간)
		if (current_time - update_time > 5*1000) {
			faqDAO.increaseFaqViewcnt(faqId);
			// 세션에 시간을 저장 : "update_time_" + faqId는 다른 변수와 중복되지 않게 명명한 것
			session.setAttribute("update_time_" + faqId, current_time);
		}
        
	}
	
	// FAQ 게시글 이전글
	@Override
	public int getPre(int faqId) {
		
		log.info(" Service getPre ");
		
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		
		int result = 0;
		
		try {
			result = faqDAO.getPre(faqId);
			transactionManager.commit(status);
				
		} catch(Exception e) {
	        transactionManager.rollback(status);
	        log.error("Service getPre Exception : " + e.getMessage());
	    }
		
		log.info(" faqDAO.getPre : " + faqDAO.getPre(faqId));
		
		return result;
	}
	
	// FAQ 게시글 다음글
	@Override
	public int getNext(int faqId) {
		
		log.info(" Service getNext ");
		
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		
		int result = 0;
		
		try {
			result = faqDAO.getNext(faqId);
			transactionManager.commit(status);
				
		} catch(Exception e) {
	        transactionManager.rollback(status);
	        log.error("Service getNext Exception : " + e.getMessage());
	    }
		
		log.info(" faqDAO.getNext : " + faqDAO.getNext(faqId));
		
		return result;
	}
	
	// FAQ 게시글 수정
	@Override
	public void updateFaq(FaqVO faqVO) throws Exception {

		log.info(" Service updateFaq ");
		
		faqDAO.updateFaq(faqVO);
	}
	
	// FAQ 게시글 삭제
	@Override
	public void deleteFaq(int faqId) throws Exception {

		log.info(" Service deleteFaq ");

		faqDAO.deleteFaq(faqId);
	}

	// 게시글 검색
	@Override
	public List<FaqVO> getFaqBySearch(String searchDate,
									  String searchKind, 
									  String searchWord, 
									  int rowsPerPage, 
									  int page) {
		log.info(" Service getFaqBySearch ");
		
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		
		List<FaqVO> result = null;
		
		try {
			result = faqDAO.getFaqBySearch(searchDate, searchKind, searchWord, rowsPerPage, page);
			transactionManager.commit(status);
				
		} catch(Exception e) {
			transactionManager.rollback(status);
	        log.error(" Service getFaqBySearch Exception : " + e.getMessage());
		}
		return result;
	}

	
	@Override
	public int getAllFaqsBySearch(String searchDate, String searchKind, String searchWord) {
		
		log.info(" Service getAllFaqsBySearch ");
		
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		
		int result = 0;
		
		try {
			result = faqDAO.getAllFaqsBySearch(searchDate, searchKind, searchWord);
			transactionManager.commit(status);
				
		} catch(Exception e) {
			transactionManager.rollback(status);
	        log.error(" Service getFaqBySearch Exception : " + e.getMessage());
		}
		return result;
	}
}