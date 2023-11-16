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
public class ReviewDto {
    private int reviewNo;
    private int productNo;
    private int reserveNo;
    private UserDto userDto;
    private String contents;
    private Date createdAt;
    private Date modifiedAt;
    private String status;
    private int star;
    
    private int userNo;
    public int getUserNo() {
        return userDto.getUserNo();
    }

    public void setUserNo(int userNo) {
        this.userNo = userNo;
    }
}
