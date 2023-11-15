package com.mountaintour.mountain.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mountaintour.mountain.dto.MagazineDto;
import com.mountaintour.mountain.dto.MagazineMultiDto;
import com.mountaintour.mountain.dto.ProductDto;

@Mapper
public interface MagazineMapper {
  public List<MagazineDto> magazineList(Map<String, Object> map);
  public int getMagazineCount();
  public List<ProductDto> getProductNo();
  public int insertMagazineOne(MagazineDto magazineDto);
  public int insertMagazineMulti(MagazineMultiDto magazineMultiDto);
  public int insertMagazineTwo(MagazineDto magazineDto);
  public int insertThumbnail(MagazineMultiDto magazineMultiDto);
  public MagazineDto getMagazine(int magazineNo);
  public int countLike(int magazineNo);
  public int deleteMagazine(int magazineNo);
}
