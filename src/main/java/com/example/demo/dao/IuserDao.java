package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.userDto;

@Mapper
public interface IuserDao {
	public int login(String user_id, String user_pw);

	public int join_user(userDto dto);

	public int idcheck(String user_id);
	
	public List<userDto> user_list(String user_id);

}
