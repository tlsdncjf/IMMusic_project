package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Press {
	private int id;
	private String regDate;
	private String updateDate;
	private String title;
	private String body;

	private boolean userCanModify;
	private boolean userCanDelete;
}
