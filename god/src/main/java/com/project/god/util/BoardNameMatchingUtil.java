package com.project.god.util;

import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class BoardNameMatchingUtil {
	
	/**
	 * 게시판 이름을 통해서 게시판 테이블명을 가져온다
	 * 
	 * @param boardName 게시판이름
	 * @return 테이블명
	 */
	public String getTableNameByBoardName(String boardName) {
		
		log.info("BoardNameMatchingUtil.getTableNameByBoardName");
		
		String boardTbl = "";
		
		switch(boardName) {
			case "FAQ" : boardTbl = "faq"; break;
			case "상품 문의" : boardTbl = "qna_product"; break;
			case "배송 문의" : boardTbl = "배송 문의"; break;
			case "입금/기타 문의" : boardTbl = "입금/기타 문의"; break;
			case "배송 전 변경/취소" : boardTbl = "배송 전 변경/취소"; break;
			case "배송 후 교환/반품" : boardTbl = "배송 후 교환/반품"; break;
			case "등업신청" : boardTbl = "등업신청"; break;
			case "EVENT" : boardTbl = "EVENT"; break;
		}
		
		
		return boardTbl;
	}

}
