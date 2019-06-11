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
@RequestMapping("reply/")
@Controller
public class ReplyController {
	
	@Inject
	private ReplyService service;
	
	//ajax식일때는 ResponsBody를 붙이지 않는다.
		@RequestMapping(value="/list", method=RequestMethod.GET)
		public String list(int bno, Model model) {
			log.info("댓글목록 출력");
			List<ReplyDTO> list = service.list(bno);
			model.addAttribute("replyList", list);
			
			return "board/commentlist";
		}
}
