package com.example.demo.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data //@Data : lombok과 연결함 
public class diaryDto {
	//다이어리 번호
	private int diary_idx;
	//다이어리 유저 번호
	private int diary_user_idx;
	//다이어리 폴더 번호
	private int diary_folder_idx;
	//다이어리 이미지
	private String diary_img;
	//다이어리 내용
	private String diary_contents;
	//다이어리 날짜
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date diary_date;
	//다이어리 제목	
	private String diary_title;
	
	
}
