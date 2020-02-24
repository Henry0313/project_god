package com.project.god.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.god.domain.MemberVO;
import com.project.god.domain.OrderDetailVO;
import com.project.god.domain.OrderVO;
import com.project.god.domain.RoleVO;
import com.project.god.service.MemberService;
import com.project.god.service.OrderService;

import lombok.extern.slf4j.Slf4j;

/**
 * 회원 컨트롤러
 * 
 * @author god
 *
 */

@Controller
@Slf4j
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired OrderService orderService;
	
	// 회원 가입
	@RequestMapping("/join.do")
	public String join() {
		
		log.info(" 회원 가입 ");
		
		return "/member/join";
	}
	
	// 회원 가입 처리
	@RequestMapping("/join_proc.do")
	public String joinProc(MemberVO memberVO, Model model) throws Exception {
		
		log.info(" 회원 가입 처리 ");
		log.info(" foreverCheck : " + memberVO.getForeverCheck());
		log.info(" 회원정보인자 : " + memberVO);
		String msg="";
		
		// 가용 회원 여부 체크
		memberVO.setEnabled(1);
		
		// 회원등급 체크
		memberVO.setMemberClass("silver");
		
		// 탈퇴여부 체크
		memberVO.setMemberUseYn("Y");
		
		// String a = memberVO.getSmsCheck().equals("on") ?  "Y" : "N" ;
		// memberVO.setSmsCheck(a);
		
		// sms 동의체크
		if (memberVO.getSmsCheck() != null) { // 동의할 경우
			memberVO.setSmsCheck("Y"); // Y로 치환
		} else { // 동의 안할 경우
			memberVO.setSmsCheck("N"); // N으로 치환
		}
		
		// email 동의체크
		if (memberVO.getEmailCheck() != null) { // 동의할 경우
			memberVO.setEmailCheck("Y"); // Y로 치환
		} else { // 동의 안할 경우
			memberVO.setEmailCheck("N"); // N으로 치환
		}
		
		// 롤정보 생성
		RoleVO roleVO = new RoleVO();
		roleVO.setMemberId(memberVO.getMemberId());
		roleVO.setRole("ROLE_USER");
		
		// 패스워드 암호화
		BCryptPasswordEncoder passwordEncoder
        = new BCryptPasswordEncoder();
		
		memberVO.setMemberPw(passwordEncoder.encode(memberVO.getMemberPw()));
		
		log.info(" 회원정보인자 : " + memberVO);
		
		if (memberService.insertMember(memberVO, roleVO)==true) {
			msg="회원가입에 성공했습니다.";
		} else {
			msg="회원가입에 실패했습니다.";
		}
		
		model.addAttribute("msg", msg);
		
		return "/member/login";
	}
	
	// 아이디 중복점검
	@RequestMapping(value="/id_check.do", method= {RequestMethod.POST, RequestMethod.GET}, 
					produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String idCheck(@RequestParam("memberId") String memberId) throws Exception {
		
		log.info(" 아이디 중복점검 ");
		log.info(" 아이디 : " + memberId);
		
		String msg = "";
		
		if (memberService.isMember(memberId)==false) {
			msg="사용할 수 있는 아이디입니다.";
		} else {
			msg="중복된 아이디입니다.";
		}
		log.info(" msg : " + msg);
		
		return msg;
	}
	
	// 이메일 중복점검
	@RequestMapping(value="/email_check.do", method= {RequestMethod.POST, RequestMethod.GET}, 
					produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String emailCheck(@RequestParam("memberEmail") String memberEmail) throws Exception {
		
		log.info(" 이메일 중복점검 ");
		
		log.info(" 이메일 : " + memberEmail);
		
		String msg = "";
		
		if (memberService.isEnableEmail(memberEmail)==false) {
			msg="사용할 수 있는 이메일입니다.";
		} else {
			msg="중복된 이메일입니다.";
		}
		log.info(" msg : " + msg);
		
		return msg;
	}
	
	// 연락처 중복점검
	@RequestMapping(value="/cellphone_check.do", method= {RequestMethod.POST, RequestMethod.GET}, 
			produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String cellphoneCheck(@RequestParam("memberCellphone") String memberCellphone) throws Exception {
		
		log.info(" 연락처 중복점검 ");
		log.info(" 연락처 : " + memberCellphone);
		
		String msg = "";
		
		if (memberService.isEnableCellphone(memberCellphone)==false) {
			msg="사용할 수 있는 번호입니다.";
		} else {
			msg="중복된 번호입니다.";
		}
		log.info(" msg : " + msg);
		
		return msg;
	}
	
	// 주문 시트
	@RequestMapping("order_sheet.do")
	public String orderSheet(Model model)throws Exception {
		
		log.info(" orderSheet ");
		
		return "/member/order_sheet";
	}
	
	// 회원 주문목록
	@RequestMapping(value = "order_details.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String orderDetails(Model model, String memberId)throws Exception {
		
		log.info(" 회원 주문목록 ");
		
		List<OrderDetailVO> orders = orderService.orderList(memberId);
		List<OrderVO> orderId = orderService.orderListId(memberId);
		
		model.addAttribute("orderId", orderId);
		model.addAttribute("orderVO", orders);
		
		return "/member/order_details";
	}
	
	// 주문상세보기
	@RequestMapping(value = "order_detail_info.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String orderDetailInfo(Model model, String orderId)throws Exception {
		
		log.info(" 주문상세보기 ");
		
		List<OrderDetailVO> orders = orderService.getOrderView(orderId);
		
		model.addAttribute("orderVOs", orders);
		
		return "/member/order_detail_info";
	}
}
