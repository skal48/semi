package com.mountaintour.mountain.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mountaintour.mountain.dto.ImageDto;
import com.mountaintour.mountain.dto.ProductDto;
import com.mountaintour.mountain.service.ProductService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RequestMapping("/product")
@Controller
public class ProductController {

  private final ProductService productService;
	
  @GetMapping("/list.do")
  public String list(Model model) {
	 return "product/list"; 
	}
  
  @GetMapping("/write.form")
  public String write() {
	 return "product/write"; 
	}
  @PostMapping("/add.do")
  public String add(MultipartHttpServletRequest multipartRequest, RedirectAttributes redirectAttributes) throws Exception {
      int addResult = productService.addProduct(multipartRequest);

      if (addResult == 1) {
          redirectAttributes.addFlashAttribute("successMessage", "Product added successfully!");
      } else {
          redirectAttributes.addFlashAttribute("errorMessage", "Failed to add product. Please try again.");
      }

      return "redirect:/product/list.do";
  }

  
  @ResponseBody
  @PostMapping(value="/addThumbnail.do", produces="application/json")
  public Map<String, Object> addThumbnail(MultipartHttpServletRequest multipartRequest) throws Exception {
    return productService.addThumbnail(multipartRequest);
  }
  
  @ResponseBody
  @PostMapping(value="/imageUpload.do", produces="application/json")
  public Map<String, Object> imageUpload(MultipartHttpServletRequest multipartRequest) {
    return productService.imageUpload(multipartRequest);
  }
  
  @ResponseBody
  @GetMapping(value="/getThumbnail.do", produces="application/json")
  public Map<String, Object> getThumbnail(@PathVariable int productNo, Model model){
	  ImageDto imageDto = productService.getThumbnail(productNo);

      // 이미지 정보를 Model에 추가하여 JSP로 전달
      model.addAttribute("imageDto", imageDto);

      return "image/showThumbnail"; // JSP 파일의 경로
  }
  
  @ResponseBody
  @GetMapping(value="/getList.do", produces="application/json")
  public Map<String, Object> getList(HttpServletRequest request){
    return productService.getProductList(request);
  }  
  
  @GetMapping("/detail.do")
  public String detail(@RequestParam(value="productNo", required=false, defaultValue="0") int productNo
          , Model model) {
	 ProductDto product = productService.getProduct(productNo);
	 model.addAttribute("product", product);
	 return "product/detail"; 
	}
  
  @PostMapping("/edit.do")
  public String edit(@ModelAttribute("product") ProductDto product) {
    return "product/edit";
  }
  
  @PostMapping("/modifyProduct.do")
  public String modifyProduct(HttpServletRequest request, RedirectAttributes redirectAttributes) {
	  int modifyResult = productService.modifyProduct(request);
	  redirectAttributes.addFlashAttribute("modifyResult", modifyResult);
	  return "redirect:/product/detail.do?productNo=" + request.getParameter("productNo"); 
	}
  
  @PostMapping("/remove.do")
  public String remove(@RequestParam(value="productNo", required=false, defaultValue="0") int productNo
                     , RedirectAttributes redirectAttributes) {
    int removeResult = productService.removeProduct(productNo);
    redirectAttributes.addFlashAttribute("removeResult", removeResult);
    return "redirect:/product/list.do";
  }
}
