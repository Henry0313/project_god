package com.project.god.util;

import static org.junit.Assert.assertEquals;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;


import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { 
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
		"file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@WebAppConfiguration
@Slf4j
public class BoardNameMatchingTest {
	
	@Autowired
	private BoardNameMatchingUtil boardNameMatchingUtil;
	
	@Test
	public void test() {
		
		log.info("BoardNameMatchingUtil");
		//assertEquals("qna_product", boardNameMatchingUtil.getTableNameByBoardName("상품 문의"));
		
		assertEquals("ftsjdq", boardNameMatchingUtil.getTableNameByBoardName("FAQ"));
		
	}

}
