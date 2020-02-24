package com.project.god.domain;

import java.sql.Date;

import lombok.Data;

/**
 * Review VO
 * 
 * @author god
 *
 */

@Data
public class ReviewVO {

	/** 리뷰번호 */
	private int reviewId;
	
	/** 제목 */
	private String reviewTitle;
	
	/** 평점 */
	private int reviewEval;
	
	/** 리뷰내용 */
	private String reviewContent;
	
	/** 리뷰답변 */
	private String reviewReply;
	
	/** 답변유무 */
	private String reviewReplyYn;
	
	/** 리뷰이미지 */
	private String reviewImg;
	
	/** 등록일 */
	private Date reviewDate;
}
