package com.mountaintour.mountain.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/product")
@Controller
public class ProductController {

  @GetMapping("/list.do")
  public String list(Model model) {
	 return "product/list"; 
	}
}
