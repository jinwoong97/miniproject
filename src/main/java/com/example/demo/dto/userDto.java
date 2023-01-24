package com.example.demo.dto;

import java.util.Date;

import lombok.Data;

@Data
public class userDto {
	private int user_idx;
	private String user_name;
	private String user_id;
	private String user_pw;
	private String user_phone;
	private String user_address;
	private String user_gender;
	private Date user_birthday;
	private Date user_joindate;
	private String user_email;
	private String user_friends;
	
}
