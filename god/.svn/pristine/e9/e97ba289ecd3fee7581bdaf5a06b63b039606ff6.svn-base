package com.project.god.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.god.domain.RoleVO;

import lombok.extern.slf4j.Slf4j;

/**
 * 회원등급 DAO Impl
 * 회원등급 관리
 * 
 * @author god
 *
 */

@Repository
@Slf4j
public class RoleDAOImpl implements RoleDAO {

	@Autowired
	private SqlSession sqlSession;

	// 회원 Role 생성
	@Override
	public void insertRole(RoleVO roleVO) throws Exception {
		
		log.info(" dao insertRole ");
		
		sqlSession.insert("mapper.Member.inserRole", roleVO);
	}
}
