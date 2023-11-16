package com.mountaintour.mountain.service;

import org.springframework.stereotype.Service;

import com.mountaintour.mountain.dao.MainMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MainServiceImpl implements MainServce {

  private final MainMapper mainMapper;
 
}
