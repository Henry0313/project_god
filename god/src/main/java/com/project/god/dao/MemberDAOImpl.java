package com.project.god.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.god.domain.MemberVO;
import com.project.god.domain.RoleVO;
import com.project.god.domain.SearchMemberVO;

import lombok.extern.slf4j.Slf4j;

/**
 * Member DAOImpl
 * 회원관리 DAO 구현 클래스
 * 
 * @author god
 *
 */

@Repository
@Slf4j
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;
 
	// 회원 가입 : 회원정보
	@Override
	public void insertMember(MemberVO memberVO) throws Exception {
		
		log.info(" dao insertMember ");
		sqlSession.insert("mapper.Member.insertMember", memberVO);
	}
	// 회원 가입 : 회원등급
	@Override
	public void insertRole(RoleVO roleVO) throws Exception {
		
		log.info(" dao insertRole ");
		sqlSession.insert("mapper.Member.insertRole", roleVO);
	}
	
	// 전체 회원정보 조회
	@Override
	public List<MemberVO> getAllMembers() {
		
		log.info(" dao getAllMembers ");
		return sqlSession.selectList("mapper.Member.getAllMembers");
	}

	// 개별 회원정보 조회
	@Override
	public MemberVO getMember(String memberId) {
		
		log.info(" dao getMember ");
		return sqlSession.selectOne("mapper.Member.getMember", memberId);
	}

	// 주어진 SQL에 적용되는 행의 수
	@Override
	public int getRowCount(String sql) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	// 회원 아이디 중복 점검
	@Override
	public boolean isMember(String memberId) throws Exception {
		
		log.info(" dao isMember ");		  
		return (int)sqlSession.selectOne("mapper.Member.isMember", memberId)==1 ? true:false;
	}

	// 이메일 중복 점검
	@Override
	public boolean isEnableEmail(String email) throws Exception {
		
		log.info(" dao isEnableEmail ");
		return (int)sqlSession.selectOne("mapper.Member.isEnableEmailByEmail", email)==1? true:false;
	}
	
	// 이메일 중복 점검 2
	@Override
	public boolean isEnableEmail(String id, String email) throws Exception {
		
		log.info(" dao isEnableEmail ");
		MemberVO memberVO = new MemberVO();
		memberVO.setMemberId(id);
		memberVO.setMemberEmail(email);
		
		log.info(" memberVO :" + memberVO);
		
		return ((int)sqlSession.selectOne("mapper.Member.isEnableEmailByIdAndEmail", memberVO))==0 ? true:false;
	}

	// 핸드폰 번호 중복 점검
	@Override
	public boolean isEnableCellphone(String cellphone) throws Exception {
		
		log.info(" dao isEnableCellphone ");
		return (int)sqlSession.selectOne("mapper.Member.isEnableCellphone", cellphone)==1? true:false;	
	}

	// 핸드폰 번호 중복 점검 2
	@Override
	public boolean isEnableCellphone(String id, String cellphone) throws Exception {
		
		log.info(" dao isEnableCellphone ");
		MemberVO memberVO = new MemberVO();
		memberVO.setMemberId(id);
		memberVO.setMemberCellphone(cellphone);
		
		return ((int)sqlSession.selectOne("mapper.Member.isEnableCellphoneByIdAndCellphone", memberVO))==0? true:false;	
	}

	// 회원 정보 수정
	@Override
	public void updateMember(MemberVO memberVO) throws Exception {
		
		log.info(" dao updateMember ");
		sqlSession.update("mapper.Member.updateMember", memberVO);
		
	}

	// 회원 정보 삭제
	@Override
	public void deleteMember(String memberId) throws Exception {
		log.info(" dao deleteMember ");
		sqlSession.delete("mapper.Member.deleteMember", memberId);
	}

	// 회원 등급 정보 삭제
	@Override
	public void deleteMemberRole(String memberId) throws Exception {
		
		log.info(" dao deleteMemberRole ");
		sqlSession.delete("mapper.Member.deleteMember_role", memberId);
	}

	// 회원 아이디 찾기( 이름, 이메일, 전화번호로 찾기)
	@Override
	public MemberVO getMemberIdByInfo(String name, String searchField, String searchValue) throws Exception {
		log.info(" dao getMemberIdByInfo ");
		
		SearchMemberVO searchMemberVO = new SearchMemberVO();
		searchMemberVO.setMemberName(name);
		searchMemberVO.setSearchValue(searchValue);
		searchMemberVO.setSearchField(searchField);
		
		return sqlSession.selectOne("mapper.Member.getMemberIdByInfo", searchMemberVO);
	}

	// 회원 패쓰워드 찾기 (아이디, 이름, 이메일, 전화번호로 찾기)
	@Override
	public MemberVO getMemberPwByInfo(String id, String name, String searchField, String searchValue) throws Exception {
		
		log.info(" dao getMemberPwByInfo ");
		
		SearchMemberVO searchMemberVO = new SearchMemberVO();
		
		searchMemberVO.setMemberId(id);
		searchMemberVO.setMemberName(name);
		searchMemberVO.setSearchValue(searchValue);
		searchMemberVO.setSearchField(searchField);
		
		return sqlSession.selectOne("mapper.Member.getMemberPwByInfo", searchMemberVO);
	}

	@Override
	public void pwUpdate(MemberVO memberVO) throws Exception {
		log.info("memberDAO.pwUpdate");
		sqlSession.update("mapper.Member.pwUpdate", memberVO);
	}

}
