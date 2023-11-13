package com.mountaintour.mountain.service;

import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import javax.servlet.http.HttpServletRequest;


import org.jsoup.Jsoup;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mountaintour.mountain.dao.ProductMapper;
import com.mountaintour.mountain.dto.ImageDto;
import com.mountaintour.mountain.dto.ProductDto;
import com.mountaintour.mountain.util.MyFileUtils;

import lombok.RequiredArgsConstructor;
import net.coobird.thumbnailator.Thumbnails;

@RequiredArgsConstructor
@Service
public class ProductServiceImpl implements ProductService {

	private final ProductMapper productMapper;
	private final MyFileUtils myFileUtils;
	
	
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
	
	
	@Override
	public int addProduct(HttpServletRequest request) {
		
		String tripName = request.getParameter("tripName");
  	    String tripContents = request.getParameter("tripContents");
	    int userNo;
	    
	    try {
	        userNo = Integer.parseInt(request.getParameter("userNo"));
	    } catch (NumberFormatException e) {
	        // userNo가 숫자로 변환할 수 없을 때의 처리
	        userNo = 0; // 또는 다른 기본값 설정
	    }
	    // ProductDto 생성
	    ProductDto product = ProductDto.builder()
	                    .tripName(tripName)
	                    .tripContents(tripContents)
	                    .userNo(userNo) 
	                    .build();
	    

	    int addResult = productMapper.insertProduct(product);
	    
	    // Editor에 추가한 이미지 목록 가져와서 BLOG_IMAGE_T에 저장하기
	    for(String editorImage : getEditorImageList(tripContents)) {
	      ImageDto productImage = ImageDto.builder()
	          .productNo(product.getProductNo())
	          .imagePath(myFileUtils.getBlogImagePath())
	          .filesystemName(editorImage)
	          .build();
	      productMapper.insertImage(productImage);
	    }
	    
	    return addResult;
	    
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
	
	
	
	
	
	
	
//	@Override
//	public boolean addProduct(MultipartHttpServletRequest multipartRequest) throws Exception {
//		
//		 	String tripName = multipartRequest.getParameter("tripName");
//		    String tripContents = multipartRequest.getParameter("tripContents");
//		    int userNo = Integer.parseInt(multipartRequest.getParameter("userNo"));
//		    
//		     product = .builder()
//		                        .tripName(tripName)
//		                        .tripContents(tripContents)
//		                        .userNo(userNo) 
//		                        .build();
//		    
//		    int productCount = productMapper.insertProduct(product);
//		    
//		    List<MultipartFile> files = multipartRequest.getFiles("files");
//		    
//		    int imageCount;
//		    if(files.get(0).getSize() == 0) {
//		      imageCount = 1;
//		    } else {
//		      imageCount = 0;
//		    }
//		    
//		    for(MultipartFile multipartFile : files) {
//		      
//		      if(multipartFile != null && !multipartFile.isEmpty()) {
//		        
//		        String path = myFileUtils.getUploadPath();
//		        File dir = new File(path);
//		        if(!dir.exists()) {
//		          dir.mkdirs();
//		        }
//		        
//		        String originalFilename = multipartFile.getOriginalFilename();
//		        String filesystemName = myFileUtils.getFilesystemName(originalFilename);
//		        File file = new File(dir, filesystemName);
//		        
//		        multipartFile.transferTo(file);
//		        
//		        String contentType = Files.probeContentType(file.toPath()); 
//		        int thumbnail = (contentType != null && contentType.startsWith("image")) ? 1 : 0;
//		        
//		        if(thumbnail == 1) {
//		          File thumbnailFile = new File(dir, "s_" + filesystemName);  // small 이미지를 의미하는 s_을 덧붙임
//		          Thumbnails.of(file)
//		                    .size(100, 100)   
//		                    .toFile(thumbnailFile);
//		        }
//		        
//		        ImageDto image = ImageDto.builder()
//		                            .imagePath(path)
//		                            .filesystemName(filesystemName)
//		                            .thumbnail(thumbnail)
//		                            .productNo(product.getProductNo())
//		                            .build();
//		        
//		        imageCount += productMapper.insertImage(image);
//		        
//		      }  
//		      
//		    }
//		    
//		    return (productCount == 1) && (files.size() == imageCount);
//		    
//		  }
	}

