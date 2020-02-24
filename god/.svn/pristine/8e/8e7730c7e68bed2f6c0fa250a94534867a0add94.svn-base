/**
 * 
 */
package com.project.god;

import java.sql.Date;

import org.apache.ibatis.session.SqlSession;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.project.god.dao.CartDAO;
import com.project.god.domain.CartVO;
import com.project.god.service.CartService;

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
public class CartServiceTest3 {

	@Autowired
	SqlSession sqlSession;
	
	private CartVO cartVO;
	
	@Autowired
	private CartDAO cartDAO;
	
	@Autowired
	private CartService cartService;
	
	
	/**
	 * @throws java.lang.Exception
	 */
	@Before
	public void setUp() throws Exception {
		
		// CartVO(cartId=0, memberId=admin_user, productId=63, cartQuan=1, cartDate=null, cartColor=black, cartSize=95)
		cartVO = new CartVO();
		cartVO.setCartId(0);
		cartVO.setMemberId("admin_user");
		cartVO.setProductId(100);
		cartVO.setCartQuan(1);
		cartVO.setCartDate(new Date(System.currentTimeMillis()));
		cartVO.setCartColor("black");
		cartVO.setCartSize("95");
	}

	@Test
	public void test() throws Exception {
		log.debug("cartService Test");
		// log.info("####### 결과 ########## " +sqlSession.selectOne("com.project.god.mapper.CartMapper.getThisCartId", cartVO));
		// log.info("####### 결과 ########## " +cartService.getThisCartId(cartVO));
		// assertEquals(-1, cartService.getThisCartId(cartVO));
		log.info("###### cartId ###### "+cartDAO.getCurrCartId());
		// assertNotNull("결과 없음", sqlSession.selectOne("com.project.god.mapper.CartMapper.getThisCartId", cartVO));
		// log.info("########## cartId ######### "+sqlSession.selectOne("com.project.god.mapper.CartMapper.getThisCartId", cartVO));
		
	}

}
