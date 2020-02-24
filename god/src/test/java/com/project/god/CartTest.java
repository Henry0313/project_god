/**
 * 
 */
package com.project.god;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.project.god.domain.CartListVO;
import com.project.god.domain.CartVO;
import com.project.god.domain.FaqVO;
import com.project.god.service.FaqService;

import lombok.extern.slf4j.Slf4j;

/**
 * cart Test
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
public class CartTest {

	@Autowired
	private SqlSession sqlSession;
	
	private CartVO cartVO;
	
	/**
	 * @throws java.lang.Exception
	 */
	@Before
	public void setUp() throws Exception {
		
		cartVO = new CartVO();
		cartVO.setMemberId("admin_user");
		cartVO.setProductId(62);
		cartVO.setCartDate(Date.valueOf("2020-02-19"));
		cartVO.setCartColor("red");
		cartVO.setCartSize("95");
	}

	@Test
	public void test() throws Exception {
		log.debug("cart Test");
		List<CartListVO> cartListVOs = sqlSession.selectList("com.project.god.mapper.CartMapper.getCart2", cartVO);
		
		// log.info("cartListVO : "+cartListVOs.get(0));
	}

}
