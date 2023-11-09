package com.mountaintour.mountain.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/cs")
@Controller
public class FaqController {

  @GetMapping("/faqList.do")
  public String faqList() {
    return "cs/faqList";
  }
  

}
