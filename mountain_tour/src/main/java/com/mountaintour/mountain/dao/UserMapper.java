package com.mountaintour.mountain.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

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
	
	/* 회원 관리 목록 */
	public int getUserCount();
	public List<UserDto> getUserList(Map<String, Object> map);


	/* 회원 검색결과 목록 */
	public int getSearchUserCount(Map<String, Object> map);
	public List<UserDto> getSearchUser(Map<String, Object> map);
}