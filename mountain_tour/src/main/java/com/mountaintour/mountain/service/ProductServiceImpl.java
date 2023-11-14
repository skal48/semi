package com.mountaintour.mountain.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import javax.servlet.http.HttpServletRequest;


import org.jsoup.Jsoup;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mountaintour.mountain.dao.ProductMapper;
import com.mountaintour.mountain.dto.ImageDto;
import com.mountaintour.mountain.dto.MountainDto;
import com.mountaintour.mountain.dto.ProductDto;
import com.mountaintour.mountain.util.MyFileUtils;
import com.mountaintour.mountain.util.MyPageUtils;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ProductServiceImpl implements ProductService {

	private final ProductMapper productMapper;
	private final MyFileUtils myFileUtils;
	private final MyPageUtils myPageUtils;
	
	
	@Override
	public Map<String, Object> imageUpload(MultipartHttpServletRequest multipartRequest) {
		 // 이미지가 저장될 경로
	    String imagePath = myFileUtils.getBlogImagePath();
	    File dir = new File(imagePath);
	    if(!dir.exists()) {
	      dir.mkdirs();
	    }
	    
	    // 이미지 파일 (CKEditor는 이미지를 upload라는 이름으로 보냄)
	    MultipartFile upload = multipartRequest.getFile("upload");
	    
	    // 이미지가 저장될 이름
	    String originalFilename = upload.getOriginalFilename();
	    String filesystemName = myFileUtils.getFilesystemName(originalFilename);
	    
	    // 이미지 File 객체
	    File file = new File(dir, filesystemName);
	    
	    // 저장
	    try {
	      upload.transferTo(file);
	    } catch (Exception e) {
	      e.printStackTrace();
	    }
	    
	    // CKEditor로 저장된 이미지의 경로를 JSON 형식으로 반환해야 함
	    return Map.of("uploaded", true
	                , "url", multipartRequest.getContextPath() + imagePath + "/" + filesystemName);

	  }
	
	
	public int addProduct(HttpServletRequest request) {
	    try {
	        String userNoStr = request.getParameter("userNo");
	        if (userNoStr == null || userNoStr.isEmpty()) {
	            // userNo 파라미터가 없거나 비어있을 경우 처리
	            // 예를 들어 기본값을 사용하거나 오류 처리 로직을 추가할 수 있습니다.
	            return -1; // 예시로 -1을 반환하였습니다. 실제 상황에 맞게 처리해주세요.
	        }
	        int userNo = Integer.parseInt(userNoStr);

	        // 다른 파라미터들에 대한 유사한 방어 코드 추가

	        // ProductDto 생성
	        ProductDto product = ProductDto.builder()
	                .userNo(userNo)
	                .mountainDto(MountainDto.builder()
	                .mountainNo(1)
	                .build())
	                .tripName(request.getParameter("tripName"))
	                .tripContents(request.getParameter("tripContents"))
	                .guide(request.getParameter("guide"))
	                .timetaken(request.getParameter("timetaken"))
	                .price(Integer.parseInt(request.getParameter("price")))
	                .danger(request.getParameter("danger"))
	                .plan(request.getParameter("plan"))
	                .termUse(request.getParameter("termUse"))
	                .build();

	        // 나머지 로직 추가

	        int addResult = productMapper.insertProduct(product);

	        // 추가 로직에 따라 결과 반환
	        return addResult;
	    } catch (NumberFormatException e) {
	        // 숫자 변환 오류 발생 시 처리
	        e.printStackTrace(); // 또는 로깅 등의 작업 수행
	        return -1; // 예시로 -1을 반환하였습니다. 실제 상황에 맞게 처리해주세요.
	    }
	}

	
	@Override
	public List<String> getEditorImageList(String contents) {
		
		List<String> editorImageList = new ArrayList<>();
		    
	    Document document = Jsoup.parse(contents);
		Elements elements =  document.getElementsByTag("img");
		    
		 if(elements != null) {
		   for(Element element : elements) {
		     String src = element.attr("src");
		     String filesystemName = src.substring(src.lastIndexOf("/") + 1);
		      editorImageList.add(filesystemName);
		  }
		 }
		    
	 return editorImageList;
	}
	
	@Transactional(readOnly=true)
	@Override
	public Map<String, Object> getProductList(HttpServletRequest request) {
		
		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
	    int page = Integer.parseInt(opt.orElse("1"));
	    int total = productMapper.getProductCount();
	    int display = 9;
	    
	    myPageUtils.setPaging(page, total, display);
	    
	    Map<String, Object> map = Map.of("begin", myPageUtils.getBegin()
	                                   , "end", myPageUtils.getEnd());
	    System.out.println(map);
	    List<ProductDto> productList = productMapper.getProductList(map);
	    return Map.of("productList", productList
	                , "totalPage", myPageUtils.getTotalPage());
	    
	}
	
	@Transactional(readOnly=true)
	@Override
	public void attachUpload(HttpServletRequest request, Model model) {
	    
	    Optional<String> opt = Optional.ofNullable(request.getParameter("productNo"));
	    int productNo = Integer.parseInt(opt.orElse("0"));
	    
	    model.addAttribute("productNo", productMapper.getProduct(productNo));
	    model.addAttribute("attachList", productMapper.getAttachList(productNo));
	    
	  }
	
	@Transactional(readOnly=true)
	@Override
	public ProductDto getProduct(int productNo) {
	  return productMapper.getProduct(productNo);
	}
	
	@Override
	public int increseHit(int productNo) {
	  return productMapper.productHit(productNo);
	}
	
	@Override
	public int modifyProduct(HttpServletRequest request) {
		//** 수정된 메소드 **//
	    
	    // 수정할 제목/내용/블로그번호
		    int productNo = Integer.parseInt(request.getParameter("productNo"));
		    int price = Integer.parseInt(request.getParameter("price"));
		    String tripContents = request.getParameter("tripContents");
		    
	    List<ImageDto> productImageDtoList = productMapper.getProductImageList(productNo);
	    List<String> productImageList = productImageDtoList.stream()
	                                  .map(productImageDto -> productImageDto.getFilesystemName())
	                                  .collect(Collectors.toList());
	        
	    // Editor에 포함된 이미지 이름(filesystemName)
	    List<String> editorImageList = getEditorImageList(tripContents);

	    // Editor에 포함되어 있으나 기존 이미지에 없는 이미지는 IMAGE_T에 추가해야 함
	    editorImageList.stream()
	      .filter(editorImage -> !productImageList.contains(editorImage))        
	      .map(editorImage -> ImageDto.builder()                      
	                            .productNo(productNo)
	                            .imagePath(myFileUtils.getBlogImagePath())
	                            .filesystemName(editorImage)
	                            .build())
	      .forEach(productImageDto -> productMapper.insertProductImage(productImageDto)); 
	    	   
	    // 기존 이미지에 있으나 Editor에 포함되지 않은 이미지는 삭제해야 함
	    List<ImageDto> removeList = productImageDtoList.stream()
	                                      .filter(productImageDto -> !editorImageList.contains(productImageDto.getFilesystemName())) 
	                                      .collect(Collectors.toList());                                                       

	    for(ImageDto productImageDto : removeList) {
	      // IMAGE_T에서 삭제
	      productMapper.deleteProductImage(productImageDto.getFilesystemName());  // 파일명은 UUID로 만들어졌으므로 파일명의 중복은 없다고 생각하면 된다.
	      // 파일 삭제
	      File file = new File(productImageDto.getImagePath(), productImageDto.getFilesystemName());
	      if(file.exists()) {
	        file.delete();
	      }
	    }
	    
	    
	    ProductDto product = ProductDto.builder()
			                .tripName(request.getParameter("tripName"))
			                .tripContents(tripContents)
			                .guide(request.getParameter("guide"))
			                .timetaken(request.getParameter("timetaken"))
			                .price(price)
			                .danger(request.getParameter("danger"))
			                .plan(request.getParameter("plan"))
			                .termUse(request.getParameter("termUse"))
			                .productNo(productNo)
			                .build();
	    
	    
	    int modifyResult = productMapper.updateProduct(product);
	    
	    return modifyResult;
	    
	}	

	@Override
	public int removeProduct(int productNo) {	  
	     
	  List<ImageDto> productImageList = productMapper.getProductImageList(productNo);
	    for(ImageDto productImage : productImageList) {
	      File file = new File(productImage.getImagePath(), productImage.getFilesystemName());
	      if(file.exists()) {
	        file.delete();
	      }
	    }	    
	    
	    productMapper.deleteProductImageList(productNo);
	    
	    return productMapper.deleteProduct(productNo);
	}
}	
