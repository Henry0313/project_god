/**
 * 
 */
package com.project.god;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.project.god.domain.CartVO;
import com.project.god.service.CartService;

import lombok.extern.slf4j.Slf4j;

/**
 * cart mapper 테스트
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
public class CartMapperTest {

	@Autowired
	private CartService cartService;
	
	private CartVO cartVO;
	
	/**
	 * @throws java.lang.Exception
	 */
	@Before
	public void setUp() throws Exception {
		
		cartVO = new CartVO();
		cartVO.setCartId(221);
		cartVO.setCartQuan(6);
		// cartId = 220; // 카트 아이디
		// cartQuan =; // 카트 수량
	}

	@Test
	public void test() throws Exception {
		
		log.debug("cartVO update Test");
		
		// sqlSession.update("com.project.god.mapper.CartMapper.updateCart", cartVO);
		// cartDAO.updateCart(cartVO);
		cartService.updateCart(cartVO);
		
	}

}
