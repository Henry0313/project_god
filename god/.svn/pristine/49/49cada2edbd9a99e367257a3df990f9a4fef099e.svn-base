package com.project.god.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Faq 게시판 VO
 * 
 * @author god
 *
 */
@Data
@NoArgsConstructor
public class FaqVO {
	
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
	
	/** FaqDTO -> FaqVO */
    public FaqVO(FaqDTO faq) {
       
        this.faqId = faq.getFaqId();
        this.memberId = faq.getMemberId();
        this.faqTitle = faq.getFaqTitle();
        this.faqContent = faq.getFaqContent();
        this.faqReadCount = faq.getFaqReadCount();
    }
}
