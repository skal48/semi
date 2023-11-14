package com.mountaintour.mountain.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mountaintour.mountain.dto.UserDto;
import com.mountaintour.mountain.service.ManageService;
import com.mountaintour.mountain.service.UserService;

import lombok.RequiredArgsConstructor;

@RequestMapping("/manage")
@RequiredArgsConstructor
@Controller
public class ManageController {
  
  private final ManageService manageService;
  
  /**
   * 기존 회원 목록 페이지
   * @param request
   * @param model
   * @return
   */
  @GetMapping("/memberList.form")
  public String memberList(HttpServletRequest request, Model model) {
    manageService.loadUserList(request, model);
    return "manage/memberList";
  }
  
  /**
   * 기존 회원 검색
   * @param request
   * @param model
   * @return
   */
  @GetMapping("/memberSearchList.do")
  public String memberSearchList(HttpServletRequest request, Model model) {
    manageService.loadSearchUserList(request, model);
    return "manage/memberList";
  }
  
  /**
   * 기존 회원 상세
   * @param request
   * @param model
   * @return
   */
  @GetMapping("/member.form")
  public String member(@RequestParam(value="userNo", required=false, defaultValue="0") int userNo
                     , Model model) {
    UserDto user = manageService.getUser(userNo);
    model.addAttribute("user", user);
    return "manage/memberDetail";
  }
  
  @PostMapping(value="/modify.do", produces=MediaType.APPLICATION_JSON_VALUE)
  public ResponseEntity<Map<String, Object>> modifyUser(HttpServletRequest request){
    return manageService.modifyUser(request);
  }
  
  /* 탈퇴 회원 목록 페이지 */
  @GetMapping("/leaveMemberList.form")
  public String leaveMemberList() {
    return "manage/leaveMemberList";
  }
  
  /* 상품,예약 목록 페이지 */
  @GetMapping("/productList.form")
  public String productList() {
    return "manage/productList";
  }
  
  /* 전체 리뷰 목록 페이지 */
  @GetMapping("/reviewList.form")
  public String reviewList() {
    return "manage/reviewList";
  }
  
}
