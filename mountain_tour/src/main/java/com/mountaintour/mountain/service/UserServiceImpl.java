package com.mountaintour.mountain.service;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mountaintour.mountain.dao.UserMapper;
import com.mountaintour.mountain.dto.UserDto;
import com.mountaintour.mountain.util.MySecurityUtils;

import lombok.RequiredArgsConstructor;


@Transactional
@RequiredArgsConstructor 
@Service
public class UserServiceImpl implements UserService {

  private final UserMapper userMapper;
  private final MySecurityUtils mySecurityUtils;

 
  
  @Override
  public void login(HttpServletRequest request, HttpServletResponse response) throws Exception {
    
    String email = request.getParameter("email");
    String pw = mySecurityUtils.getSHA256(request.getParameter("pw"));
    
    Map<String, Object> map = Map.of("email", email
                                   , "pw", pw);

    HttpSession session = request.getSession();
    
    
    // 정상적인 로그인 처리하기
    UserDto user = userMapper.getUser(map);
    
    if(user != null) {
      request.getSession().setAttribute("user", user);
      userMapper.insertAccess(email);
      response.sendRedirect(request.getParameter("referer"));
    } else {
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter out = response.getWriter();
      out.println("<script>");
      out.println("alert('일치하는 회원 정보가 없습니다.')");
      out.println("location.href='" + request.getContextPath() + "/main.do'");
      out.println("</script>");
      out.flush();
      out.close();
    }
    
  }

  @Override
	public void logout(HttpServletRequest request, HttpServletResponse response) {
		
	  HttpSession session = request.getSession();
	  
	  session.invalidate();
	  
	  try {
		  response.sendRedirect(request.getContextPath() + "/main.do");
	  } catch (Exception e) {
		  e.printStackTrace();
	  }
		
	}
}


