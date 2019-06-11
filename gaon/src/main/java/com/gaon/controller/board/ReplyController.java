package com.gaon.controller.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gaon.domain.board.ReplyDTO;
import com.gaon.service.board.ReplyService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("reply/*")
public class ReplyController {
	
	// ReplyService를 스프링이 관리(IOC)하기 때문에 Inject해서 쓸 수 있음
	@Inject
	private ReplyService service;
	
	// @ResponseBody : Ajax지만 이 경우에는 붙이지 않는다.(데이터로 인식해서 데이터값이 가기 때문)
	// 페이지로 이동 후 나온 결과물을 뿌리게 만들어야 함
	@RequestMapping(value="list", method=RequestMethod.GET)
	public String listAll(int bno, Model model) {
		log.info(">>>>> 댓글 목록 출력");
		List<ReplyDTO> list = service.list(bno);
		model.addAttribute("replyList", list);
		return "board/commentlist";
	}
}
