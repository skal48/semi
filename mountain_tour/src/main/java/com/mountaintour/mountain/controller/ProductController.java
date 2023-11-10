package com.mountaintour.mountain.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@RequestMapping("/product")
@Controller
public class ProductController {

  @GetMapping("/list.do")
  public String list(Model model) {
	 return "product/list"; 
	}
  
  @GetMapping("/write.form")
  public String write() {
	 return "product/write"; 
	}
  @PostMapping("/add.do")
  public String add(MultipartHttpServletRequest multipartRequest
                  , RedirectAttributes redirectAttributes) throws Exception {    
    return "redirect:/product/list.do";
  }
  @GetMapping("/detail.do")
  public String detail() {
	 return "product/detail"; 
	}
  @GetMapping("/edit.do")
  public String edit() {
	 return "product/edit"; 
	}
}
