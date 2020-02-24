package com.project.god.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.project.god.dao.MemberDAO;
import com.project.god.domain.MemberVO;
import com.project.god.domain.RoleVO;
import com.project.god.service.MemberService;

import lombok.extern.slf4j.Slf4j;

/**
 * Member ServiceImpl 
 * 회원관리 서비스 구현 클래스
 * 
 * @author god
 *
 */

@Service
@Slf4j
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;

	@Autowired
	private DataSourceTransactionManager transactionManager;

	// 회원 가입
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public boolean insertMember(MemberVO memberVO, RoleVO roleVO) throws Exception {

		log.info(" MemberService.insertMember ");
		boolean flag = false;

		TransactionStatus txStatus = transactionManager.getTransaction(new DefaultTransactionDefinition());
		
		try {
			memberDAO.insertMember(memberVO);
			memberDAO.insertRole(roleVO);
			transactionManager.commit(txStatus);
			flag = true;
		} catch (Exception e) {
			transactionManager.rollback(txStatus);
			log.error(e.toString());
			flag = false;
		}
		return flag;
	}

	// 회원 리스트 조회
	@Override
	@Transactional(readOnly = true)
	public List<MemberVO> getAllMembers() throws Exception {

		log.info(" MemberService.getAllMembers ");
		
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);

		List<MemberVO> members = null;

		try {
			members = memberDAO.getAllMembers();
			transactionManager.commit(status);

		} catch (Exception e) {
			transactionManager.rollback(status);
			log.error(" MemberService.getAllMembers : " + e.getMessage());
		}
		return members;
	}

	// 개별 회원정보 조회
	@Override
	@Transactional(readOnly = true)
	public MemberVO getMember(String memberId) {

		log.info(" MemberService.getMember ");
		
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);

		MemberVO member = null;

		try {
			member = memberDAO.getMember(memberId);
			transactionManager.commit(status);

		} catch (Exception e) {
			transactionManager.rollback(status);
			log.error("MemberService.getMember : " + e.getMessage());
		}
		return member;
	}

	// 주어진 SQL에 적용되는 행의 수
	@Override
	public int getRowCount(String sql) throws Exception {
		
		log.info(" getRowCount ");
		
		return 0;
	}

	// 아이디 중복점검
	@Override
	@Transactional(readOnly=true)
	public boolean isMember(String memberId) throws Exception {

		log.info(" MemberService.isMember ");
		
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);

		boolean flag = false;

		try {
			flag = memberDAO.isMember(memberId);
			transactionManager.commit(status);

			log.info(" flag : " + flag);
			
		} catch (Exception e) {
			transactionManager.rollback(status);
			log.error(" MemberService.isMember : " + e.getMessage());
		}

		return flag;
	}

	// 이메일 중복 점검
	@Override
	@Transactional(readOnly=true)
	public boolean isEnableEmail(String email) throws Exception {

		log.info(" isMemberEmail ");
		
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);

		boolean flag = false;

		try {
			flag = memberDAO.isEnableEmail(email);
			transactionManager.commit(status);

			log.info(" flag : "+flag);
			
		} catch (Exception e) {
			transactionManager.rollback(status);
			log.error(" MemberService.isEnableEmail : " + e.getMessage());
		}

		return flag;
	}

	// 핸드폰 번호 중복 점검
	@Override
	@Transactional(readOnly=true)
	public boolean isEnableCellphone(String cellphone) throws Exception {

		log.info(" isEnableCellphone ");
		
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);

		boolean flag = false;

		try {
			flag = memberDAO.isEnableCellphone(cellphone);
			transactionManager.commit(status);

			log.info(" flag : "+flag);
			
		} catch (Exception e) {
			transactionManager.rollback(status);
			log.error("MemberService.isEnableCellphone : " + e.getMessage());
		}

		return flag;
	}

	// 이메일 중복 점검
	@Override
	@Transactional(readOnly=true)
	public boolean isEnableEmail(String id, String email) throws Exception {
		
		log.info(" isEnableEmail ");
		
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);

		boolean flag = false;

		try {
			flag = memberDAO.isEnableEmail(id, email);
			transactionManager.commit(status);

			log.info(" flag : " + flag);
			
		} catch (Exception e) {
			transactionManager.rollback(status);
			log.error("MemberService.isEnableEmail : " + e.getMessage());
		}

		return flag;
	}

	// 핸드폰 번호 중복점검
	@Override
	@Transactional(readOnly=true)
	public boolean isEnableCellphone(String id, String cellphone) throws Exception {
		
		log.info(" isEnableCellphone ");
		
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		
		log.info(" 아이디입니다 : " + id);
		log.info(" 휴대폰입니다 : " + cellphone);

		boolean flag = false;

		try {
			flag = memberDAO.isEnableCellphone(id, cellphone);
			transactionManager.commit(status);

			log.info(" flag : " + flag);
			
		} catch (Exception e) {
			transactionManager.rollback(status);
			log.error(" isEnableCellphone : " + e.getMessage());
		}

		return flag;
	}

	// 회원정보 수정
	@Override
	@Transactional(readOnly=true)
	public boolean updateMember(MemberVO memberVO) throws Exception {

		log.info(" updateMember ");
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		
		boolean flag = false;
		try {
			memberDAO.updateMember(memberVO);
			transactionManager.commit(status);
			flag = true;
		} catch (Exception e) {
			transactionManager.rollback(status);
			log.error(e.toString());
			flag = false;
		}
		return flag;
	}

	// 회원 탈퇴
	@Override
	@Transactional(readOnly=true)
	public boolean deleteMember(String memberId) throws Exception {
		log.info(" deleteMember ");
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		
		boolean flag = false;
		try {
			memberDAO.deleteMemberRole(memberId);
			memberDAO.deleteMember(memberId);
			transactionManager.commit(status);
			flag = true;
		} catch (Exception e) {
			transactionManager.rollback(status);
			log.error(e.toString());
			flag = false;
		}
		return flag;
	}

	// 회원 아이디 찾기
	@Override
	@Transactional(readOnly=true)
	public MemberVO getMemberIdByInfo(String name, String searchField, String searchValue) throws Exception {
		
		log.info(" getMemberIdByInfo ");
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		MemberVO member = null;

		try {
			member = memberDAO.getMemberIdByInfo(name, searchField, searchValue);
			transactionManager.commit(status);
		} catch (Exception e) {
			transactionManager.rollback(status);
			log.error("MemberService.getMemberIdByInfo:" + e.getMessage());
		}
		
		return member;
	}
	
	// 회원 패스워드 찾기
	@Override
	@Transactional(readOnly=true)
	public MemberVO getMemberPwByInfo(String id, String name, String searchField, String searchValue) throws Exception {
	
		log.info(" getMemberPwByInfo ");
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		
		MemberVO member = null;
		try {
			member = memberDAO.getMemberPwByInfo(id, name, searchField, searchValue);
			transactionManager.commit(status);
		} catch (Exception e) {
			transactionManager.rollback(status);
			log.error(e.toString());
		}
		return member;
	}

	// 패스워드 찾기 성공 후 (아이디, 패스워드)
	@Override
	public void pwUpdate(MemberVO memberVO) throws Exception {
		
		log.info(" pwUpdate ");
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		
		try {
			memberDAO.pwUpdate(memberVO);
			transactionManager.commit(status);

		} catch (Exception e) {
			transactionManager.rollback(status);
			log.error("OrderService.delivery : " + e.getMessage());
		}
	}
}
