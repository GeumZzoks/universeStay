package com.universestay.project.room.dto;

import io.swagger.annotations.ApiModelProperty;
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
public class RoomManagementDto {

    @ApiModelProperty(notes = "숙소번호 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String room_id;

    @ApiModelProperty(notes = "숙소 이름", example = "남산레지던스", required = true)
    private String room_name;

    @ApiModelProperty(notes = "숙소 주소", example = "0", required = true)
    private String room_address;

    @ApiModelProperty(notes = "숙소 대표 사진", example = "0", required = true)
    private String room_main_photo;

    @ApiModelProperty(notes = "최초등록일자", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    private String created_at;

    @ApiModelProperty(notes = "숙소 상태", example = "R01", required = true)
    private String room_status_id;


}
