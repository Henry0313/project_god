/**
 * 
 */
package com.project.god;

import static org.junit.Assert.*;

import org.apache.ibatis.session.SqlSession;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.project.god.domain.MemberVO;
import com.project.god.domain.SearchMemberVO;

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
public class SearchMapperTest2 {

	@Autowired
	private SqlSession sqlSession;
	
	private MemberVO memberVO;
	
	private SearchMemberVO searchMemberVO;
	
	private String name;
	private String cellPhone;
	private String email;
	private String searchField;
	private String searchValue;
	
	/**
	 * @throws java.lang.Exception
	 */
	@Before
	public void setUp() throws Exception {
		
		name="테스트";
		email="qwer1234@naver.com";
		cellPhone="010-5555-2222";
		//searchField = "memberEmail"; // 검색 대상 필드
		searchField = "memberCellphone"; // 검색 대상 필드 
		
		searchMemberVO = new SearchMemberVO();
		searchMemberVO.setSearchField(searchField);
		searchMemberVO.setMemberName(name);
		searchValue = searchValue.contentEquals("memberEmail")? email:cellPhone;
		searchMemberVO.setSearchValue(email);
	}

	@Test
	public void test() throws Exception {
		
		log.debug("getMemberIdByInfo Test");

		log.info("#### 테스트쪽 이름:"+name);
		log.info("#### 테스트쪽 이메일:"+email);
		
		memberVO = sqlSession.selectOne("mapper.Member.getMemberIdByInfo", searchMemberVO);
		assertEquals("qwer1234", memberVO.getMemberId());
		//assertEquals("qwer12345", memberVO.getMemberId());
	}

}
