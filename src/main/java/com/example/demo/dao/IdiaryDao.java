package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.diaryDto;

@Mapper
//@Mapper : Mybatis 와 인터페이스 함수를 연결 
public interface IdiaryDao {
	public List<diaryDto> list(String user_id);
	public int diary_write(String diary_title, String diary_contents, String diary_folder_idx, String diary_user_id);
	public int diary_delete(int diary_idx);
	public diaryDto viewDto(String diary_idx);
	public int diary_modifyAction(diaryDto dto);
	public List<diaryDto> folder_list(String user_id, String diary_folder_idx);

}
