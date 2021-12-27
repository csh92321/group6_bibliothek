package com.care.root.pay.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("pay")
public class PayController {

	@GetMapping("payMain")
	public String selectAllpayMain() {
		return "pay/payMain";
	}
	@GetMapping("payMonth")
	public String selectAllpayMonth() {
		return "pay/payMonth";
	}
	@PostMapping("payMentMonth")
	public String payMonth() {
		return "pay/payMentMonth";
	}
	@GetMapping("payYear")
	public String selectAllpayYear() {
		return "pay/payYear";
	}
//	@GetMapping("payMentMonth")
//	public String selectAllpayMentMonth() {
//		return "pay/payMentMonth";
//	}
	@GetMapping("payMentYear")
	public String selectAllpayMentYear() {
		return "pay/payMentYear";
	}
}
