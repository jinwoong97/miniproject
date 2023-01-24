package com.example.demo.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data //@Data : lombok과 연결함 
public class promlistDto {
	private int promlist_idx;
	private String promlist_user_id;
	private String promlist_title;
	private String promlist_contents;
	private String promlist_friends;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date promlist_date;
}
