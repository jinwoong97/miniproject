package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.galleryDto;

@Mapper
//@Mapper : Mybatis 와 인터페이스 함수를 연결 
public interface IgalleryDao {
	public List<galleryDto> list();
	public List<galleryDto> re_list();
	public int image_insert(galleryDto gallery);
	public int gallery_delete(int gallery_idx);


}
