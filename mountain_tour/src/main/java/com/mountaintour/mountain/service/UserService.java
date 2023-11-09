package com.mountaintour.mountain.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface UserService {
	public void login(HttpServletRequest request, HttpServletResponse response) throws Exception;

}