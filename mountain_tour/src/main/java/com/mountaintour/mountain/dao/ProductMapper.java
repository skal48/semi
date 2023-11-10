package com.mountaintour.mountain.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mountaintour.mountain.dto.ProductDto;

@Mapper
public interface ProductMapper {
	public void insertProduct(ProductDto product);
	public ProductDto getProduct(int productNo);
	public void updateProduct(ProductDto product);
	public void deleteProduct(int productNo);
}
