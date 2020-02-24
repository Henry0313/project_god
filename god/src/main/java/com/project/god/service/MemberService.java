package com.project.god.service;

import java.util.List;

import com.project.god.domain.MemberVO;
import com.project.god.domain.RoleVO;

/**
 * Member Service
 * 회원 관리 서비스
 * 
 * @author god
 *
 */

public interface MemberService {

	/**
     * 회원정보 레코드(튜플) 삽입(create)
     *
     * @param memberVO 회원정보
     * @param roleVO 회원 롤 정보
     * @return 저장 오류 메시지
     * @throws Exception 예외처리
     * 
     */
    boolean insertMember(MemberVO memberVO, RoleVO roleVO) throws Exception;
    
    /**
     * 전체 회원정보  레코드(튜플) 조회(read)
     *
     * @return 전체 회원정보
     * @throws Exception 예외처리
     * 
     */
    List<MemberVO> getAllMembers() throws Exception;
    
    /**
     * 개별 회원정보 레코드(튜플) 조회(read)
     *
     * @param memberId 회원 아이디
     * @return 회원정보
     * 
     */
    MemberVO getMember(String memberId);
    
    /**
	 * 주어진 SQL(DQL)에 적용되는 행(row)의 수
	 *  
	 * @param sql SQL구문
	 * @return 적용 행(row) 수
	 * @throws Exception 예외처리
	 * 
	 */
	int getRowCount(String sql) throws Exception;
	
	/**
	 * 주어진 회원 아이디의 회원정보가 있는지 점검
	 * 
	 * usage) 아이디 중복 점검 등에서 사용
	 * 
	 * @param memberId 회원 아이디
	 * @return 회원 존재 여부 
	 * @throws Exception 예외처리
	 * 
	 */
	boolean isMember(String memberId) throws Exception;
	
	/**
	 * 이메일을 타 회원들과 중복하지 않고 사용가능한지 여부 점검
	 * 
	 * usage) 회원 가입 이메일 중복 점검
	 * 
	 * @param email 이메일
	 * @return 이메일 사용가능 여부
	 * @throws Exception 예외처리
	 * 
	 */
	boolean isEnableEmail(String email) throws Exception;
	
	/**
	 * 이메일을 타 회원들과 중복하지 않고 사용가능한지 여부 점검 (아이디, 이메일 이용), 회원 수정용
	 * 
	 * usage) 회원 가입 이메일 중복 점검
	 * 
	 * @param id 회원 아이디
	 * @param email 이메일
	 * @return 이메일 사용가능 여부 : true=사용가능, false=사용불가 
	 * @throws Exception 예외처리
	 * 
	 */
	boolean isEnableEmail(String id, String email) throws Exception;
	
    
	/**
	 * 연락처가 타 회원들과 중복하지 않고 사용가능한지 여부 점검
	 * 
	 * usage) 회원 가입 핸드폰 연락처 중복 점검
	 * 
	 * @param cellphone 핸드폰연락처
	 * @return 연락처 사용가능 여부
	 * @throws Exception 예외처리
	 */
	boolean isEnableCellphone(String cellphone) throws Exception;
	
	/**
	 * 연락처가 타 회원들과 중복하지 않고 사용가능한지 여부 점검(아이디, 휴대폰), 회원 수정용
	 * 
	 * usage) 회원 가입 핸드폰 연락처 중복 점검
	 * 
	 * @param id 회원아이디
	 * @param cellphone 핸드폰연락처
	 * @return 연락처 사용가능 여부 : true=사용가능, false=사용불가
	 * @throws Exception 예외처리
	 */
	boolean isEnableCellphone(String id, String cellphone) throws Exception;
	
	/**
	 * 개별 회원정보 레코드(튜플)수정(갱신)(update)
	 * 
	 * @param memberVO 회원정보
	 * @return 저장 오류 메시지
	 * @throws Exception 예외처리
	 */
	boolean updateMember(MemberVO memberVO) throws Exception;
	
	/**
	 * 개별 회원 및 회원 롤정보 삭제
	 * 
	 * @param memberId 회원 아이디
	 * @return 저장 오류 메시지
	 * @throws Exception 예외처리
	 */
	boolean deleteMember(String memberId) throws Exception;
	
	/**
	 * 회원 아이디 찾기 (이름, 이메일 또는 전화번호로 찾기)
	 * 
	 * @param name 회원 이름
	 * @param searchField 검색 필드 (이메일 또는 전화번호)
	 * @param searchValue 검색값 (이메일 또는 전화번호 값)
	 * @return 회원정보 (아이디, 가입일)
	 * @throws Exception 예외처리
	 */
	MemberVO getMemberIdByInfo(String name, String searchField, String searchValue) throws Exception;
	
	/**
	 * 회원 패쓰워드 찾기 (아이디, 이름, 이메일 또는 전화번호로 찾기)
	 * 
	 * @param id 회원 아이디
	 * @param name 회원 이름
	 * @param searchField 검색필드 (이메일 또는 전화번호)
	 * @param searchValue 검색값 (이메일 또는 전화번호 값)
	 * @return 저장 오류 메시지
	 * @throws Exception 예외처리
	 */
	MemberVO getMemberPwByInfo(String id, String name, String searchField, String searchValue) throws Exception;
	
	/**
	 * 패쓰워드 찾기 성공 후 (아이디, 패쓰워드)
	 * 
	 * @param memberVO 회원정보
	 * @throws Exception 예외처리
	 */
	public void pwUpdate(MemberVO memberVO)throws Exception;
}
