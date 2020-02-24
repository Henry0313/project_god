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
public class CartServiceTest2 {

	@Autowired
	private CartService cartService;
	
	private CartVO cartVO, cartVO2;
	
	private List<CartListVO> cartVOList;
	
	private NavigableSet<CartVO> carts;
	
	/**
	 * @throws java.lang.Exception
	 */
	@Before
	public void setUp() throws Exception {
		
		carts = new TreeSet<>();
		
		cartVO = new CartVO();
		cartVO.setMemberId("admin_user");
		cartVO.setProductId(62);
		cartVO.setCartDate(Date.valueOf("2020-02-19"));
		cartVO.setCartColor("red");
		cartVO.setCartSize("95");
		cartVO.setCartQuan(1);
		carts.add(cartVO);
		
		cartVO2 = new CartVO();
		cartVO2.setMemberId("admin_user");
		cartVO2.setProductId(62);
		cartVO2.setCartDate(Date.valueOf("2020-02-19"));
		cartVO2.setCartColor("red");
		cartVO2.setCartSize("95");
		cartVO2.setCartQuan(2);
		carts.add(cartVO2);
	}

	@Test
	public void test() throws Exception {
		log.debug("cartService Test");
		cartVOList = cartService.cartList("admin_user", carts);
		// assertEquals(3, cartVOList.get(0).getCartQuan());
	}

}
