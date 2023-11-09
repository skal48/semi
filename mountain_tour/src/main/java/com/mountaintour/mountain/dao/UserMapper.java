package com.mountaintour.mountain.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mountaintour.mountain.dto.UserDto;

@Mapper
public interface UserMapper {
	public UserDto getUser(Map<String, Object> map);
}