package com.project.god.domain;

import java.sql.Date;

import lombok.Data;

/**
 * Qna Product DTO
 * 
 * @author god
 *
 */

@Data
public class QnaProductDTO {

	/** 글 번호 */
	private int qnaProductId;
	
	/** 글 작성자 */
	private String memberId;
	
	/** 글 비밀번호 */
	private String qnaProductPw;
	
	/** 글 제목 */
	private String qnaProductTitle;
	
	/** 글 내용 */
	private String qnaProductContent;
	
	/** 첨부파일 */
	private String qnaProductFile;
	
	/** 관련글 번호 */
	private int qnaProductReRef;
	
	/** 답글 레벨 */
	private int qnaProductReLev;
	
	/** 관련글 중 출력 순서 */
	private int qnaProductReSeq;
	
	/** 조회수 */
	private int qnaProductReadCount = 0;
	
	/** 작성일 */
	private Date qnaProductDate;
}
