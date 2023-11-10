package com.mountaintour.mountain.service;

import org.springframework.stereotype.Service;

import com.mountaintour.mountain.dao.ReserveMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ReserveServiceImpl implements ReserveService{

  private final ReserveMapper reserveMapper;
  
}
