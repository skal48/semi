package com.mountaintour.mountain.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface MagazineService {
  
  public Map<String, Object> getMagazineList(HttpServletRequest request);
}
