package com.example.demo.vo;

import java.util.List;

import org.openqa.selenium.By;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Blog {
	private String post_date;
	private String post_url;
	private String post_title;
	private String post_content;
}