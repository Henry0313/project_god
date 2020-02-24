package com.project.god.domain;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetails;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * CustomUser
 * 
 * @author god
 *
 */

@Getter
@Setter
@ToString
@NoArgsConstructor
public class CustomUser implements UserDetails {

	/** 직렬화 (implements Serializable)를 할 때 사용 */
	private static final long serialVersionUID = 1L;
	
	/** 회원 아이디 */
	private String username;
	
	/** 회원 패스워드 */
    private String password;
 
    /* Spring Security related fields */
    private List<RoleVO> authorities;
    private boolean accountNonExpired = true;
    private boolean accountNonLocked = true;
    private boolean credentialsNonExpired = true;
    private boolean enabled = true;
	
    public CustomUser(MemberVO member) {
		this.username = member.getMemberId();
		this.password = member.getMemberPw();
		this.enabled = member.getEnabled()==1 ?  true : false;
	}
   
}
