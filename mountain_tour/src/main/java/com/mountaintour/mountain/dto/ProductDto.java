package com.mountaintour.mountain.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class ProductDto {
    private int productNo;
    private int userNo;
    private int mountainNo;
    private String tripName;
    private String tripContents;
    private String guide;
    private String timetaken;
    private int prize;
    private String danger;
    private Date registeredAt;
    private Date modifiedDate;
    private int people;
    private int hit;
    private String thumbnail;
    private String plan;
    private int status;
    private String termUse;
		
}


