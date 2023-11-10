package com.mountaintour.mountain.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class ImageDto {
	private int imageNo;
    private String imagePath;
    private String filesystemName;
    private int productNo;
}
