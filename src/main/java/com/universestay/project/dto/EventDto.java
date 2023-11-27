package com.universestay.project.dto;


import io.swagger.annotations.ApiModelProperty;
import lombok.*;

import java.sql.Timestamp;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@ToString
public class EventDto {

    @ApiModelProperty(notes = "이벤트 ID", example = "1", required = true)
    private Integer event_id;

    @ApiModelProperty(notes = "관리자 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String admin_id;

    @ApiModelProperty(notes = "상태코드 ID", example = "E02", required = true)
    private String status_id;

    @ApiModelProperty(notes = "이벤트 제목", example = "첫 예약 게스트 30% 할인!", required = true)
    private String event_title;

    @ApiModelProperty(notes = "이벤트 내용", example = "universeStay에 오신 여러분 환영합니다! 이번 이벤트는 nickhealthy(관리자)가 제안 및 주최하는 이벤트로서 첫 예약을 하시는 게스트 선착순 100분께 30% 파격적인 할인 이벤트 가격에 예약할 수 있습니다. 좋은 사람들과 좋은 공간에서 멋지고 다양한 경험을 쌓아보세요!", required = true)
    private String event_ctt;

    @ApiModelProperty(notes = "조회수", example = "10", required = true)
    private Integer event_hit;

    @ApiModelProperty(notes = "공개 여부", example = "Y", required = true)
    private String event_is_open;

    @ApiModelProperty(notes = "이벤트 시작일", example = "YYYY-MM-DD hh:mm:ss.000000", required = false)
    private String event_start_date;

    @ApiModelProperty(notes = "이벤트 만료일", example = "YYYY-MM-DD hh:mm:ss.000000", required = false)
    private String event_expire_date;

    @ApiModelProperty(notes = "생성 날짜", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    private Timestamp created_at;

    @ApiModelProperty(notes = "생성자", example = "jungsuk_airbnb", required = true)
    private String created_id;

    @ApiModelProperty(notes = "갱신 날짜", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    private Timestamp updated_at;

    @ApiModelProperty(notes = "갱신자", example = "jungsuk_airbnb", required = true)
    private String updated_id;

}
