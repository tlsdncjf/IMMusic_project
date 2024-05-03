package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.stereotype.Component;

import com.example.demo.vo.Blog;
@Component
public class UsrCrawlingController {

	public List<Blog> crawl() {

		System.setProperty("webdriver.chrome.driver", "C:\\work\\sts-4.21.0.RELEASE-workspace\\IMMusic_project\\chromedriver.exe");
		//System.setProperty("webdriver.chrome.driver", "C:\\Users\\ohyo9\\git\\IMMusic_project\\chromedriver.exe");

		ChromeOptions options = new ChromeOptions();
		options.addArguments("--headless"); // 브라우저를 표시하지 않고 실행할 경우
		
		List<Blog> blogList = new ArrayList<>();
		 
		// 웹 드라이버 초기화
		WebDriver driver = new ChromeDriver(options);
		try {
			String url = "https://m.blog.naver.com/guitarresca?tab=1";
			
			driver.get(url);
			
			 WebElement button = driver.findElement(By.cssSelector("#root > div.blog_cover__qKXh9 > div > div.btn_area__NGD9l > div:nth-child(2) > button"));
			 button.click();

			 Thread.sleep(2000); // Wait for 2 seconds (adjust as needed) 

			 List<WebElement> elements = new ArrayList<>();
			 
			 for (int i = 1; i <= 3; i++) {
				 for(int j = 1; j <= 2; j++) {
					 WebElement element = driver.findElement(By.cssSelector("#contentslist_block > div.list_block__XlpUJ > div > div.list__A6ta5 > ul > li:nth-child(" + i + ") > div:nth-child(" + j + ")"));
	                 elements.add(element);
				 }
			 }
			 
			 for (WebElement element : elements) {
				 String post_date = element.findElement(By.cssSelector("div > div.meta_head__nWqoo > div")).getText();
				 String post_url = element.findElement(By.cssSelector("div > div:nth-child(2) > div.thumb_area__IdmrJ > a")).getAttribute("href");
				 String post_title = element.findElement(By.cssSelector("div > div > div.text_area__mOuKZ > a > strong > span")).getText();
				 String be_post_content = element.findElement(By.cssSelector("div > div > div.text_area__mOuKZ > a > span > span")).getText();
				 String post_content = be_post_content.substring(0, 135) + "···";
				 
				 Blog blog = new Blog(post_date, post_url, post_title, post_content);
	             blogList.add(blog);
			 }

		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			// 웹 드라이버 종료
			driver.quit();
		}
		return blogList;
	}

	private String truncateString(String post_content, int i) {
		// TODO Auto-generated method stub
		return null;
	}
		
}
