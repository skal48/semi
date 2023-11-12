package com.mountaintour.mountain.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/magazine")
@Controller
public class MagazineController {

  @GetMapping("/list.do")
  public String magazineList() {
    return "magazine/list";
  }
  
  @GetMapping("/write.form")
  public String writeForm() {
    return "magazine/write";
  }
    
 @GetMapping("/thumbnail.do")
 public String nextWrite() {
   return "magazine/thumbnail";
 }
 
 @GetMapping("/detail.do")
 public String detail() {
   return "magazine/detail";
 }
 
 @GetMapping("/modify.do")
 public String modify() {
   return "magazine/modify";
 }
 
 @GetMapping("/delete.do")
 public String delete() {
   return "magazine/list";
 }
 
}
