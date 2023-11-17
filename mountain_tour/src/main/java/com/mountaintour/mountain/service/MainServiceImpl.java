package com.mountaintour.mountain.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.mountaintour.mountain.dao.MainMapper;
import com.mountaintour.mountain.dto.ImageDto;
import com.mountaintour.mountain.dto.ProductDto;
import com.mountaintour.mountain.dto.ReserveDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MainServiceImpl implements MainServce {

  private final MainMapper mainMapper;
 
  
  @Override
  public Map<String, Object> getProductBest() {
    
   
    List<Integer> no = mainMapper.selectCountBest();
    List<ProductDto> productName = mainMapper.selectGetProduct(no);
    
    return Map.of("product",productName);
  }
}
