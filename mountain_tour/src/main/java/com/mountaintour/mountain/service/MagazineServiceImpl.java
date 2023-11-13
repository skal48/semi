package com.mountaintour.mountain.service;

import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.mountaintour.mountain.dao.MagazineMapper;
import com.mountaintour.mountain.util.MyPageUtils;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MagazineServiceImpl implements MagazineService {
  
  private MagazineMapper magazineMapper;
  private MyPageUtils myPageUtils;
  
  @Override
  public Map<String, Object> getMagazineList(HttpServletRequest request) {
    Optional<String> opt = Optional.of(request.getParameter("page"));
    int page = Integer.parseInt(opt.orElse("1"));
    int total = magazineMapper.getMagazineCount();
    int display = 6;
    
    
    return null;
  }
  
  
}
