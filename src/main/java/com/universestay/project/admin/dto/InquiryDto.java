package com.universestay.project.admin.dto;


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
public class InquiryDto {

    //    @ApiModelProperty(notes = "문의 ID", example = "1", required = true)
    @ApiModelProperty(notes = "문의 ID", example = "1", required = false)
    private Integer inquiry_id;

    @ApiModelProperty(value = "유저 ID", name = "0ca24692-89ea-11ee-b9d1-0242ac120002", dataType = "String", notes = "유저 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String user_id;

    @ApiModelProperty(notes = "제목", example = "호스트의 응답이 느리고 환불하고 싶습니다.", required = true)
    private String inquiry_title;

    @ApiModelProperty(notes = "내용", example = "호스트와 소통하는데 답변이 느려서 일정을 계획하는데 문제가 있습니다. 해당 호스트의 예약을 철회하고 환불받고 싶습니다.", required = true)
    private String inquiry_ctt;

    //    @ApiModelProperty(notes = "조회수", example = "1", required = true)
    @ApiModelProperty(notes = "조회수", example = "1", required = false)
    private Integer inquiry_hit;

    //    @ApiModelProperty(notes = "공개 여부", example = "N", required = true)
    @ApiModelProperty(notes = "공개 여부", example = "N", required = false)
    private String inquiry_is_open;

    //    @ApiModelProperty(notes = "문의 답변 여부", example = "N", required = true)
    @ApiModelProperty(notes = "문의 답변 여부", example = "N", required = false)
    private String inquiry_is_answered;

    //    @ApiModelProperty(notes = "생성 날짜", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    @ApiModelProperty(notes = "생성 날짜", example = "YYYY-MM-DD hh:mm:ss.000000", required = false)
    private Timestamp created_at;

    @ApiModelProperty(notes = "생성자", example = "jungsuk_airbnb", required = true)
    private String created_id;

//    @ApiModelProperty(notes = "갱신 날짜", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    @ApiModelProperty(notes = "갱신 날짜", example = "YYYY-MM-DD hh:mm:ss.000000", required = false)
    private Timestamp updated_at;

//    @ApiModelProperty(notes = "갱신자", example = "jungsuk_airbnb", required = true)
    @ApiModelProperty(notes = "갱신자", example = "jungsuk_airbnb", required = false)
    private String updated_id;

}
