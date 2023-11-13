package com.mountaintour.mountain.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mountaintour.mountain.dto.UserDto;

public interface UserService {
	public void login(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public UserDto getUser(String email);
	public void logout(HttpServletRequest request, HttpServletResponse response);
	
}