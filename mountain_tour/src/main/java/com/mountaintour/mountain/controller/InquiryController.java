package com.mountaintour.mountain.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mountaintour.mountain.dto.InquiryDto;
import com.mountaintour.mountain.service.InquiryService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RequestMapping("/cs")
@Controller
public class InquiryController {
  
  private final InquiryService inquiryService;
  
  /**
   * 1:1문의 전체 목록 보기
   * @param request
   * @param model
   * @return
   */
  @GetMapping("/inquiryList.do")
  public String inquiryList(HttpServletRequest request, Model model) {
    inquiryService.loadInquiryList(request, model);
    return "cs/inquiryList";
  }
  
  /**
   * 1:1문의 검색 목록 보기
   * @param request
   * @param model
   * @return
   */
  @GetMapping("/inquirySearch.do")
  public String inquirySearch(HttpServletRequest request, Model model) {
    inquiryService.loadSearchList(request, model);
    return "cs/inquiryList";
  }
  
  /**
   * 1:1문의 상세 페이지 보기
   * @param inquiryNo
   * @param model
   * @return
   */
  @GetMapping("/inquiryDetail.do")
  public String inquiryDetail(@RequestParam(value="inquiryNo", required=false, defaultValue="0") int inquiryNo
                            , Model model) {
    InquiryDto inquiry = inquiryService.getInquiry(inquiryNo);
    model.addAttribute("inquiry", inquiry);
    return "cs/inquiryDetail";
  }
  
  /**
   * 1:1문의 작성 폼으로 이동
   * @return
   */
  @GetMapping("/addInquiry.form")
  public String addInquiryForm () {
    return "cs/inquiryWrite";
  }
  
  @PostMapping("/addInquiry.do")
  public String addInquiry(HttpServletRequest request, RedirectAttributes redirectAttributes) {
    int addResult = inquiryService.addInquiry(request);
    redirectAttributes.addFlashAttribute("addResult", addResult);
    return "redirect:/cs/inquiryList.do";
  }
  
}
