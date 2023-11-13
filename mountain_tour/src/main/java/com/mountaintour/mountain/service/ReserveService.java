package com.mountaintour.mountain.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.mountaintour.mountain.dto.ReserveDto;

public interface ReserveService {
  
  public int addReserve(HttpServletRequest req);
  public ReserveDto loadReserve(int reserveNo);
  public void loadReserveList(HttpServletRequest request, Model model);
}
