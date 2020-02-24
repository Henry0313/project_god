/**
 * 
 */
package com.project.god;

import static org.junit.Assert.*;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.NavigableSet;
import java.util.TreeSet;

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
import com.project.god.service.CartService;
import com.project.god.service.FaqService;

import lombok.extern.slf4j.Slf4j;

/**
 * 카트 서비스 테스트
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
public class CartServiceTest {

	@Autowired
	private CartService cartService;
	
	private CartVO cartVO;
	
	private List<CartListVO> cartVOList;
	
	private NavigableSet<CartVO> carts;
	
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
		carts = new TreeSet<>();
		carts.add(cartVO);
	}

	@Test
	public void test() throws Exception {
		log.debug("cartService Test");
		cartVOList = cartService.cartList("admin_user", carts);
		// assertEquals(69, cartVOList.get(0).getCartId());
		// log.info("####### cartVOList:"+cartVOList.get(0));
		
	}

}
