package com.mountaintour.mountain.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mountaintour.mountain.dto.FaqDto;
import com.mountaintour.mountain.service.FaqService;

import lombok.RequiredArgsConstructor;

@RequestMapping("/cs")
@RequiredArgsConstructor
@Controller
public class FaqController {
  
  private final FaqService faqService;
  
  /**
   * 
   * 전체목록을 반환하는 메서드입니다.
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


  
  /**
   * 검색목록을 반환하는 메서드입니다.
   * @param request
   * @param model
   * @return /cs/faqList.jsp
   */
  @GetMapping("/faqSearch.do")
  public String faqSearch(HttpServletRequest request, Model model) {
    faqService.loadSearchList(request, model);
    return "cs/faqList";
  }
  
  /**
   * 추가 메서드 입니다.
   * @param request
   * @param redirectAttributes
   * @return
   */
  @PostMapping("/addFaq.do")
  public String addFaq(HttpServletRequest request, RedirectAttributes redirectAttributes) {
    int addResult = faqService.addFaq(request);
    redirectAttributes.addFlashAttribute("addResult", addResult);
    return "redirect:/cs/faqList.do";
  }
  
  /**
   * 수정 메서드 입니다.
   * @param request
   * @param redirectAttributes
   * @return
   */
  @PostMapping("/modifyFaq.do")
  public String modifyFaq(HttpServletRequest request, RedirectAttributes redirectAttributes) {
    int modifyResult = faqService.modifyFaq(request);
    redirectAttributes.addFlashAttribute("modifyResult", modifyResult);
    return "redirect:/cs/faqList.do";
  }
  
  /**
   * 삭제 메서드입니다.
   * @param faqNo
   * @param redirectAttributes
   * @return
   */
  @PostMapping("/removeFaq.do")
  public String removeFaq(@RequestParam(value="faqNo") int faqNo, RedirectAttributes redirectAttributes) {
    int removeResult = faqService.removeFaq(faqNo);
    redirectAttributes.addFlashAttribute("removeResult", removeResult);
    return "redirect:/cs/faqList.do";
  }
  


}
