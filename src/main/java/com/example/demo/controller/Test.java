package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.PressService;
import com.example.demo.vo.Press;
import com.example.demo.vo.Rq;

@Controller
public class Test {

	@RequestMapping("/usr/test/APITest")
	public String APITest() {

		return "/usr/test/APITest/";
	}

	@RequestMapping("/usr/test/APITest2")
	public String APITest2() {

		return "/usr/test/APITest2";
	}

	@RequestMapping("/usr/test/APITest3")
	public String APITest3() {

		return "/usr/test/APITest3";
	}

	@RequestMapping("/usr/test/APITest4")
	public String APITest4() {

		return "/usr/test/APITest4";
	}

	@RequestMapping("/usr/test/AddFindTest")
	public String AddFindTest() {

		return "/usr/test/AddFindTest";
	}

	@RequestMapping("/usr/test/AddFindTest2")
	public String AddFindTest2() {

		return "/usr/test/AddFindTest2";
	}

	@RequestMapping("/usr/test/weatherApiTest")
	public String weatherApiTest() {

		return "/usr/test/weatherApiTest";
	}

	@RequestMapping("/usr/test/slidertest")
	public String testSlider() {

		return "/usr/test/sliderTest";
	}

	@RequestMapping("/usr/home/main3")
	public String main3() {

		return "/usr/home/main3";
	}
	@RequestMapping("/usr/home/main4")
	public String main4() {
		
		return "/usr/home/main4";
	}

	@Autowired
	private Rq rq;

	@Autowired
	private PressService pressService;

	@RequestMapping("/usr/press/listTest")
	public String listTest(Model model) {

		return "/usr/press/listTest";
	}

	@RequestMapping("/usr/press/detailTest")
	public String detailTest(int id, Model model) {
		
		Press press = pressService.getPress(id);

		model.addAttribute("press", press);

		return "/usr/press/detailTest";
	}
	
	

}