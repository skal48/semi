package com.mountaintour.mountain.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mountaintour.mountain.dto.ReserveDto;
import com.mountaintour.mountain.service.ReserveService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RequestMapping("/reserve")
@Controller
public class ReserveController {
  
  private final ReserveService reserveService;

  // 상품상세에서 요청이 올 때 데이터 받아서 저장하기
  @GetMapping("/write.form")
  public String reserve() {
    return "reserve/write";
  }
  
  @GetMapping("/detail.do")
  public String detail(@RequestParam(value="reserveNo", required = false, defaultValue = "0") int reserveNo, Model model) {
    ReserveDto reserve = reserveService.loadReserve(reserveNo);
    model.addAttribute("reserve", reserve);
    return "reserve/detail";
  }
  
  @GetMapping("/list.do")
  public String list(HttpServletRequest request, Model model) {
    reserveService.loadReserveList(request, model);
    return "reserve/list";
  }
  
  
  @PostMapping("/addReserve.do")
  public String addReserve(HttpServletRequest req, RedirectAttributes redirectAttributes) {
    int addResult = reserveService.addReserve(req);
    redirectAttributes.addFlashAttribute("addResult", addResult);
    return "redirect:/detail.do";
  }
  
  
  
  
  
}
