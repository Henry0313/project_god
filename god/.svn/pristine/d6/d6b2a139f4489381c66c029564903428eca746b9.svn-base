/**
 * 
 */
package com.project.god;

import static org.junit.Assert.*;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.project.god.domain.ProductVO;

import lombok.extern.slf4j.Slf4j;

/**
 * Product Regi 상품등록 테스트
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
public class ProductRegiTest {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	
	private ProductVO productVO;
	
	/**
	 * @throws java.lang.Exception
	 */
	@Before
	public void setUp() throws Exception {
		
	
	}

	@Test
	public void test() throws Exception {
		log.debug("ProductRegi Test");
		
		int flag = sqlSession.selectOne("mapper.Product.regiProduct",productVO);
		
		// assertEquals(, );
		
	}

}
