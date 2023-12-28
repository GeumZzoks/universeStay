package com.universestay.project.admin.dto;


import io.swagger.annotations.ApiModelProperty;
import lombok.*;

import java.sql.Timestamp;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@ToString
public class EventImgDto {


    @ApiModelProperty(notes = "이벤트 사진 ID", example = "1", required = true)
    private Integer event_img_id;

    @ApiModelProperty(notes = "이벤트 ID", example = "1", required = true)
    private Integer event_id;

    @ApiModelProperty(notes = "이벤트 사진 URL", example = "/photos/image-8310751/", required = false)
    private String event_img_url;

    @ApiModelProperty(notes = "이벤트 사진 설명", example = "첫 예약한 게스트 30% 프로모션", required = false)
    private String event_img_comment;

    @ApiModelProperty(notes = "삭제 여부", example = "N", required = false)
    private String event_img_is_remove;

    @ApiModelProperty(notes = "생성 날짜", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    private Timestamp created_at;

    @ApiModelProperty(notes = "생성자", example = "jungsuk_airbnb", required = true)
    private String created_id;

    @ApiModelProperty(notes = "갱신 날짜", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    private Timestamp updated_at;

    @ApiModelProperty(notes = "갱신자", example = "jungsuk_airbnb", required = true)
    private String updated_id;

}
