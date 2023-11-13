package com.mountaintour.mountain.service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.mountaintour.mountain.dao.ReserveMapper;
import com.mountaintour.mountain.dto.ProductDto;
import com.mountaintour.mountain.dto.ReserveDto;
import com.mountaintour.mountain.dto.UserDto;
import com.mountaintour.mountain.util.MyPageUtils;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ReserveServiceImpl implements ReserveService{

  private final ReserveMapper reserveMapper;
  private final MyPageUtils myPageUtils;
  
  
  @Override
  public int addReserve(HttpServletRequest req) {
    String request = req.getParameter("resReq");
    int agree = Integer.parseInt(req.getParameter("chkAgree"));
    String pickupLoc = req.getParameter("pickupLoc");
    // reserveStart, reserveFinish 
    int reservePerson = Integer.parseInt(req.getParameter("reservePerson"));
    int userNo = Integer.parseInt(req.getParameter("userNo"));
    int productNo = Integer.parseInt(req.getParameter("productNo"));
    
    ReserveDto reserve = ReserveDto.builder()
                              .request(request)
                              .agree(agree)
                              .pickupLoc(pickupLoc)
                              .reservePerson(reservePerson)
                              .userDto(UserDto.builder()
                                              .userNo(userNo)
                                              .build())
                              .productDto(ProductDto.builder()
                                                    .productNo(productNo)
                                                    .build())
                              .build();
    
    return reserveMapper.insertReserve(reserve);
  }
  
  
  
  
  @Override
  public ReserveDto loadReserve(int reserveNo) {
    return reserveMapper.getReserve(reserveNo);
  }
  
  
  @Override
  public void loadReserveList(HttpServletRequest request, Model model) {
    
    Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
    int page = Integer.parseInt(opt.orElse("1"));
    int total = reserveMapper.getReserveCount();
    int display = 10;
    
    myPageUtils.setPaging(page, total, display);
    
    Map<String, Object> map = Map.of("begin", myPageUtils.getBegin()
                                   , "end", myPageUtils.getEnd()); 
    
    List<ReserveDto> reserveList = reserveMapper.getReserveList(map);
    
    model.addAttribute("reserveList", reserveList);
    model.addAttribute("paging", myPageUtils.getMvcPaging(request.getContextPath() + "/reserve/list.do"));
    model.addAttribute("beginNo", total - (page - 1) * display);
    
  }
  
}
