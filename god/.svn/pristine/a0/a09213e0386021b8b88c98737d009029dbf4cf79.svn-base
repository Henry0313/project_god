/**
 * 
 */
package com.project.god;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.project.god.service.MemberService;

import lombok.extern.slf4j.Slf4j;

/**
 * 회원 관리 서비스 테스트
 * 
 * @author god
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { 
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
		"file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@WebAppConfiguration
@Slf4j
public class MemberServiceTest6 {

	@Autowired
	private MemberService memberService;
	
	private String id;
	private String email;
	
	/**
	 * @throws java.lang.Exception
	 */
	@Before
	public void setUp() throws Exception {
		
		id="qwer1234"; // 자신 아이디
		email="qwer1234@naver.com"; // 자신 이메일
		//email="qwer123434@naver.com"; // 회원 정보에 없는 이메일
		//email="user56@abcd.com"; // 회원 정보에 타회원 이메일
	}

	@Test
	public void test() throws Exception {
		
		log.debug("isEnableEmail Test");

		boolean flag = memberService.isEnableEmail(id, email);
		assertFalse(flag);
		
	}

}
