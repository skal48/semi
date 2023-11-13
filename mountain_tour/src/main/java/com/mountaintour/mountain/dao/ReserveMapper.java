package com.mountaintour.mountain.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mountaintour.mountain.dto.ReserveDto;

@Mapper
public interface ReserveMapper {
  
  public int insertReserve(ReserveDto reserve);
  
  public ReserveDto getReserve(int reserveNo);
  public int getReserveCount();
  public List<ReserveDto> getReserveList(Map<String, Object> map);
  
  
}
