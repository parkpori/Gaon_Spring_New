package com.gaon.controller.member;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gaon.service.member.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping(value="member/*") // member/안에 있는 모든 경로
public class MemberController {
	
	@Inject
	private MemberService service;
	
	@RequestMapping(value="/constract", method = RequestMethod.GET)
	public String constract() {
		log.info(">>>>> 회원가입 동의");
		return "member/constract";
		// 나가는 경로는 데이터반환타입과 같음(String이면 viewResolver => /WEB-INF/views/main.jsp)
	}
	
	@ResponseBody // return값을 돌아가는 주소가 아닌 데이터로 보낸다는 의미
	@RequestMapping(value="/idcheck", method = RequestMethod.POST)
	public int idcheck(String id) {
		log.info("Ajax: ID 중복 체크");
		return service.idCheck(id);
	}
	
	@RequestMapping(value="/create", method = RequestMethod.GET)
	public String create() {
		log.info(">>>>> 회원가입 페이지 출력");
		return "member/member";
		// 출력만 하는 것은 액션을 안 타도 됨!!(컨트롤러만 타고 view로 바로 이동)
	}
	
	@RequestMapping(value="/update", method = RequestMethod.GET)
	public String update() {
		log.info(">>>>> 회원수정");
		return "";
	}
	
	@RequestMapping(value="/delete", method = RequestMethod.GET)
	public String delete() {
		log.info(">>>>> 회원삭제");
		return "";
	}
}
