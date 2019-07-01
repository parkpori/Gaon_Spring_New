package com.gaon.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gaon.domain.product.ProductDTO;
import com.gaon.service.product.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j // 로그를 쓰기 위해 필요
public class IndexController {
	// private static final Logger logger = LoggerFactory.getLogger(IndexController.class); // 로그를 쓰기 위해 필요(@Slf4j로 대체)
	// logger.info("");
	
	@Inject
	private ProductService service; // 의존성 주입(인스턴스 생성)
	
	@RequestMapping("/")
	public String index(Model model, HttpSession session) {
		log.info(">>>>> Index 페이지");
		HashMap<String, List<ProductDTO>> map = service.productList(); // 의존성 주입
		
		model.addAttribute("pLists", map);
		
		return "index"; // 아무것도 안적으면 자동으로 forward
	}
}
