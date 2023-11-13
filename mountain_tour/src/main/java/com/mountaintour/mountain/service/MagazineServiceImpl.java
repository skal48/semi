package com.mountaintour.mountain.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.mountaintour.mountain.dao.MagazineMapper;
import com.mountaintour.mountain.dto.MagazineDto;
import com.mountaintour.mountain.dto.MagazineMultiDto;
import com.mountaintour.mountain.dto.ProductDto;
import com.mountaintour.mountain.util.MagazineFileUtils;
import com.mountaintour.mountain.util.MyPageUtils;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MagazineServiceImpl implements MagazineService {
  
  private final MagazineMapper magazineMapper;
  private final MyPageUtils myPageUtils;
  private final MagazineFileUtils magazineFileUtils; 
  
  @Override
  public Map<String, Object> getMagazineList(HttpServletRequest request) {
    Optional<String> opt = Optional.of(request.getParameter("page"));
    int page = Integer.parseInt(opt.orElse("1"));
    int total = magazineMapper.getMagazineCount();
    int display = 6;
    
    
    return null;
  }
  
  @Override
  public Map<String, Object> loadProductNo() {
    
    List<ProductDto> list = magazineMapper.getProductNo();
    System.out.println(list);
    return Map.of("list", list);
  }
  
  @Override
  public int firstUpload(HttpServletRequest request)  {
    
    String title = request.getParameter("title");
    String contents = request.getParameter("contents");
    int userNo = Integer.parseInt(request.getParameter("userNo"));
    int productNo = Integer.parseInt(request.getParameter("productNo"));
    
    MagazineDto magazine = MagazineDto.builder()
                                        .userNo(userNo)
                                        .title(title)
                                        .contents(contents)
                                        .productNo(productNo)
                                        .build();
    int addResult = magazineMapper.InsertMagazineOne(magazine);
    
    //매거진 작성시 사용한 이미지 목록(jsoup 라이브러리 사용)
   
      for(String editorImage : getEditorImageList(contents)) {
        MagazineMultiDto magazineMulti = MagazineMultiDto.builder()
                                        .magazineNo(magazine.getMagazineNo())
                                        .multiPath(magazineFileUtils.getMagazineImagePath())
                                        .filesysName(editorImage)
                                        .build();
        magazineMapper.insertMagazineMulti(magazineMulti);
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
  
  
  @Override
  public Map<String, Object> imageUpload(MultipartHttpServletRequest multipartRequest) {
   
    //이미지가 저장될 경로
    String imagePath = magazineFileUtils.getMagazineImagePath();
    File dir = new File(imagePath);
    if(!dir.exists()) {
     dir.mkdirs(); 
    }
    // 이미지 파일
    MultipartFile upload = multipartRequest.getFile("upload");
    
    //이미지가 저장될 경로 
    String originalFileName = upload.getOriginalFilename();
    String filesystemName = magazineFileUtils.getFilesystemName(originalFileName);
    
    File file = new File(dir, filesystemName);
    
    try {
      upload.transferTo(file);
    } catch (Exception e) {
      e.printStackTrace();
    }
 // url: "http://localhost:8080/myhome/blog/2023/10/27/파일명"
 // sevlet-context.xml에
 // /blog/** 주소 요청을 /blog 디렉터리로 연결하는 <resources> 태그를 추가해야 함

    return Map.of("uploaded", true
         , "url", multipartRequest.getContextPath() + imagePath + "/" + filesystemName); 
    
  }
  
  @Override
  public boolean addThumbnail(MultipartHttpServletRequest multipartRequest) throws Exception{
    
    String summary = multipartRequest.getParameter("summary");
    int magazineNo = Integer.parseInt(multipartRequest.getParameter("productNo")); 
    
    MagazineDto magazine = MagazineDto.builder()
                                    .magazineNo(magazineNo)
                                    .summary(summary)
                                    .build();
    
    int updateResult = magazineMapper.insertMagazineTwo(magazine);
    
    List<MultipartFile> files = multipartRequest.getFiles("files");
    
    // 첨부 없을 때 : [MultipartFile[field="files", filename=, contentType=application/octet-stream, size=0]]
    // 첨부 1개     : [MultipartFile[field="files", filename="animal1.jpg", contentType=image/jpeg, size=123456]]
    
    int attachCount;
    if(files.get(0).getSize() == 0) {
      attachCount = 1;
    } else {
      attachCount = 0;
    }
    
    for(MultipartFile multipartFile : files) {
      
      if(multipartFile != null && !multipartFile.isEmpty()) {
        
        String path = magazineFileUtils.getUploadPath();
        File dir = new File(path);
        if(!dir.exists()) {
          dir.mkdirs();
        }
      }
    }
    return false;
  }
  
  
  
}
