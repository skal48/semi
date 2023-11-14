package com.mountaintour.mountain.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.mountaintour.mountain.dao.ManageMapper;
import com.mountaintour.mountain.dao.UserMapper;
import com.mountaintour.mountain.dto.UserDto;
import com.mountaintour.mountain.util.MyPageUtils;
import com.mountaintour.mountain.util.MySecurityUtils;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ManageServiceImpl implements ManageService {

  private final UserMapper userMapper;
  private final ManageMapper manageMapper;
  private final MyPageUtils myPageUtils;
  private final MySecurityUtils mySecurityUtils;
  
  
  /**
   * 기존 회원 목록
   * MVC 페이징
   */
  @Override
  public void loadUserList(HttpServletRequest request, Model model) {

    Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
    int page = Integer.parseInt(opt.orElse("1"));
    int total = manageMapper.getUserCount();
    int display = 20;
    
    myPageUtils.setPaging(page, total, display);
    
    Map<String, Object> map = Map.of("begin", myPageUtils.getBegin()
                                   , "end", myPageUtils.getEnd());
    
    List<UserDto> userList = manageMapper.getUserList(map);
    
    model.addAttribute("userList", userList);
    model.addAttribute("paging", myPageUtils.getMvcPaging(request.getContextPath() + "/manage/memberList.form"));
    model.addAttribute("beginNo", total - (page - 1) * display);
    model.addAttribute("total", total);
    
  }
  
  /**
   * 기존 회원 검색
   */
  @Override
  public void loadSearchUserList(HttpServletRequest request, Model model) {
    
    String column = request.getParameter("column");
    String query = request.getParameter("query");
    
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("column", column);
    map.put("query", query);
    
    int total = manageMapper.getSearchUserCount(map);
    
    Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
    String strPage = opt.orElse("1");
    int page = Integer.parseInt(strPage);
    int display = 20;
    
    myPageUtils.setPaging(page, total, display);
    
    map.put("begin", myPageUtils.getBegin());
    map.put("end", myPageUtils.getEnd());
    
    List<UserDto> userList = manageMapper.getSearchUser(map);
    
    model.addAttribute("userList", userList);
    model.addAttribute("paging", myPageUtils.getMvcPaging(request.getContextPath() + "/manage/memberSearchList.do", "column=" + column + "&query=" + query));
    model.addAttribute("beginNo", total - (page - 1) * display);
    model.addAttribute("total", total);
    
  }
  
  /**
   * 기존 회원 상세
   */
  @Override
  public UserDto getUser(int userNo) {
    return userMapper.getUser(Map.of("userNo", userNo));
  }
  
  @Override
  public ResponseEntity<Map<String, Object>> modifyUser(HttpServletRequest request) {
    
    String name = mySecurityUtils.preventXSS(request.getParameter("name"));
    String gender = request.getParameter("gender");
    String mobile = request.getParameter("mobile");
    String postcode = request.getParameter("postcode");
    String roadAddress = request.getParameter("roadAddress");
    String jibunAddress = request.getParameter("jibunAddress");
    String detailAddress = mySecurityUtils.preventXSS(request.getParameter("detailAddress"));
    String event = request.getParameter("event");
    int agree = event.equals("on") ? 1 : 0;
    int userNo = Integer.parseInt(request.getParameter("userNo"));
    
    UserDto user = UserDto.builder()
                    .name(name)
                    .gender(gender)
                    .mobile(mobile)
                    .postcode(postcode)
                    .roadAddress(roadAddress)
                    .jibunAddress(jibunAddress)
                    .detailAddress(detailAddress)
                    .agree(agree)
                    .userNo(userNo)
                    .build();
    
    int modifyResult = userMapper.updateUser(user);
    
    return new ResponseEntity<Map<String,Object>>(Map.of("modifyResult", modifyResult), HttpStatus.OK);
  }
  
  
  
}
