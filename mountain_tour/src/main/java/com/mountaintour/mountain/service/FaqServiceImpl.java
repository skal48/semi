package com.mountaintour.mountain.service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.mountaintour.mountain.dao.FaqMapper;
import com.mountaintour.mountain.dto.FaqDto;
import com.mountaintour.mountain.util.MyPageUtils;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class FaqServiceImpl implements FaqService {
  
  private final FaqMapper faqMapper;
  private final MyPageUtils myPageUtils;

  @Override
  public void loadFaqList(HttpServletRequest request, Model model) {
    
    Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
    int page = Integer.parseInt(opt.orElse("1"));
    int total = faqMapper.getFaqCount();
    int display = 10;
    
    myPageUtils.setPaging(page, total, display);
    
    Map<String, Object> map = Map.of("begin", myPageUtils.getBegin()
                                   , "end", myPageUtils.getEnd());
    
    List<FaqDto> faqList = faqMapper.getFaqList(map);
    
    model.addAttribute("faqList", faqList);
    model.addAttribute("paging", myPageUtils.getMvcPaging(request.getContextPath() + "/cs/faqList.do"));
    model.addAttribute("beginNo", total - (page -1) * display);
    
    
  }
  
}



















