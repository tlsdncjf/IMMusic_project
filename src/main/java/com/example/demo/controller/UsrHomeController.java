package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.vo.Blog;
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
	
//	크롤링 ajx
	@RequestMapping("/usr/home/crawl")
	@ResponseBody
	public List<Blog> blogCrawl() {

		List<Blog> listBlog = ucc.crawl();
		
		return listBlog;
	}
}
