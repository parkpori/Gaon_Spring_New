package com.gaon.controller.board;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gaon.domain.board.BoardDTO;
import com.gaon.service.board.BoardService;
import com.gaon.service.board.Pager;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("board/*")
public class BoardController {
	
	@Inject
	private BoardService service;
	
	// 게시글 전체리스트 출력
	@RequestMapping(value="list", method=RequestMethod.GET)
	public ModelAndView list( // 외부에서 출력한 데이터들(form, 쿼리 등) 가져옴
			// defaultValue: null값일 때 대신 들어가는 데이터
			@RequestParam(defaultValue="new") String sort_option,
			@RequestParam(defaultValue="all") String search_option,
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(defaultValue="1") int curPage ) {
		log.info(">>>>> 게시글목록 출력");
		
		// 레코드 갯수 계산
		int count = service.countArticle(search_option,keyword);
		
		//페이지 관련 설정
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		// 페이지에 출력할 게시글 목록
		List<BoardDTO> list = service.listAll(sort_option, search_option, keyword, start, end);
		
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", count);
		map.put("pager", pager);
		map.put("sort_option", sort_option);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		
		mav.setViewName("board/list");
		mav.addObject("map", map);
		
		// model.addAttribute("map", map);
		// return "board/list";
		
		return mav;
	}
	
	//게시글 1건(상세게시글) 출력
	@RequestMapping(value="view", method=RequestMethod.GET)
	public String view(int bno, Model model, HttpSession session) {
		log.info("상세 게시글 출력");
		//조회수 증가처리
		service.increaseViewCnt(bno, session);
		
		BoardDTO bDto = service.read(bno);
		model.addAttribute("one", bDto); 
		return "board/view";
	}
	
	// 게시글 등록 페이지 출력
	@RequestMapping(value="create", method=RequestMethod.GET)
	public String createView() {
		log.info(">>>>> 게시글 등록 페이지 출력");
		
		return "board/register";
	}
	@RequestMapping(value="create", method=RequestMethod.POST)
	public String createPlay(BoardDTO bDto) {
		log.info(">>>>> 게시글 등록 액션!");
		service.createPlay(bDto);
		return "redirect:view?bno=" + bDto.getBno();
	}
	
	@RequestMapping(value="update", method=RequestMethod.GET)
	public String updateView(int bno, Model model) {
		log.info(">>>>> 게시글 수정 페이지 출력");
		BoardDTO bDto = service.read(bno);
		model.addAttribute("one", bDto);
		return "board/update";
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String updatePlay(BoardDTO bDto, Model model) {
		log.info(">>>>> 게시글 수정 액션!");
		service.update(bDto);
		return "redirect:view?bno=" + bDto.getBno();
	}
	
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(int bno) {
		log.info(">>>>> 게시글 삭제 액션!");
		service.delete(bno);
		return "redirect:list";
	}
	
	@ResponseBody
	@RequestMapping(value="goodCheck", method=RequestMethod.POST)
	public int goodCheck(int bno, String id) {
		log.info(">>>>> 좋아요 체크");
		int data = service.goodCheck(bno, id);
		return data;
	}
	
	
	@ResponseBody
	@RequestMapping(value="goodCnt", method=RequestMethod.POST)
	public void goodCnt(int bno, String id) {
		log.info(">>>>> 좋아요 증가, 감소");
		service.goodCnt(bno, id);
	}
	
	@ResponseBody
	@RequestMapping(value="goodTotal", method=RequestMethod.POST)
	public int goodTotal(int bno, String id) {
		log.info(">>>>> 좋아요 총 개수 출력");
		int goodTotal = service.goodTotal(bno, id);
		return goodTotal;
	}
	
	// 답글 등록 페이지 출력
	@RequestMapping(value="answer", method=RequestMethod.GET)
	public String answer(int bno, Model model) {
		log.info(">>>>> 답글 등록 페이지 출력");
		// 답글을 달려고 하는 게시글 내용
		BoardDTO bDto = service.read(bno);
		bDto.setContent(bDto.getContent()
						+ "<br><br>------------------------------------------------------- 게시물 답글 -------------------------------------------------------<br><br><br>");
		model.addAttribute("one", bDto);
		return "board/answer";
	}
	
	// 답글 등록 Action
	@RequestMapping(value="answer", method=RequestMethod.POST)
	public String answerPlay(BoardDTO bDto, HttpSession session) {
		log.info(">>>>> 답글 등록 Play");
		String writer = (String)session.getAttribute("userid");
		bDto.setWriter(writer);
		
		// 기존게시글의 ref, re_step, re_level 가져오기
		BoardDTO one = service.read(bDto.getBno());
		log.info("기존 게시글 정보 =================");
		log.info(one.toString());
		log.info("==============================");
		bDto.setRef(one.getRef());
		bDto.setRe_step(one.getRe_step());
		bDto.setRe_level(one.getRe_level());
		
		// DB등록
		service.answer(bDto);
		return "redirect:list";
	}
}
