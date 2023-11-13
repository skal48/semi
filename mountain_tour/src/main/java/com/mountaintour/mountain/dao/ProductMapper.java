package com.mountaintour.mountain.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mountaintour.mountain.dto.ImageDto;
import com.mountaintour.mountain.dto.ProductDto;

@Mapper
public interface ProductMapper {
	public int insertProduct(ProductDto product);
	public int insertImage(ImageDto image);
	public int getProductCount();
	public List<ProductDto> getProductList(Map<String, Object> map);
	public ProductDto getProduct(int productNo);
	public void updateProduct(ProductDto product);
	public void deleteProduct(int productNo);
}
