package com.mountaintour.mountain.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;

import com.mountaintour.mountain.dto.UserDto;

public interface ManageService {
  
  /* 기존 회원 목록 */
  public void loadUserList(HttpServletRequest request, Model model);
  
  /* 기존 회원 검색 */
  public void loadSearchUserList(HttpServletRequest request, Model model);
  
  /* 기존 회원 상세*/
  public UserDto getUser(int userNo);
  
  /* 기존 회원 정보 수정 */
  public ResponseEntity<Map<String, Object>> modifyUser(HttpServletRequest request);
  
  /* 기존 회원 비밀번호 수정 */
  public int modifyPw(HttpServletRequest request);
  
  /* 기존 회원 탈퇴 */
  public int removeMember(int userNo);
}
