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
public class AlertDto {

    @ApiModelProperty(notes = "알림 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String alert_id;
    @ApiModelProperty(notes = "예약 번호 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String booking_id;
    @ApiModelProperty(notes = "알림 날짜와 시간", example = "0000-00-00 00:00:00", required = true)
    private Timestamp alert_time;
    @ApiModelProperty(notes = "알림 내용", example = "삐용삐용", required = true)
    private String alert_ctt;
    @ApiModelProperty(notes = "수신자이메일", example = "abcd1234@naver.com", required = true)
    private String alert_to_email;
    @ApiModelProperty(notes = "최초등록일자", example = "0000-00-00 00:00:00", required = true)
    private Timestamp created_at;
    @ApiModelProperty(notes = "최초등록자ID", example = "jungsuk_airbnb", required = true)
    private String created_id;
    @ApiModelProperty(notes = "최초변경일자", example = "0000-00-00 00:00:00", required = true)
    private Timestamp updated_at;
    @ApiModelProperty(notes = "최종변경자ID", example = "jungsuk_airbnb", required = true)
    private String updated_id;

}
