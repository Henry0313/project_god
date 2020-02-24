package com.project.god.service;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.god.domain.CustomUser;

import lombok.extern.slf4j.Slf4j;

/**
 * JDBC 인증 서비스 (Spring JDBC 사용)
 * 
 * @author god
 *
 */

@Repository("authJdbcService")
@Slf4j
public class AuthJdbcService {
	
	private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setDataSource(DataSource dataSource) {

		this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
    
    @Transactional(readOnly = true)
    public boolean hasUsername(String username) {
    	
    	boolean flag = false;
    	String sql = "SELECT * FROM users WHERE username=?";
    	
    	log.info("hasUsername : " + username);
    	
    	try {
    		CustomUser customuser = (CustomUser)this.jdbcTemplate
    				 				 .queryForObject(sql, 
								   				     new Object[]{ username },
								   				     new BeanPropertyRowMapper<CustomUser>(CustomUser.class));
    		 
    		flag = customuser != null ? true : false;
    		 
		} catch (Exception e) {
			flag=false;
		}
    	
    	return flag; // 
    } //
    
    @Transactional(propagation = Propagation.REQUIRED)
    public void insertUsers(CustomUser customuser, String roleVO) {
    	
    	log.info(" insertUsers ");
    	
    	String sql  = "INSERT INTO member (member_id, member_pw, enabled) VALUES (?,?,1)";
    	String sql2 = "INSERT INTO member_roles VALUES "
    				+ "(member_roles_seq.nextval,?,?)";
    	
    	this.jdbcTemplate.update(sql, 
    							 new Object[] { customuser.getUsername(), 
    									 		customuser.getPassword() });
    	
    	this.jdbcTemplate.update(sql2, 
    							 new Object[] { customuser.getUsername(),
											    roleVO });
    }
}