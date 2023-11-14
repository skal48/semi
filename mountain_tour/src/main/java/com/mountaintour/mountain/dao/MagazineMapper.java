package com.mountaintour.mountain.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mountaintour.mountain.dto.MagazineDto;
import com.mountaintour.mountain.dto.MagazineMultiDto;
import com.mountaintour.mountain.dto.ProductDto;

@Mapper
public interface MagazineMapper {
  public List<MagazineDto> MagazineList();
  public int getMagazineCount();
  public List<ProductDto> getProductNo();
  public int InsertMagazineOne(MagazineDto magazineDto);
  public int insertMagazineMulti(MagazineMultiDto magazineMultiDto);
  public int insertMagazineTwo(MagazineDto magazineDto);
  public int insertThumbnail(MagazineMultiDto magazineMultiDto);
}
