package com.mountaintour.mountain.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mountaintour.mountain.dto.FaqDto;

@Mapper
public interface FaqMapper {
  public int getFaqCount();
  public List<FaqDto> getFaqList(Map<String, Object> map);
}
