package com.mountaintour.mountain.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mountaintour.mountain.dto.FaqDto;

@Mapper
public interface FaqMapper {
<<<<<<< HEAD
  public int getFaqCount();
  public List<FaqDto> getFaqList(Map<String, Object> map);
=======
  
  public int getFaqCount();
  public List<FaqDto> getFaqList(Map<String, Object> map);
  
  public int getSearchCount(Map<String, Object> map);
  public List<FaqDto> getSearchFaq(Map<String, Object> map);
>>>>>>> main
}
