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
public class MemberServiceTest4 {

	@Autowired
	private MemberService memberService;
	
	private String cellphone;
	
	/**
	 * @throws java.lang.Exception
	 */
	@Before
	public void setUp() throws Exception {
		cellphone="010-1234-1234";
	}

	@Test
	public void test() throws Exception {
		
		log.debug("isEnableCellphone Test");

		boolean flag = memberService.isEnableCellphone(cellphone);
		assertFalse(flag);
	}

}
