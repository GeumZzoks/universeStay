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
public class ViewDto {

    @ApiModelProperty(notes = "전망 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String view_id;

    @ApiModelProperty(notes = "전망 형태 설명", example = "계곡", required = false)
    private String view_type_desc;

    @ApiModelProperty(notes = "최초등록일자", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    private Timestamp created_at;

    @ApiModelProperty(notes = "최초등록자 ID", example = "jungsuk_airbnb", required = true)
    private String created_id;

    @ApiModelProperty(notes = "최종변경일자", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    private Timestamp updated_at;

    @ApiModelProperty(notes = "최종등록자 ID", example = "jungsuk_airbnb", required = true)
    private String updated_id;

}
