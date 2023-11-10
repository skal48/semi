package com.mountaintour.mountain.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/magazine")
@Controller
public class MagazineController {

  @GetMapping("/list.do")
  public String magazineList() {
    return "magazine/list";
  }
  
  @GetMapping("/write.form")
  public String goWrite() {
    return "magazine/write";
  }
}
