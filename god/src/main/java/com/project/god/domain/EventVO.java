package com.project.god.domain;

import java.sql.Date;

import lombok.Data;

/**
 * Event VO
 * 
 * @author god
 *
 */

@Data
public class EventVO {

	/** 글번호 */
	private int eventId;
	
	/** 제목 */
	private String eventTitle;
	
	/** 내용 */
	private String eventContent;
	
	/** 댓글내용 */
	private String eventReply;
	
	/** 등록일 */
	private Date eventDate;
	
	/** 댓글 등록일 */
	private Date eventReplyDate;
}
