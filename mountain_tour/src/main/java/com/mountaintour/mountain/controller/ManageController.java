package com.mountaintour.mountain.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/manage")
@Controller
public class ManageController {
  
  @GetMapping("/memberList.do")
  public String memberList() {
    return "manage/memberList";
  }
  
  @GetMapping("/productList.do")
  public String productList() {
    return "manage/productList";
  }
  
  @GetMapping("/reviewList.do")
  public String reviewList() {
    return "manage/reviewList";
  }
  
}
