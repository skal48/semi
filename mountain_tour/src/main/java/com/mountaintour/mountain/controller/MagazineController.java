package com.mountaintour.mountain.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mountaintour.mountain.service.MagazineService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RequestMapping("/magazine")
@Controller
public class MagazineController {
   private final MagazineService magazineService;
  
  @GetMapping("/list.do")
  public String magazineList() {
    return "magazine/list";
  }
  
  @GetMapping("/write.form")
  public String writeForm() {
    return "magazine/write";
  }
  @ResponseBody  
  @GetMapping(value="/getProductNo.do", produces="application/json")
  public Map<String, Object> getProductNo() { 
    System.out.println(magazineService.loadProductNo());
    return magazineService.loadProductNo();
  }
  
 @PostMapping("/thumbnail.do")
 public String FirstWrite(HttpServletRequest request, RedirectAttributes redirectAttributes) { 
   int addResult = magazineService.firstUpload(request);
   redirectAttributes.addFlashAttribute("addResult", addResult);   
   return "redirect:/magazine/thumbnail";
 }
 @ResponseBody
 @PostMapping(value="/imageUpload.do", produces="application/json")    //매거진 작성 이미지 파일 저장
 public Map<String, Object> imageUpload(MultipartHttpServletRequest multipartRequest) {
   return magazineService.imageUpload(multipartRequest);
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
