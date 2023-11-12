package com.mountaintour.mountain.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.mountaintour.mountain.dto.InquiryDto;

public interface InquiryService {
  
  // List
  public void loadInquiryList(HttpServletRequest request, Model model);
  
  // Search
  public void loadSearchList(HttpServletRequest request, Model model);
  
  // Detail
  public InquiryDto getInquiry(int inquiryNo);
  
  // Insert
  public int addInquiry(HttpServletRequest request);

}