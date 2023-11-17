package com.mountaintour.mountain.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mountaintour.mountain.dto.ProductDto;

@Mapper
public interface MainMapper {
  public List<Integer> selectCountBest();
  public List<ProductDto> selectGetProduct(List<Integer> no);
}
