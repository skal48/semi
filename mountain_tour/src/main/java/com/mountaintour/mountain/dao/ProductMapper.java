package com.mountaintour.mountain.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mountaintour.mountain.dto.ImageDto;
import com.mountaintour.mountain.dto.ProductDto;

@Mapper
public interface ProductMapper {
	public int insertProduct(ProductDto product);
	public int insertProductImage(ImageDto image);
	public List<ImageDto> getProductImageInYesterday();
	public int getProductCount();
	public List<ProductDto> getProductList(Map<String, Object> map);
	public List<ImageDto> getAttachList(int productNo);
	public ProductDto getProduct(int productNo);
	public int productHit(int productNo);
	public int updateProduct(ProductDto product);
	public List<ImageDto> getProductImageList(int productNo);
	public int deleteProductImage(String filesystemName);
	public int deleteProductImageList(int productNo);
	public int deleteProduct(int productNo);
}
