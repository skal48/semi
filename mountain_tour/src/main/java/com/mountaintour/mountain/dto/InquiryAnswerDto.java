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
public class InquiryAnswerDto {

  private int answerNo;
  private InquiryDto inquiryDto; // int inquiryNo
  private UserDto userDto;       // int userNo
  private String title;
  private String contents;
  private int hit;
  private Date createdAt;
  private Date modifiedAt;
  
}


