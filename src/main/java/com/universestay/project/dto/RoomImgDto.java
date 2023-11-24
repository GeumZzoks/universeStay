package com.universestay.project.dto;

import io.swagger.annotations.ApiModelProperty;
import java.sql.Timestamp;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@ToString
public class RoomImgDto {

    @ApiModelProperty(notes = "숙소사진 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String room_photo_id;

    @ApiModelProperty(notes = "숙소번호 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String room_id;

    @ApiModelProperty(notes = "숙소사진 url", example = "http://down.edunet4u.net/KEDNCM/A000800002_20140423/e6_so_44_01_image01_01.jpg", required = true)
    private String room_img_url;

    @ApiModelProperty(notes = "숙소 사진 설명", example = "숙소 내부 사진입니다.", required = true)
    private String room_img_comment;

    @ApiModelProperty(notes = "삭제 여부", example = "Y", required = true)
    private String room_img_is_remove;

    @ApiModelProperty(notes = "최초등록일자", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    private Timestamp created_at;

    @ApiModelProperty(notes = "최초등록자 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String created_id;

    @ApiModelProperty(notes = "최종변경일자", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    private Timestamp updated_at;

    @ApiModelProperty(notes = "최종등록자 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String updated_id;

}
