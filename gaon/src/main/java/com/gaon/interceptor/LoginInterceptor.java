package com.gaon.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import lombok.extern.slf4j.Slf4j;


@Slf4j
public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	// 메인액션 실행되기 전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// session 체크, 값이 있으면 통과, 없으면 돌려보냄(원래 페이지로 가서 모달창키고 에러메세지 출력)
		HttpSession session = request.getSession(); // 세션 오픈
		
		if (session.getAttribute("userid") == null) {
			log.info("로그인 해주세요!!");
			String referer = request.getHeader("referer"); // 이전페이지 주소를 가져옴
			String uri = request.getRequestURI(); // uri는 /board/create를 알고 있음, 그래서 아래에 flashMap에 uri도 같이 넣어 보내줌
			
			// 0번지부터 시작함
			int index = referer.lastIndexOf("/"); // 뒤에서부터 /가 있는 번호를 알려주세요(1번째 글자, 2번째 글자... 6번째)
			int length = referer.length(); // 전체 길이(/board/create는 12)
			String url = referer.substring(index, length); // index부터 length까지 자름
			log.info(">>>>> 수정된 URL : " + url);
			
			if (url.equals("/create")) {
				response.sendRedirect(request.getContextPath() + "/board/list");
				return false;
			}
			
			// Login 페이지로 이동
			FlashMap flashMap = RequestContextUtils.getOutputFlashMap(request);
			flashMap.put("message", "nologin"); // message에 nologin이라는 데이터를 담아 1회성으로 보내줌
			flashMap.put("uri", uri);
			log.info(">>>>> URI : " + uri);
			
			RequestContextUtils.saveOutputFlashMap(referer, request, response);
			response.sendRedirect(referer);
			
			return false;
		} else {
			log.info("통과하세요~~");
			return true;
		}
		// return false; => 못들어감, 돌아가게 만듦
		// return true;  => 통과, 메인액션 실행
	}
	
	// 메인액션 실행 된 후
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}
	
}
