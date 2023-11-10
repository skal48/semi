package com.mountaintour.mountain.service;


import java.util.HashMap;
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


  /**
   * 전체목록을 반환하는 메서드입니다.
   * MVC 페이징 처리 했습니다.
   */

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
    

    // faqList, paging, beginNo, total 전달
    model.addAttribute("faqList", faqList);
    model.addAttribute("paging", myPageUtils.getMvcPaging(request.getContextPath() + "/cs/faqList.do"));
    model.addAttribute("beginNo", total - (page -1) * display);
    model.addAttribute("total", total);
    
  }
  
  /**
   * 검색결과를 반환하는 메서드입니다.
   */
  @Override
  public void loadSearchList(HttpServletRequest request, Model model) {
    
    String column = request.getParameter("column");
    String query = request.getParameter("query");
    
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("column", column);
    map.put("query", query);
    
    int total = faqMapper.getSearchCount(map);
    
    Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
    String strPage = opt.orElse("1");
    int page = Integer.parseInt(strPage);
    
    int display = 10;
    
    myPageUtils.setPaging(page, total, display);
    
    map.put("begin", myPageUtils.getBegin());
    map.put("end", myPageUtils.getEnd());
    
    List<FaqDto> faqList = faqMapper.getSearchFaq(map);
    
    model.addAttribute("faqList", faqList);
    model.addAttribute("paging", myPageUtils.getMvcPaging(request.getContextPath() + "/cs/faqSearch.do?column=" + column + "&query=" + query));
    model.addAttribute("beginNo", total - (page -1) * display);
    model.addAttribute("total", total);

    
  }
  
  /**
   * 삭제하는 매서드입니다.
   */
  @Override
  public int removeFaq(int faqNo) {
    return faqMapper.deleteFaq(faqNo);
  }
  
}



















