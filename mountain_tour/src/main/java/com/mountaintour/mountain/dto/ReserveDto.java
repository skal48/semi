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
public class ReserveDto {
  private int reserveNo;
  private Date reserveDate;
  private String request;
  private int agree;
  private String pickupLoc;
  private int reserveStatus;
  private Date reserveStart;
  private Date reserveFinish;
  private int reservePerson;
  private ProductDto productDto; // private int productNo;
  private UserDto userDto;       // private int userNo;
}
