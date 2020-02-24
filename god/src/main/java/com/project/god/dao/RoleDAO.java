package com.project.god.dao;

import com.project.god.domain.RoleVO;

/**
 * 회원등급 DAO
 * 회원등급 관리
 * 
 * @author god
 *
 */

public interface RoleDAO {

	/**
	 * 회원 롤(Role)정보 생성
	 * 
	 * @param roleVO 회원 Role 객체
	 * @throws Exception 예외처리
	 */
	void insertRole(RoleVO roleVO) throws Exception;
	
}
