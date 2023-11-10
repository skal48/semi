package com.mountaintour.mountain.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mountaintour.mountain.service.ReserveService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RequestMapping("/reserve")
@Controller
public class ReserveController {
  
  private final ReserveService reserveService;

  // 상품상세에서 요청이 올 때 데이터 받아서 저장하기
  @GetMapping("/write.form")
  public String reserve() {
    return "reserve/write";
  }
  
  @GetMapping("/detail.do")
  public String detail(HttpServletRequest request, Model model) {
//    String rsrvDate = request.getParameter("rsrvDate");
//    model.addAttribute("rsrvDate", rsrvDate);
    return "reserve/detail";
  }
  
  @GetMapping("/list.do")
  public String list() {
    return "reserve/list";
  }
  
}
