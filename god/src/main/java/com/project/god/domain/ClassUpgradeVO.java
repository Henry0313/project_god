package com.project.god.domain;

import java.sql.Date;

import lombok.Data;

/**
 * 등업신청 VO
 * 
 * @author god
 *
 */

@Data
public class ClassUpgradeVO {

	/** 글번호 */
	private int upId;
	
	/** 글내용 */
	private String upContent;
	
	/** 등록일 */
	private Date upDate;
}
