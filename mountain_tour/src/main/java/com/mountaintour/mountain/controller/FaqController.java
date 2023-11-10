package com.mountaintour.mountain.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mountaintour.mountain.service.FaqService;

import lombok.RequiredArgsConstructor;

@RequestMapping("/cs")
@RequiredArgsConstructor
@Controller
public class FaqController {
  
  private final FaqService faqService;
  
  /**
   * 
   * 전체 목록을 반환하는 메소드 입니다.
   * 
   * @param request
   * @param model
   * @return /cs/faqList.jsp
   */
  @GetMapping("/faqList.do")
  public String faqList(HttpServletRequest request, Model model) {
    faqService.loadFaqList(request, model);
    return "cs/faqList";
  }
  
  @GetMapping("/faqSearch.do")
  public String faqSearch(HttpServletRequest request, Model model) {
    faqService.loadSearchList(request, model);
    return "cs/faqList";
  }


}
