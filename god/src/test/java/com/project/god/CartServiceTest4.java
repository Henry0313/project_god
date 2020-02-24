/**
 * 
 */
package com.project.god;

import java.sql.Date;
import java.util.NavigableSet;
import java.util.TreeSet;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.project.god.dao.CartDAO;
import com.project.god.domain.CartVO;

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
public class CartServiceTest4 {

	@Autowired
	private CartDAO cartDAO;
	
	private CartVO cartVO;
	
	private NavigableSet<CartVO> carts;
	
	/**
	 * @throws java.lang.Exception
	 */
	@Before
	public void setUp() throws Exception {
		
		carts = new TreeSet<>();
		
		cartVO = new CartVO(266, "admin_user", 63, 1, Date.valueOf("2020-02-20"), "black", "95"); carts.add(cartVO);
		cartVO = new CartVO(267, "admin_user", 62, 2, Date.valueOf("2020-02-20"), "red", "95"); carts.add(cartVO);
		cartVO = new CartVO(268, "admin_user", 61, 3, Date.valueOf("2020-02-20"), "red", "100"); carts.add(cartVO);
		cartVO = new CartVO(269, "admin_user", 41, 4, Date.valueOf("2020-02-20"), "red", "100"); carts.add(cartVO);
		cartVO = new CartVO(270, "admin_user", 31, 5, Date.valueOf("2020-02-20"), "black", "95");carts.add(cartVO);
		cartVO = new CartVO(271, "admin_user", 30, 6, Date.valueOf("2020-02-20"), "black", "95");carts.add(cartVO);
		
		/*
		 * for(CartVO c : carts) { // log.info("### c ### : "+c); }
		 */
		 
	}

	@Test
	public void test() throws Exception {
		log.debug("cartService Test");
		
		// cartVOList = cartService.cartList("admin_user", carts);
		for(CartVO c : carts) {
			log.info("###### c ###### : "+cartDAO.getCart2(c));
		}
		// assertEquals(6, cartVOList.size());
	}

}
