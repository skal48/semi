package com.mountaintour.mountain.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/cs")
@Controller
public class InquiryController {
  
  @GetMapping("/inquiryList.do")
  public String inquiryList() {
    return "cs/inquiryList";
  }
  
}
