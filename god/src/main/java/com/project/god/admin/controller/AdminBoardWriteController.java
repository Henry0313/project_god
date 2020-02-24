package com.project.god.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.god.domain.FaqDTO;
import com.project.god.domain.FaqVO;
import com.project.god.service.FaqService;

import lombok.extern.slf4j.Slf4j;

/**
 * 관리자 FAQ 게시판 글쓰기 컨트롤러
 * 
 * @author god
 *
 */

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminBoardWriteController {
	
	@Autowired
	private FaqService faqService;
	
	// 게시글 작성화면
	@RequestMapping(value="/admin_board_write.do", method={RequestMethod.GET, RequestMethod.POST})
	public String boardWrite() {
		
		log.info(" FAQ 게시판 글쓰기 ");
		
		return "/admin/admin_board_write";
	}
	
	// 게시글 작성처리
	@RequestMapping(value="/write_faq_proc_rest.do", method=RequestMethod.POST,
					produces="text/plain; charset=UTF-8")
	@ResponseBody
	public String writeFaqProcRest(@ModelAttribute("faqDTO") FaqDTO faqDTO) {
		
		log.info(" writeFaqProcRest ");
		
		// 글쓰기 성공여부 플래그 추가
		boolean flag = false;
		
		String msg = "";
		
		// 추가 : 신규 faqId 값 구하기 (sequence)
		int faqId = 0;
		faqId = faqService.getFaqNumByLastSeq();
		
		log.info(" 시퀀스 게시글 번호 : " + faqId);
		
		// 저장 VO 생성
		FaqVO faqVO = new FaqVO(faqDTO);
		
		faqVO.setFaqId(faqId);
		log.info(" faqVO : {}", faqVO);
		
		flag = faqService.writeFaq(faqVO);
		
		if (flag == false) {
			msg += "글쓰기에 성공하였습니다.";
		} else {
			msg += "글쓰기에 실패하였습니다.";
		}
		
		return msg;
	}
	
	@RequestMapping(value="/write_faq_proc.do", method=RequestMethod.POST,
					produces="text/plain; charset=UTF-8")
	public String writeFaqProc(@ModelAttribute("faqDTO") FaqDTO faqDTO) {
		
		log.info(" writeFaqProc ");
		
		int faqId = 0;
		
		// 추가 : 신규 faqId 값 구하기 (sequence)
		faqId = faqService.getFaqNumByLastSeq();
		
		log.info(" 시퀀스 게시글 번호 : " + faqId);
		
		FaqVO faqVO = new FaqVO(faqDTO);
		
		faqVO.setFaqId(faqId);
		log.info(" faqVO : {}", faqVO);
		
		faqService.writeFaq(faqVO);
		
		return "redirect:/admin/admin_board_faq.do/1";
	}

}
