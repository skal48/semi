package com.mountaintour.mountain.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.mountaintour.mountain.dao.ReserveMapper;
import com.mountaintour.mountain.dto.ProductDto;
import com.mountaintour.mountain.dto.ReserveDto;
import com.mountaintour.mountain.dto.TouristDto;
import com.mountaintour.mountain.dto.UserDto;
import com.mountaintour.mountain.util.MyPageUtils;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ReserveServiceImpl implements ReserveService{

  private final ReserveMapper reserveMapper;
  private final MyPageUtils myPageUtils;
  
  SimpleDateFormat sdf = new SimpleDateFormat();
  
  @Override
  public Map<String, Object> addReserve(HttpServletRequest req) throws Exception {
    
    String oldFormat = "MM/dd/yyyy";
    String newFormat = "yyyy/MM/dd";

//    String oldDateString = "11/15/2023";
    String resStart = req.getParameter("resStart"); 
    
    SimpleDateFormat sdf = new SimpleDateFormat(oldFormat);
    Date d = sdf.parse(resStart); 
    sdf.applyPattern(newFormat);
    String reserveStart = sdf.format(d); // 20231115
    
    String request = req.getParameter("resReq");
    int agree = Integer.parseInt(req.getParameter("chkAgree"));
    String pickupLoc = req.getParameter("pickupLoc");
    int reservePerson = Integer.parseInt(req.getParameter("reservePerson"));
    int userNo = Integer.parseInt(req.getParameter("userNo"));
    int productNo = Integer.parseInt(req.getParameter("productNo"));
    
    ReserveDto reserve = ReserveDto.builder()
                              .request(request)
                              .agree(agree)
                              .pickupLoc(pickupLoc)
                              .reserveStart(reserveStart)
                              .reservePerson(reservePerson)
                              .userDto(UserDto.builder()
                                              .userNo(userNo)
                                              .build())
                              .productDto(ProductDto.builder()
                                                    .productNo(productNo)
                                                    .build())
                              .build();
    
    int addReserveResult = reserveMapper.insertReserve(reserve);
    
    return Map.of("addReserveResult", addReserveResult, "reserveNo", reserve.getReserveNo());
  }
  
  @Override
  public int addTourist(HttpServletRequest req) throws Exception {

    String oldFormat = "yyyy-MM-dd";
    String newFormat = "yyyy/MM/dd";
    SimpleDateFormat sdf = new SimpleDateFormat(oldFormat);
    

    String[] names = req.getParameterValues("touristName");
    String[] bDates = req.getParameterValues("birthDate");
    String[] genders = req.getParameterValues("gender");
    String[] contacts = req.getParameterValues("tourContact");
    String[] ageCases = req.getParameterValues("ageCase");
    int reserveNo = Integer.parseInt(req.getParameter("reserveNo"));
    
    int result = 0;
    for (int i = 0; i < names.length; i++) {
      if (bDates[i] != null && !bDates[i].isEmpty()) {
        Date d = sdf.parse(bDates[i]);
        sdf.applyPattern(newFormat);
        String birthDate = sdf.format(d); 
        
        int ageCase = Integer.parseInt(ageCases[i]);
        
        TouristDto tourist = TouristDto.builder()
            .name(names[i])
            .birthDate(birthDate)
            .gender(genders[i])
            .contact(contacts[i])
            .ageCase(ageCase)
            .reserveDto(ReserveDto.builder()
                .reserveNo(reserveNo)
                .build())
            .build();
        result += reserveMapper.insertTourist(tourist);
      } else {
        System.out.println(bDates[i].toString());
      }
    }
    return result;
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
