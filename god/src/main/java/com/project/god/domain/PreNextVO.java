package com.project.god.domain;

import lombok.Data;

/**
 * PreNext VO
 * 이전글 다음글
 * 
 * @author god
 *
 */

@Data
public class PreNextVO {
	
	/** 이전글 */
	private int preId;
	
	/** 다음글 */
	private int nextId;
}
