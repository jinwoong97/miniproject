package com.example.demo.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data //@Data : lombok과 연결함 
public class galleryDto {
	//갤러리 번호
	private int gallery_idx;
	//갤러리 제목	
	private String gallery_title;
	//갤러리 이미지 이
	private String gallery_img;
	//갤러리 내용
	private String gallery_contents;
	//갤러리 날짜
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date gallery_date;

	
	
}
