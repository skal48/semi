package com.mountaintour.mountain.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mountaintour.mountain.service.ProductService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RequestMapping("/product")
@Controller
public class ProductController {

  private final ProductService productService;
	
  @GetMapping("/list.do")
  public String list(Model model) {
	 return "product/list"; 
	}
  
  @GetMapping("/write.form")
  public String write() {
	 return "product/write"; 
	}
  @PostMapping("/add.do")
  public String add(HttpServletRequest request, RedirectAttributes redirectAttributes) {   
	int addResult = productService.addProduct(request);
	redirectAttributes.addFlashAttribute("addResult", addResult);
    return "redirect:/product/list.do";
  }
  
  @ResponseBody
  @PostMapping(value="/imageUpload.do", produces="application/json")
  public Map<String, Object> imageUpload(MultipartHttpServletRequest multipartRequest) {
    return productService.imageUpload(multipartRequest);
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
