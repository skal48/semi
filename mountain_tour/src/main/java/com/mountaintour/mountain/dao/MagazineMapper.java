package com.mountaintour.mountain.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mountaintour.mountain.dto.MagazineDto;

@Mapper
public interface MagazineMapper {
  public List<MagazineDto> MagazineList();
  public int getMagazineCount();
}
