package com.project.god.domain;

import lombok.Data;

/**
 * Faq DTO
 * 
 * @author god
 *
 */

@Data
public class FaqDTO {

	/** 글 번호 */
	private int faqId;
	
	/** 글 작성자 */
	private String memberId;
	
	/** 글 제목 */
	private String faqTitle;
	
	/** 글 내용 */
	private String faqContent;
	
	/** 조회수 */
	private int faqReadCount = 0;
}
