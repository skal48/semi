package com.mountaintour.mountain.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.mountaintour.mountain.dto.UserDto;

public interface ManageService {
  
  /* 기존 회원 목록 */
  public void loadUserList(HttpServletRequest request, Model model);
  
  /* 기존 회원 검색 */
  public void loadSearchUserList(HttpServletRequest request, Model model);
  
  /* 기존 회원 상세*/
  public UserDto getUser(int userNo);
}
