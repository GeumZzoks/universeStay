package com.universestay.project.room.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@ToString
public class RoomPhotoDto {

    @ApiModelProperty(notes = "숙소 대표 사진", example = "file", required = true)
    private MultipartFile room_photo_main;

    @ApiModelProperty(notes = "숙소 서브 사진", example = "file", required = true)
    private MultipartFile room_photo_sub1;

    @ApiModelProperty(notes = "숙소 서브 사진", example = "file", required = true)
    private MultipartFile room_photo_sub2;

    @ApiModelProperty(notes = "숙소 서브 사진", example = "file", required = true)
    private MultipartFile room_photo_sub3;

    @ApiModelProperty(notes = "숙소 서브 사진", example = "file", required = true)
    private MultipartFile room_photo_sub4;

}
