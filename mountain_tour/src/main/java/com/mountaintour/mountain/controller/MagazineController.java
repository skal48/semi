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
  @GetMapping("/thumbnail.form")
  public String thumbnail() {
    return "magazine/thumbnail";
  }
  
  @ResponseBody
  @GetMapping(value="/getList.do", produces="application/json" )
  public Map<String, Object> getList(HttpServletRequest request){
    return magazineService.getMagazineList(request);  
  }
  
  @ResponseBody  
  @GetMapping(value="/getProductNo.do", produces="application/json")
  public Map<String, Object> getProductNo() { 
    return magazineService.loadProductNo();
  }
  
 @PostMapping("/thumbnail.do")
 public String firstAdd(HttpServletRequest request, RedirectAttributes redirectAttributes) { 
   redirectAttributes.addFlashAttribute("map", magazineService.firstUpload(request));   
   return "redirect:/magazine/thumbnail.form";
 }
 
 
 @ResponseBody
 @PostMapping(value="/imageUpload.do", produces="application/json")    //매거진 작성 이미지 파일 저장
 public Map<String, Object> imageUpload(MultipartHttpServletRequest multipartRequest) {
   return magazineService.imageUpload(multipartRequest);
 }
 
 
 @PostMapping("/final.do")
 public String finalAdd(MultipartHttpServletRequest multipartRequest
               , RedirectAttributes redirectAttributes) throws Exception {
   boolean addResult =magazineService.addThumbnail(multipartRequest);
   redirectAttributes.addFlashAttribute("addResult", addResult);
   return "redirect:/magazine/list.do";
 }
 
 
 @GetMapping("/detail.do")
 public String detail(HttpServletRequest request, Model model) {
   magazineService.loadMagazine(request, model);
   return "magazine/detail";
 }
 
 @GetMapping("/modify.do")
 public String modify() {
   return "magazine/modify";
 }
 
 @PostMapping("/delete.do")
 public String delete(HttpServletRequest request, RedirectAttributes redirectAttributes) {
   redirectAttributes.addAttribute("deleteRemove",magazineService.deleteMagazine(request));
   return "redirect:/magazine/list.do";
 }
 
}
