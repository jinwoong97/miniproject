package com.example.demo.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.example.demo.dao.IuserDao;
import com.example.demo.dto.userDto;

@Component
public class userService {
	@Autowired
	private IuserDao iuserDao;
	
	//	로그인판별
	public int login(String user_id, String user_pw) {
		int result = 0;
		
		
		int count = iuserDao.login(user_id, user_pw);
		
		if(count > 0) {
			result = 1;
		}
		return result;
	}
	
	//	회원가입
	public int join_user(String user_name, String user_id, String user_pw, String user_phone, String user_address, String user_gender ,Date user_birthday, String user_email) {
		
		int result = 0;
		userDto dto = new userDto();
		dto.setUser_name(user_name);
		dto.setUser_id(user_id);
		dto.setUser_pw(user_pw);
		dto.setUser_phone(user_phone);
		dto.setUser_address(user_address);
		dto.setUser_gender(user_gender);
		dto.setUser_birthday(user_birthday);
		dto.setUser_email(user_email);
	
		try {
			result = iuserDao.join_user(dto);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return result;
	}
	
	
	public int idcheck(String user_id) {
		
		int result = 0;
		try {
			result = iuserDao.idcheck(user_id);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}
	
	//회원정보 띄우기
	public List<userDto> user_list(String user_id){
		
		List<userDto> user_list = iuserDao.user_list(user_id);
		
		return user_list;
	}
}
