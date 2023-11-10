package com.mountaintour.mountain.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@RequestMapping("/notice")
@RequiredArgsConstructor
@Controller
public class NoticeController {
  
  @GetMapping("/list.do")
  public String list() {
    return "notice/list";
  }
  
  @GetMapping("/write.form")
  public String write() {
    return "notice/write";
  }
  
  @GetMapping("/detail.do")
  public String detail() {
    return "notice/detail";
  }
}
  

