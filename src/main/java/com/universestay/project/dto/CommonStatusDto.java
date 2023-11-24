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
public class CommonStatusDto {

    @ApiModelProperty(notes = "상태 코드", example = "U04", required = true)
    private String status_id;

    @ApiModelProperty(notes = "상태 카테고리", example = "U", required = true)
    private String status_category;

    @ApiModelProperty(notes = "상태 카테고리 설명", example = "유저 활동 상태", required = true)
    private String status_category_desc;

    @ApiModelProperty(notes = "상태명", example = "활성", required = true)
    private String status_name;

    @ApiModelProperty(notes = "생성 날짜", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    private Timestamp status_created_at;

    @ApiModelProperty(notes = "갱신 날짜", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    private Timestamp status_updated_at;

    @ApiModelProperty(notes = "상태 코드 순서", example = "1", required = true)
    private int status_order;

    @ApiModelProperty(notes = "상태 코드 사용 여부", example = "Y", required = true)
    private String status_is_used;

}
