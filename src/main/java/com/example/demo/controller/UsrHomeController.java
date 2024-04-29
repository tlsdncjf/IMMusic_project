package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.vo.Rq;

@Controller
public class UsrHomeController {

	@Autowired
	private Rq rq;
	
	@Autowired
	private UsrCrawlingController ucc;

	@RequestMapping("/usr/home/main")
	public String showMain() {

		return "/usr/home/main";
	}
	@RequestMapping("/usr/home/main2")
	public String showMain2() {

		return "/usr/home/main2";
	}
	
	@RequestMapping("/")
	public String showRoot() {

		return "redirect:/usr/home/main";
	}
	
	@RequestMapping("/usr/home/test")
	public String showMain12() {

		ucc.crawl();
		
		return "/usr/home/test";
	}
}
