package com.mountaintour.mountain.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface MagazineService {
  
  public Map<String, Object> getMagazineList(HttpServletRequest request);
  public Map<String, Object> loadProductNo();
  public int firstUpload(HttpServletRequest request);  
  public Map<String, Object> imageUpload(MultipartHttpServletRequest mnultipartRequest);
}
