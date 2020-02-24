package com.project.god.domain;

import org.springframework.security.core.GrantedAuthority;

import lombok.Data;

/**
 * Role VO 
 * 회원등급 VO
 * 
 * @author god
 *
 */

@Data
public class RoleVO implements GrantedAuthority {
   
	/** 회원 아이디 */
    private String memberId;
    
    /** 회원 등급 */
    private String role;
   
    @Override
    public String getAuthority() {
      
        return this.role;
    }

}