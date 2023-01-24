package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.visitorDto;

@Mapper
//@Mapper : Mybatis 와 인터페이스 함수를 연결 
public interface IvisitorDao {
	public List<visitorDto> list();
	public int visitor_write(String visitor_contents, String user_id);
	public int visitor_delete(int visitor_idx);
	public visitorDto viewDto(String visitor_idx);
	public int visitor_modifyAction(visitorDto dto);

}
