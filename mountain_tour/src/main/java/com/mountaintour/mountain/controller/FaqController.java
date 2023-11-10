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
  
  @GetMapping("/faqList.do")
  public String faqList(HttpServletRequest request, Model model) {
    faqService.loadFaqList(request, model);
    return "cs/faqList";
  }


}
