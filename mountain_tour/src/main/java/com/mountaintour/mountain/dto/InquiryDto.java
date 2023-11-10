package com.mountaintour.mountain.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class InquiryDto {
  
  private int inquiryNo;
  private int userNo;    //UserDto userDto;
  private int productNo; //ProductDto productDto;
  private String inquiryTitle;
  private String inauiryContents;
  private String ip;
  private int hit;
  private Date createdAt;

}

