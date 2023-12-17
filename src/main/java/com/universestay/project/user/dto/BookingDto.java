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
public class BookingDto {

    @ApiModelProperty(notes = "예약 번호 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String booking_id;

    @ApiModelProperty(notes = "유저 ID", example = "abcd1234@naver.com", required = true)
    private String user_id;

    @ApiModelProperty(notes = "숙소번호 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String room_id;

    @ApiModelProperty(notes = "상태코드 ID", example = "B01", required = true)
    private String status_id;

    @ApiModelProperty(notes = "체크인 날짜", example = "0000-00-00 00:00:00", required = false)
    private Timestamp booking_checkin_date;

    @ApiModelProperty(notes = "체크아웃 날짜", example = "0000-00-00 00:00:00", required = false)
    private Timestamp booking_checkout_date;

    @ApiModelProperty(notes = "인원수", example = "4", required = true)
    private int booking_num_of_guest;

    @ApiModelProperty(notes = "예약 날짜", example = "0000-00-00 00:00:00", required = true)
    private Timestamp booking_date;

    @ApiModelProperty(notes = "체크인 예정 시간", example = "0000-00-00 00:00:00", required = true)
    private Timestamp booking_checkin_time;

    @ApiModelProperty(notes = "체크아웃 예정 시간", example = "0000-00-00 00:00:00", required = true)
    private Timestamp booking_checkout_time;

    @ApiModelProperty(notes = "유저 리뷰 등록 여부", example = "N", required = true)
    private String is_user_review;

    @ApiModelProperty(notes = "최초등록일자", example = "0000-00-00 00:00:00", required = true)
    private Timestamp created_at;

    @ApiModelProperty(notes = "최초등록자ID", example = "jungsuk_airbnb", required = true)
    private String created_id;

    @ApiModelProperty(notes = "최초변경일자", example = "0000-00-00 00:00:00", required = true)
    private Timestamp updated_at;

    @ApiModelProperty(notes = "최종변경자ID", example = "jungsuk_airbnb", required = true)
    private String updated_id;

}
