/**
 * 
 */
package com.project.god;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
public class MemberServiceTest7 {

	@Autowired
	private MemberService memberService;
	
	private MemberVO memberVO;
	
	private String id;
	private String pw;
	private String name;
	private String zip;
	private String addr;
	private String addrDetail;
	private String phone;
	private String cellPhone;
	private String email;
	private String smsCheck;
	private String emailCheck;
	private String foreverCheck;
	//private String 
	
	/**
	 * @throws java.lang.Exception
	 */
	@Before
	public void setUp() throws Exception {
		
		id="test1234"; // 자신 아이디
		pw="!Qqwer1234";
		name="테스투";
		zip="06362";
		addr="서울 강남구 밤고개로 76-2 (수서동)";
		addrDetail="5555"; 
		email="qwer1234@naver.com"; // 자신 이메일
		phone=null;
		cellPhone="010-2222-3333";
		smsCheck="Y";
		emailCheck="N";
		foreverCheck="N";
		
		//email="qwer123434@naver.com"; // 회원 정보에 없는 이메일
		//email="user56@abcd.com"; // 회원 정보에 타회원 이메일
		
		// 패스워드 암호화
		BCryptPasswordEncoder passwordEncoder
        = new BCryptPasswordEncoder();
				
		
		memberVO = new MemberVO();
		memberVO.setMemberPw(pw);
		memberVO.setMemberPw(passwordEncoder.encode(memberVO.getMemberPw()));
		memberVO.setMemberEmail(email);
		memberVO.setMemberPhone(phone == null? "":phone);
		memberVO.setMemberCellphone(cellPhone);
		memberVO.setMemberZip(zip);
		memberVO.setMemberAddr(addr);
		memberVO.setMemberAddrDetail(addrDetail);
		memberVO.setSmsCheck(smsCheck);
		memberVO.setEmailCheck(emailCheck);
		memberVO.setForeverCheck(foreverCheck);
		memberVO.setMemberId(id);
	}

	@Test
	public void test() throws Exception {
		
		log.debug("updateMember Test");

		boolean flag = memberService.updateMember(memberVO);
		assertTrue(flag);
		
	}

}
