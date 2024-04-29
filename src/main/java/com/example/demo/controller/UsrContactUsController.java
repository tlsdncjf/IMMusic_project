package com.example.demo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.example.demo.service.ContactUsService;
import com.example.demo.service.GenFileService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Blog;
import com.example.demo.vo.ResultData;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UsrContactUsController {
	
	@Autowired
	private ContactUsService contactUsService;
	@Autowired
	private GenFileService genFileService;
	
	@Autowired
	private UsrCrawlingController blog;
	
	@RequestMapping("/usr/contactUs/concert")
	public String contactUsconcert() {

		List<Blog> Blog = blog.crawl();
		
		return "usr/contactUs/concert";
	}
	
	@RequestMapping("/usr/contactUs/signupconcert")
	@ResponseBody
	public String signupconcert(String name, String emailId, String emailoption, String cellphoneNum, String concertdate,
			String postcode, String address, String detailAddress, String extraAddress, String inquiry, int check, HttpSession httpSession, HttpServletRequest req) {

		String fullemail = emailId + "@" + emailoption;
		String fulladdress = address + detailAddress + extraAddress;
		
		ResultData<Integer> signupRd = contactUsService.signup(name, fullemail, cellphoneNum, concertdate, postcode, fulladdress, inquiry, check);
		
		contactUsService.sendsignupMessage(cellphoneNum, name);
		
		return Ut.jsReplace("S-1", signupRd.getMsg(), "../home/main");
	}
	
	@RequestMapping("/usr/contactUs/application")
	public String contactUsapplication(Model model) {
		
		int currentId = contactUsService.getCurrentPressId(); // 현재 추가되는 id에 대한 정보
		
		model.addAttribute("currentId", currentId);
		
		return "usr/contactUs/application";
	}
	
	@RequestMapping("/usr/contactUs/joinapplication")
	@ResponseBody
	public String joinapplication(String name, String birth, String gender, String cellphoneNum, String emailId, String emailoption,
			String postcode, String address, String detailAddress, String extraAddress, String major, String sns, String photo, String career, String introduction, int check, 
			HttpServletRequest req, MultipartRequest multipartRequest) {
		
		String fullemail = emailId + "@" + emailoption;
		String fulladdress = address + detailAddress + extraAddress;
		
		ResultData<Integer> joinRd = contactUsService.join(name, birth, gender, cellphoneNum, fullemail, postcode, fulladdress, major, sns, introduction, check);

		String relTypeCode = "application";
		 // 작성된 게시글 번호 가져오기 
		int id = (int) joinRd.getData1();

		System.err.println("multipartRequest: " + multipartRequest);
		 // 이미지 업로드 
		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
		
		// System.err.println("multipartRequest" + multipartRequest); // ex) multipartRequest: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest@6112db46
		// System.err.println("fileMap" + fileMap); // fileMap{file__press__23__extra__Img__1=org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@5ac316c6}
		
		for (String fileInputName : fileMap.keySet()) { MultipartFile multipartFile =
		fileMap.get(fileInputName); 
		
		if (multipartFile.isEmpty() == false) { genFileService.save(multipartFile,
		id, relTypeCode); } 
		
		}
		
		contactUsService.sendjoinMessage(cellphoneNum, name);
		
		return Ut.jsReplace("S-1", joinRd.getMsg(), "../home/main");
	}
	
	@RequestMapping("/usr/contactUs/artist")
	public String showAboutArtist() {

		return "usr/contactUs/artist";
	}
	
	@RequestMapping("/usr/contactUs/contactUs")
	public String contactUst() {

		return "usr/contactUs/contactUs";
	}
	



}
