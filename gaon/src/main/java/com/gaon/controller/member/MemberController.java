package com.gaon.controller.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gaon.domain.member.MemberDTO;
import com.gaon.service.member.MemberService;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
@RequestMapping(value="member/*") // member/안에 있는 모든 경로
public class MemberController {
	
	@Inject
	private MemberService service;
	
	@ResponseBody // AJAX는 거의 붙임(return값을 돌아가는 주소가 아닌 데이터로 보낸다는 의미), 나를 호출했던 곳으로 다시 감
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String login(MemberDTO mDto, HttpSession session) {
		log.info(">>>>> AJAX : 로그인");
		boolean result = service.login(mDto, session);
		// 서비스는 받아온 값들로 실행만 함!(비즈니스로직, 핵심기능)
		// 컨트롤러, DAO에서 데이터 값을 다 받아오고 보내주어야 함
		String flag = "-1";
		if (result) {
			flag = "1";
		}
		return flag;
	}
	
	@ResponseBody // AJAX는 거의 붙임(return값을 돌아가는 주소가 아닌 데이터로 보낸다는 의미), 나를 호출했던 곳으로 다시 감
	@RequestMapping(value="/logout", method = RequestMethod.POST)
	public void logout(HttpSession session) {
		log.info(">>>>> AJAX : 로그아웃");
		service.logout(session);
	}
	
	@RequestMapping(value="/constract", method = RequestMethod.GET)
	public String constract() {
		log.info(">>>>> 회원가입 동의");
		return "member/constract";
		// 나가는 경로는 데이터반환타입과 같음(String이면 viewResolver => /WEB-INF/views/main.jsp)
	}
	
	@ResponseBody
	@RequestMapping(value="/idcheck", method = RequestMethod.POST)
	public int idcheck(String id) {
		log.info("AJAX : ID 중복 체크");
		return service.idCheck(id);
	}
	
	// 회원가입 페이지 출력
	@RequestMapping(value="/create", method = RequestMethod.GET)
	public String createView() {
		log.info(">>>>> 회원가입 페이지 출력");
		return "member/member";
		// 출력만 하는 것은 액션을 안 타도 됨!!(컨트롤러만 타고 view로 바로 이동)
	}
	
	// DB를 통한 회원가입 액션
	@RequestMapping(value="/create", method = RequestMethod.POST)
	public String createPlay(MemberDTO mDto, RedirectAttributes rttr) {
		// MemberDTO로 데이터들을 한번에 받을 수 있음
		// But 데이터들의 name이 DTO의 변수명과 같아야 함
		// RedirectAttributes : 단발성으로 1번만 데이터 전송(referer에서 nologin했을 때 모달창 띄우는 법)
		log.info(">>>>> DB를 통한 회원가입 액션");
		log.info(mDto.toString());
		
		int result = service.create(mDto);
		if (result > 0) {
			log.info("가입성공!");
			// rttr.addFlashAttribute("message", "1회성 데이터:)");
			return "redirect:/"; // 값이 변경이 되면 redirect를 적어줌
		} else {
			log.info("가입실패ㅠ");
			return "member/constract";
		}
	}
	
	@RequestMapping(value="/update", method = RequestMethod.GET)
	public String updateView(HttpSession session, Model model) {
		log.info(">>>>> 회원수정 페이지 출력");
		MemberDTO mDto = service.viewMember(session);
		log.info(mDto.toString());
		model.addAttribute("one", mDto);
		return "member/infoupdate";
	}
	
	@RequestMapping(value="/update", method = RequestMethod.POST)
	public String updatePlay(MemberDTO mDto, HttpSession session) {
		log.info(">>>>> 회원정보 수정 액션");
		log.info(mDto.toString());
		service.updateMember(mDto, session);
		return "redirect:/";
	}
	
	@RequestMapping(value="/pwupdate", method = RequestMethod.GET)
	public String pwUpdateView() {
		log.info(">>>>> 비밀번호 수정 페이지 출력");
		return "member/pwupdate";
	}
	
	@RequestMapping(value="/pwupdate", method = RequestMethod.POST)
	public String pwUpdatePlay(MemberDTO mDto) {
		log.info(">>>>> 비밀번호 수정 액션");
		service.pwUpdate(mDto);
		return "redirect:/"; // DB의 데이터가 바뀜 -> redirect
	}
	
	@ResponseBody
	@RequestMapping(value="/pwcheck", method = RequestMethod.POST)
	public String pwCheck(MemberDTO mDto) {
		log.info(">>>>> AJAX : 현재 비밀번호 체크");
		// id => 현재 로그인 한 유저의 ID
		// pw => 사용자가 입력한 비밀번호의 값
		// DB에 등록되어있는 비밀번호 값과 비교
		String result = service.pwCheck(mDto);
		return result;
	}
	
	@RequestMapping(value="/delete", method = RequestMethod.GET)
	public String deleteView() {
		log.info(">>>>> 회원삭제 페이지 출력");
		return "member/dropmember";
	}
	
	@RequestMapping(value="/deletePlay", method = RequestMethod.GET)
	public String deletePlay(HttpSession session) {
		log.info(">>>>> 회원삭제 액션");
		service.delete(session);
		return "redirect:/";
	}
}
