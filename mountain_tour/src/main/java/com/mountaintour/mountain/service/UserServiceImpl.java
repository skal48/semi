package com.mountaintour.mountain.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.mountaintour.mountain.dao.UserMapper;
import com.mountaintour.mountain.dto.UserDto;
import com.mountaintour.mountain.util.MySecurityUtils;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service
public class UserServiceImpl implements UserService {

	private final UserMapper userMapper;
	private final MySecurityUtils mySecurityUtils;
	@Override
	public void login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String email = request.getParameter("email");
		String pw = mySecurityUtils .getSHA256(request.getParameter("pw"));
		
		Map<String, Object> map = Map.of("email", email
										, "pw", pw);
				
		UserDto user = userMapper.getUser(map);
		
		if(user != null) {
			
			request.getSession().setAttribute("user", user);
		}

	}

}