package com.example.demo.controller;

import java.time.Duration;
import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.springframework.stereotype.Component;
import com.example.demo.vo.Blog;
@Component
public class UsrCrawlingController {

	public List<Blog> crawl() {
		//System.setProperty("webdriver.chrome.driver", "C:\\OHJ\\sts-4.22.0.RELEASE-workspace\\my_project_03\\chromedriver.exe");
		System.setProperty("webdriver.chrome.driver", "C:\\work\\sts-4.21.0.RELEASE-workspace\\IMMusic_project\\chromedriver.exe");

		ChromeOptions options = new ChromeOptions();
		options.addArguments("--headless"); // 브라우저를 표시하지 않고 실행할 경우
		
		List<Blog> BlogList = new ArrayList<>();

		// 웹 드라이버 초기화
		WebDriver driver = new ChromeDriver(options);
		try {
			String url = "https://m.blog.naver.com/guitarresca?categoryNo=0&tab=1";
			
			driver.get(url);


			 WebElement button = driver.findElement(By.cssSelector("#root > div.blog_cover__qKXh9 > div > div.btn_area__NGD9l > div:nth-child(2) > button"));
			 button.click();

			 Thread.sleep(2000); // Wait for 2 seconds (adjust as needed) 
		 
//			 String we = driver.findElement(By.cssSelector("#root > div.content__Lo0ig > div:nth-child(2) > div > div > div > ul > li:nth-child(1) > div > a > div.text_area__XtgMk > strong")).getText();
//			 System.err.println("**********************" + we);
//			 
//			 String we2 = driver.findElement(By.cssSelector("#root > div.content__Lo0ig > div:nth-child(2) > div > div > div > ul > li:nth-child(1) > div > a > div.thumbnail_area__zq2gm > img")).getAttribute("src");
//			 System.err.println("**********************" + we2);
			 
			 List<WebElement> Elements = driver.findElements(By.cssSelector("#contentslist_block > div.list_block__XlpUJ > div > div.list__A6ta5 > ul > li > div"));
			
			 WebElement b = driver.findElement(By.cssSelector("#contentslist_block > div.list_block__XlpUJ > div > div.list__A6ta5 > ul > li > div"));
			 
			 String post_date = b.findElement(By.cssSelector("div.meta_head__nWqoo > div")).getText();
			 System.err.println("post_date: " + post_date);
			 
			 String post_url = b.findElement(By.cssSelector("div:nth-child(2) > div.thumb_area__IdmrJ > a")).getAttribute("href");
			 System.err.println("post_url: " + post_url);

			 String post_title = b.findElement(By.cssSelector("div > div.text_area__mOuKZ > a > span > span")).getText();
			 System.err.println("post_title: " + post_title);
			 
			 String post_content = b.findElement(By.cssSelector("div > div.text_area__mOuKZ > a > strong > span")).getText();
			 System.err.println("post_content: " + post_content);
			 
			 WebElement ee1 = b.findElement(By.cssSelector("div:nth-child(2) > div.thumb_area__IdmrJ > a > div > div"));
			 String ee2 = b.findElement(By.cssSelector("div:nth-child(2) > div.thumb_area__IdmrJ > a > div > div > div")).getAttribute("style");
			 System.err.println("ee2: " + ee2);
			 
			 // WebElement yy = driver.findElement(By.xpath("//*[@id=\"contentslist_block\"]/div[2]/div/div[2]/ul/li[1]/div[2]/div[2]/div[1]/a/div/div/div/img"));

			 WebElement ee3 = driver.findElement(By.cssSelector("div:nth-child(2) > div.thumb_area__IdmrJ > a > div > div > div > img"));
			
			 //System.out.println(BlogList);

		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			// 웹 드라이버 종료
			driver.quit();
		}
		return BlogList;
	}
		
}
