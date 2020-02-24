package com.project.god.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.project.god.domain.CustomUser;
import com.project.god.domain.MemberVO;
import com.project.god.domain.RoleVO;

import lombok.extern.slf4j.Slf4j;

/**
 * CustomProvider
 * 
 * @author god
 *
 */

@Component
@Slf4j
public class CustomProvider 
		implements AuthenticationProvider, UserDetailsService {
	
	private JdbcTemplate jdbcTemplate;
	
    @Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
    @Override
	public CustomUser loadUserByUsername(String memberId) {
    	
    	log.info("loadUserByUsername");
    	
    	MemberVO member = new MemberVO();
    	CustomUser customUser = null;
    	
    	try {
			/*
			 * return (CustomUser)jdbcTemplate.queryForObject(
			 * "SELECT * FROM member WHERE member_id=?", new String[]{ memberId }, new
			 * BeanPropertyRowMapper<CustomUser>(CustomUser.class));
			 */
    		member = (MemberVO)jdbcTemplate.queryForObject(
	    			 "SELECT * FROM member WHERE member_id=?", 
				     new String[]{ memberId },
				     new BeanPropertyRowMapper<MemberVO>(MemberVO.class));
    		log.info(" 로그인 정보 : " + member);
    		customUser = new CustomUser(member);
    		
	    } catch (EmptyResultDataAccessException e) {
	    	
	    	log.error(" 회원정보가 없습니다. ");
	    }
    	return customUser;
    }
	
	private RoleVO loadUserRole(String userName) {
		
		log.info(" loadUserRole ");
    	
		try {
			return (RoleVO)jdbcTemplate.queryForObject(
	   			 	"SELECT member_id, role FROM member_roles WHERE member_id=?", 
				     new Object[]{ userName },
				     new BeanPropertyRowMapper<RoleVO>(RoleVO.class));
			
		} catch (EmptyResultDataAccessException e) {
			
			log.error(" 회원 ROLE 정보가 없습니다. ");
			
	    	return null;
	    }
	}
	
	@Override
	public Authentication authenticate(Authentication authentication) 
				throws AuthenticationException {
		
		log.info(" authenticate ");
		
		String username = authentication.getName();
        String password = (String) authentication.getCredentials();

        CustomUser user = null;
        Collection<? extends GrantedAuthority> authorities = null;
        
        try {
	        	user = this.loadUserByUsername(username);
	        	if (user==null) 
	        		throw new BadCredentialsException("아이디가 존재하지 않습니다.");
	        	
	            RoleVO role = this.loadUserRole(username);
	            if (role==null)
	            	throw new BadCredentialsException("회원 ROLE 정보가 존재하지 않습니다.");
	            
	            List<RoleVO> roles = new ArrayList<RoleVO>();
	            roles.add(role);		
	            user.setAuthorities(roles);
	            
	            BCryptPasswordEncoder passwordEncoder 
					= new BCryptPasswordEncoder();
	            
	            if (passwordEncoder.matches(password, user.getPassword())) 
	            	
	            	log.info(" 비밀번호 일치 ! ");
	            
	            else 
	            	throw new BadCredentialsException("비밀번호가 일치하지 않습니다.");
	            
	            authorities = user.getAuthorities();
            
        } catch(UsernameNotFoundException e) {
            log.error(e.toString());
            throw new UsernameNotFoundException(e.getMessage());
        } catch(BadCredentialsException e) {
            log.error(e.toString());
            throw new BadCredentialsException(e.getMessage());
        } catch(Exception e) {
            log.error(e.toString());
            e.printStackTrace();
        }
        return new UsernamePasswordAuthenticationToken(user, password, authorities);
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}
}