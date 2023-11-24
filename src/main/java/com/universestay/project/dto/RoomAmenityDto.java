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
public class RoomAmenityDto {

    @ApiModelProperty(notes = "숙소번호 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String room_id;

    @ApiModelProperty(notes = "욕실", example = "15", required = true)
    private int room_amenity_bath;

    @ApiModelProperty(notes = "침실 및 세탁시설", example = "15", required = true)
    private int room_amenity_bedAndLaundry;

    @ApiModelProperty(notes = "엔터테인먼트", example = "15", required = true)
    private int room_amenity_entertain;

    @ApiModelProperty(notes = "냉난방", example = "15", required = true)
    private int room_amenity_heatAndCold;

    @ApiModelProperty(notes = "숙소 안전", example = "15", required = true)
    private int room_amenity_safety;

    @ApiModelProperty(notes = "인터넷 및 업무공간", example = "15", required = true)
    private int room_amenity_internetAndWorkSpace;

    @ApiModelProperty(notes = "주방 및 식당", example = "15", required = true)
    private int room_amenity_kitchen;

    @ApiModelProperty(notes = "야외", example = "15", required = true)
    private int room_amenity_outdoor;

    @ApiModelProperty(notes = "주차장 및 기타시설", example = "15", required = true)
    private int room_amenity_garageAndEtc;

    @ApiModelProperty(notes = "서비스", example = "15", required = true)
    private int room_amenity_service;

    @ApiModelProperty(notes = "최초등록일자", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    private Timestamp created_at;

    @ApiModelProperty(notes = "최초등록자 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String created_id;

    @ApiModelProperty(notes = "최종변경일자", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    private Timestamp updated_at;

    @ApiModelProperty(notes = "최종등록자 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String updated_id;

}
