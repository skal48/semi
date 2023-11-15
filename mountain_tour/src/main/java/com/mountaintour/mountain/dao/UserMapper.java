package com.mountaintour.mountain.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mountaintour.mountain.dto.HeartDto;
import com.mountaintour.mountain.dto.UserDto;

@Mapper
public interface UserMapper {
	public UserDto getUser(Map<String, Object> map);
	public int insertAccess(String email);
	
	public int insertUser(UserDto user);
	public int updateUser(UserDto user);
	public int updateUserPw(UserDto user);
	public int insertNaverUser(UserDto user);
	public int deleteUser(UserDto user);
	public List<HeartDto> selectHeartList(Map<String, Object> map);
	public int getHeartCount();
	
	
}