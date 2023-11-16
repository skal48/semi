package com.mountaintour.mountain.controller;

import org.springframework.stereotype.Controller;

import com.mountaintour.mountain.service.MainServce;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class MainController {
  
  private final MainServce mainServce;
}
