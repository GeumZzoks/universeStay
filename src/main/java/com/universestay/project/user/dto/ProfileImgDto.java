package com.universestay.project.user.dto;

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
public class ProfileImgDto {

    @ApiModelProperty(notes = "프로필 이미지 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String profile_img_id;

    @ApiModelProperty(notes = "프로필 이미지 URL", example = "http://down.edunet4u.net/KEDNCM/A000800002_20140423/e6_so_44_01_image01_01.jpg", required = false)
    private String profile_img_url;

    @ApiModelProperty(notes = "프로필 이미지 삭제 여부", example = "Y", required = false)
    private String profile_img_is_remove;

    @ApiModelProperty(notes = "최초등록일자", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    private Timestamp created_at;

    @ApiModelProperty(notes = "최초등록자ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String created_id;

    @ApiModelProperty(notes = "최종변경일자", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    private Timestamp updated_at;

    @ApiModelProperty(notes = "최종변경자ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String updated_id;
}
