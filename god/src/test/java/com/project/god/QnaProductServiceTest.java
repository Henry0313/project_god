/**
 * 
 */
package com.project.god;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.project.god.domain.QnaProductVO;
import com.project.god.service.QnaProductService;

import lombok.extern.slf4j.Slf4j;

/**
 * FAQ 게시판 테스트
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
public class QnaProductServiceTest {

	@Autowired
	private QnaProductService qnaProductService;
	
	private QnaProductVO qnaProductVO;
	
	/**
	 * @throws java.lang.Exception
	 */
	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void test() throws Exception {
		
		log.debug("qnaProductService Test");
		
		qnaProductService.getQnaProduct(45);
		// assert
	}

}
