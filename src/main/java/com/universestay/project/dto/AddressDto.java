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
public class AddressDto {

    @ApiModelProperty(notes = "주소 아이디", example = "1", required = true)
    private int address_id;

    @ApiModelProperty(notes = "우편번호", example = "12410", required = true)
    private String address_zip_code;

    @ApiModelProperty(notes = "시도", example = "경기도", required = true)
    private String address_si_do;

    @ApiModelProperty(notes = "시도영문", example = "Gyeonggi-do", required = false)
    private String address_si_do_eng;

    @ApiModelProperty(notes = "시군구", example = "가평군", required = true)
    private String address_si_gun_gu;

    @ApiModelProperty(notes = "시군구영문", example = "Gapyeong-gun", required = false)
    private String address_si_gun_gu_eng;

    @ApiModelProperty(notes = "읍면", example = "가평읍", required = false)
    private String address_eup_myeon;

    @ApiModelProperty(notes = "읍면영문", example = "Gapyeong-eup", required = false)
    private String address_eup_myeon_eng;

    @ApiModelProperty(notes = "도로명코드", example = "418204448042", required = false)
    private String address_rode_name_code;

    @ApiModelProperty(notes = "도로명", example = "당목가일길", required = false)
    private String address_rode_name;

    @ApiModelProperty(notes = "도로명영문", example = "Dangmokgail-gil", required = false)
    private String address_rode_name_eng;

    @ApiModelProperty(notes = "지하여부", example = "Y", required = false)
    private String address_is_underground;

    @ApiModelProperty(notes = "건물번호본번", example = "410", required = false)
    private int address_building_main_num;

    @ApiModelProperty(notes = "건물번호부번", example = "28", required = false)
    private int address_building_sub_num;

    @ApiModelProperty(notes = "건물관리번호", example = "4182025030103800006000001", required = false)
    private String address_building_manage_num;

    @ApiModelProperty(notes = "다량배달처명", example = "", required = false)
    private String address_daryang_name;

    @ApiModelProperty(notes = "시군구용건물명", example = "", required = false)
    private String address_sigungu_building_name;

    @ApiModelProperty(notes = "법정동코드", example = "4182025030", required = false)
    private String address_bup_dong_code;

    @ApiModelProperty(notes = "법정동명", example = "", required = false)
    private String address_bup_dong_name;

    @ApiModelProperty(notes = "리명", example = "개곡리", required = false)
    private String address_li_name;

    @ApiModelProperty(notes = "행정동명", example = "가평읍", required = false)
    private String address_hang_dong_name;

    @ApiModelProperty(notes = "산여부", example = "Y", required = false)
    private String address_is_mountain;

    @ApiModelProperty(notes = "지번본번", example = "380", required = false)
    private int address_zibun_main_num;

    @ApiModelProperty(notes = "읍면동일련번호", example = "01", required = false)
    private String address_eup_myeon_dong_num;

    @ApiModelProperty(notes = "지번부번", example = "6", required = false)
    private int address_zibun_sub_num;

    @ApiModelProperty(notes = "구우편번호", example = "", required = false)
    private String address_old_zip_code;

    @ApiModelProperty(notes = "우편번호일련번호", example = "", required = false)
    private String address_zip_code_serial_num;

    @ApiModelProperty(notes = "생성 날짜", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    private Timestamp created_at;

    @ApiModelProperty(notes = "생성자", example = "jungsuk_airbnb", required = true)
    private String created_id;

    @ApiModelProperty(notes = "갱신 날짜", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    private Timestamp updated_at;

    @ApiModelProperty(notes = "갱신자", example = "jungsuk_airbnb", required = true)
    private String updated_id;

}
