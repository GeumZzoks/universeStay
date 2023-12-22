package com.universestay.project.room.dto;

import io.swagger.annotations.ApiModelProperty;
import java.sql.Timestamp;
import javax.validation.constraints.NotBlank;
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
public class RoomDto {

    @ApiModelProperty(notes = "숙소번호 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String room_id;

    @NotBlank
    @ApiModelProperty(notes = "숙소 카테고리 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String room_category_id;

    @ApiModelProperty(notes = "유저 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String user_id;

    @ApiModelProperty(notes = "숙소 승인 상태", example = "RA01", required = true)
    private String status_id;

    @ApiModelProperty(notes = "숙소 상태", example = "R01", required = true)
    private String room_status_id;

    @ApiModelProperty(notes = "숙소 이름", example = "남산레지던스", required = true)
    private String room_name;

    @ApiModelProperty(notes = "숙소 주소", example = "0", required = true)
    private String room_address;

    @ApiModelProperty(notes = "숙소 상세 주소", example = "0", required = true)
    private String room_address_detail;

    @ApiModelProperty(notes = "숙소 대표 사진", example = "0", required = true)
    private String room_main_photo;

    @ApiModelProperty(notes = "숙소 장점 설명", example = "야경이 훌륭합니다. 남산이 가깝습니다.", required = false)
    private String room_total_desc;

    @ApiModelProperty(notes = "공간 상세 설명", example = "2개의 침실과 4개의 침대가 있습니다.", required = false)
    private String room_space_desc;

    @ApiModelProperty(notes = "기타 상세 설명", example = "화장실 수리중", required = false)
    private String room_etc_desc;

    @ApiModelProperty(notes = "연락 방법", example = "phone : 010-7777-7777", required = true)
    private String room_contact_method;

    @ApiModelProperty(notes = "체크인 가능 시간", example = "HH:MM", required = true)
    private String room_checkin_time;

    @ApiModelProperty(notes = "체크아웃 가능 시간", example = "HH:MM", required = true)
    private String room_checkout_time;

    @ApiModelProperty(notes = "주중 1박 요금", example = "50000", required = true)
    private int room_weekday_price;

    @ApiModelProperty(notes = "주말 1박 요금", example = "80000", required = true)
    private int room_weekend_price;

    @ApiModelProperty(notes = "기준 숙박 인원", example = "4", required = true)
    private int room_standard_capa;

    @ApiModelProperty(notes = "최대 숙박 인원", example = "6", required = true)
    private int room_max_capa;

    @ApiModelProperty(notes = "인원 추가 요금", example = "10000", required = false)
    private int room_extra_person_fee;

    @ApiModelProperty(notes = "예약 자동 승인 여부", example = "Y", required = false)
    private String room_is_auto_aprv;

    @ApiModelProperty(notes = "별점 평균", example = "4.87", required = false)
    private Double room_stars_avg;

    @ApiModelProperty(notes = "침실 개수", example = "2", required = true)
    private int room_bedroom_cnt;

    @ApiModelProperty(notes = "침대 개수", example = "4", required = true)
    private int room_bed_cnt;

    @ApiModelProperty(notes = "욕실 개수", example = "2", required = true)
    private int room_bathroom_cnt;

    @ApiModelProperty(notes = "최초등록일자", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    private Timestamp created_at;

    @ApiModelProperty(notes = "최초등록자 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String created_id;

    @ApiModelProperty(notes = "최종변경일자", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    private Timestamp updated_at;

    @ApiModelProperty(notes = "최종등록자 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String updated_id;

}
