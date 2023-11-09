package com.mountaintour.mountain.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/Notice")
@Controller
public class NoticeController {
  
  @GetMapping("list.do")
  public String list(Model model) {
    return "notice/list";
}
  
}
