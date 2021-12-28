package com.care.root;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	private static final Logger logger =
			LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping("/")
	public String main(Model model) {
		model.addAttribute("message","메인 페이지입니다.");
		return "main";
	}
	

	
}
