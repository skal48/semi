package com.mountaintour.mountain.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mountaintour.mountain.dto.NoticeDto;
import com.mountaintour.mountain.service.NoticeService;

import lombok.RequiredArgsConstructor;

@RequestMapping("/notice")
@RequiredArgsConstructor
@Controller
public class NoticeController {
  
  private final NoticeService noticeService;
  
  @GetMapping("/list.do")
  public String list(HttpServletRequest request, Model model) {
    noticeService.loadNoticeList(request, model);
    return "notice/list";
  }
  
  @GetMapping("/write.form")
  public String write() {
    return "notice/write";
  }
  
  @GetMapping("/detail.do")
  public String detail(@RequestParam(value="noticeNo", required=false, defaultValue="0") int noticeNo 
                     , Model model) {
    NoticeDto notice = noticeService.getNotice(noticeNo);
    model.addAttribute("notice", notice);
    return "notice/detail";
  }
  
}
  

