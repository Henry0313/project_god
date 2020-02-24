package com.project.god.domain;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * QnaProduct VO
 * QnaProduct 게시판 VO
 * 
 * @author god
 *
 */
@Data
@NoArgsConstructor
public class QnaProductVO {
	
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
	
	/** 이전글 */
	private int preId;
	
	/** 다음글 */
	private int nextId;
	
	
	/** QnaProductDTO -} QnaProductVO */
    public QnaProductVO(QnaProductDTO qnaProduct) {
       
        this.qnaProductId = qnaProduct.getQnaProductId();
        this.memberId = qnaProduct.getMemberId();
        this.qnaProductPw = qnaProduct.getQnaProductPw();
        this.qnaProductTitle = qnaProduct.getQnaProductTitle();
        this.qnaProductContent = qnaProduct.getQnaProductContent();
        this.qnaProductFile = qnaProduct.getQnaProductFile();
        this.qnaProductReRef = qnaProduct.getQnaProductReRef();
        this.qnaProductReLev = qnaProduct.getQnaProductReLev();
        this.qnaProductReSeq = qnaProduct.getQnaProductReSeq();
        this.qnaProductReadCount = qnaProduct.getQnaProductReadCount();
        this.qnaProductDate = qnaProduct.getQnaProductDate();
    }
}
