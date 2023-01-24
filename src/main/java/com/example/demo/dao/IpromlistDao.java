package com.example.demo.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.promlistDto;

@Mapper
//@Mapper : Mybatis 와 인터페이스 함수를 연결 
public interface IpromlistDao {
	public List<promlistDto> promlist_list(String user_id);
	public int promlist_write(String promlist_title,Date promlist_date, String promlist_friends, String promlist_contents, String user_id);
	public int promlist_delete(int promlist_idx);
	public promlistDto viewDto(String promlist_idx);
	public int promlist_modifyAction(promlistDto dto);

}
