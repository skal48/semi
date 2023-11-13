package com.mountaintour.mountain.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mountaintour.mountain.dto.ImageDto;
import com.mountaintour.mountain.dto.ProductDto;

@Mapper
public interface ProductMapper {
	public int insertProduct(ProductDto product);
	public int insertImage(ImageDto image);
	public ProductDto getProductNo();
	public ProductDto getProduct(int productNo);
	public void updateProduct(ProductDto product);
	public void deleteProduct(int productNo);
}
