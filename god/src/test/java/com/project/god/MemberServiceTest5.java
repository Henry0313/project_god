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

import com.project.god.domain.MemberVO;
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
public class MemberServiceTest5 {
	
	@Autowired
	private MemberService memberService;
	
	private MemberVO memberVO;
	
	private String id;
	private String cellphone;
	
	/**
	 * @throws java.lang.Exception
	 */
	@Before
	public void setUp() throws Exception {
		
		id="qwer1234"; // 자신 아이디
		//cellphone="011-4344-5454"; // 자신 휴대폰
		//cellphone="010-1004-8282"; // 회원 정보에 없는 휴대폰
		cellphone="010-1234-1056"; // 회원 정보에 타회원 휴대폰
		
		memberVO = new MemberVO();
		memberVO.setMemberId(id);
		memberVO.setMemberCellphone(cellphone);
	}

	@Test
	public void test() throws Exception {
		
		log.debug("isEnablcellphone Test");
		log.info("#### memberVO :"+memberVO);
		/*
		 * boolean flag =
		 * ((int)sqlSession.selectOne("mapper.Member.isEnableCellphoneByIdAndCellphone",
		 * memberVO))==0 ? true:false;
		 * 
		 * assertFalse(flag);
		 */

		 boolean flag = memberService.isEnableCellphone(id, cellphone); 
		 assertFalse(flag);
		
	}

}
