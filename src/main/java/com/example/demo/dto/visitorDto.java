package com.example.demo.dto;

import java.util.Date;

import lombok.Data;

@Data //@Data : lombok과 연결함 
public class visitorDto {
	private int visitor_idx;
	private int visitor_user_idx;
	private String visitor_user_name;
	private String visitor_contents;
	private Date visitor_date;
	private String vi_user_name;
}
