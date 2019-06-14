package com.gaon.controller.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gaon.domain.board.ReplyDTO;
import com.gaon.service.board.ReplyService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("reply/")
@Controller
public class ReplyController {
	
	@Inject
	private ReplyService service;
	
	//ajax이지만 commentlist의 데이터가 바뀌어도 view.jsp는 데이터를 모르기 때문에 ResponsBody를 붙이지 않는다.
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(int bno, Model model) {
		log.info(">>>>> 댓글목록 출력");
		List<ReplyDTO> list = service.list(bno);
		model.addAttribute("replyList", list);
		
		return "board/commentlist";
	}
	
	// 댓글 등록
	@ResponseBody
	@RequestMapping(value="create", method=RequestMethod.POST)
	public void create(ReplyDTO rDto) {
		log.info(">>>>> 댓글등록");
		service.create(rDto);
	}
	
	// 댓글 삭제
	@ResponseBody
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public void delete(ReplyDTO rDto) {
		log.info(">>>>> 댓글삭제");
		log.info(rDto.toString());
		service.delete(rDto);
	}
}
