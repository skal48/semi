package com.mountaintour.mountain.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mountaintour.mountain.dto.ProductDto;

public interface ProductService {
  public Map<String, Object> imageUpload(MultipartHttpServletRequest multipartRequest);
  public int addProduct(HttpServletRequest request);
  public List<String> getEditorImageList(String contents);
  public void productImageBatch();
  public Map<String, Object> getProductList(HttpServletRequest request);
  public void attachUpload(HttpServletRequest request, Model model);
  public ProductDto getProduct(int productNo);
  public int increseHit(int productNo);
  public int modifyProduct(HttpServletRequest request);
  public int removeProduct(int productNo);
}
