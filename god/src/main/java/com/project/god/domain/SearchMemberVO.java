package com.project.god.domain;

import lombok.Data;

/**
 * SearchMember VO
 * 
 * @author god
 *
 */

@Data
public class SearchMemberVO {

	/** 검색 필드  */ 
	private String searchField;
	
	/** 회원 아이디 */
	private String memberId;
	
	/** 회원이름 */
	private String memberName;
	
	/** 검색 값(이메일 또는 휴대폰) */
	private String searchValue;
}
