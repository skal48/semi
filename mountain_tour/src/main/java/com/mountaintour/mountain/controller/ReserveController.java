package com.mountaintour.mountain.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/reserve")
@Controller
public class ReserveController {

  // 상품상세에서 요청이 올 때 데이터 받아서 저장하기
  @GetMapping("/write.form")
  public String reserve() {
    return "reserve/write";
  }
}
