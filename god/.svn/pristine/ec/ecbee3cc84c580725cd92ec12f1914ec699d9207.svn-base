package com.project.god.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.god.domain.FaqVO;
import com.project.god.mapper.FaqMapper;

import lombok.extern.slf4j.Slf4j;

/**
 * FAQ 게시판 DAO Impl
 * 
 * @author god
 */

@Repository
@Slf4j
public class FaqDAOImpl implements FaqDAO {
	
	@Autowired
	private SqlSession sqlSession;

	// FAQ 게시글 작성
	@Override
	public boolean writeFaq(FaqVO faqVO) {

		log.info(" dao writeFaq ");
		boolean flag = false;
		
		try {
			sqlSession.getMapper(FaqMapper.class).writeFaq(faqVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	// 최근 게시글 번호
	@Override
	public int getFaqNumByLastSeq() {

		log.info(" dao getFaqNumByLastSeq ");
		
		return sqlSession.getMapper(FaqMapper.class).getFaqNumByLastSeq();
	}	
	
	// FAQ 리스트
	@Override
	public List<FaqVO> getArticleFaqList(int page, int rowsPerPage) {

		log.info(" dao getArticleFaqList ");
		
		return sqlSession.getMapper(FaqMapper.class).getArticleFaqList(page, rowsPerPage);
	}

	// 게시글 수
	@Override
	public int getFaqListCount() {

		log.info(" dao getFaqListCount ");
		
		return sqlSession.getMapper(FaqMapper.class).getFaqListCount();
	}
	
	// FAQ 게시글 상세 보기
	@Override
	public FaqVO getFaq(int faqId) throws Exception {
		
		log.info(" dao selectFaq ");
		
		return sqlSession.selectOne("com.project.god.mapper.FaqMapper.getFaq", faqId);
	}
	
	// FAQ 게시글 조회수 증가
	@Override
	public void increaseFaqViewcnt(int faqId) throws Exception {

		log.info(" dao updateFaqReadCount ");
		
		sqlSession.update("com.project.god.mapper.FaqMapper.increaseFaqViewcnt", faqId);
	}
	
	// FAQ 게시글 이전글
	@Override
	public int getPre(int faqId) {
		
		log.info(" dao getPre ");
		
		return sqlSession.getMapper(FaqMapper.class).getPre(faqId);
	}
	
	// FAQ 게시글 다음글
	@Override
	public int getNext(int faqId) {
		
		log.info(" dao getNext ");
		
		return sqlSession.getMapper(FaqMapper.class).getNext(faqId);
	}
	
	// FAQ 게시글 수정
	@Override
	public void updateFaq(FaqVO faqVO) throws Exception {

		log.info(" dao updateFaq ");
		
		sqlSession.update("com.project.god.mapper.FaqMapper.updateFaq", faqVO);
	}
	
	// FAQ 게시글 삭제
	@Override
	public void deleteFaq(int faqId) throws Exception {

		log.info(" dao deleteFaq ");
		
		sqlSession.delete("com.project.god.mapper.FaqMapper.deleteFaq", faqId);
	}

	// 게시글 검색
	@Override
	public List<FaqVO> getFaqBySearch(String searchDate,
									  String searchKind, 
									  String searchWord, 
									  int rowsPerPage, 
									  int page) {

		log.info(" dao getFaqBySearch ");
		log.info(" 검색 기간 : {}", searchDate);
		log.info(" 검색 구분 : {}", searchKind);
		log.info(" 검색어 : {}", searchWord);
		
		return sqlSession.getMapper(FaqMapper.class).getFaqBySearch(searchDate, searchKind, searchWord, rowsPerPage, page);
	}

	// 게시글 검색 결과 수
	@Override
	public int getAllFaqsBySearch(String searchDate, String searchKind, String searchWord) {
		
		log.info(" dao getAllFaqsBySearch ");
		log.info(" 검색 기간 : {}", searchDate);
		log.info(" 검색 구분 : {}", searchKind);
		log.info(" 검색어 : {}", searchWord);
		
		return sqlSession.getMapper(FaqMapper.class).getAllFaqsBySearch(searchDate, searchKind, searchWord);
	}
}
