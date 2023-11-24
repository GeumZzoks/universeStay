package com.universestay.project.user.dto;

import io.swagger.annotations.ApiModelProperty;
import java.sql.Date;
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
public class UserDto {

    @ApiModelProperty(notes = "유저 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String user_id;

    @ApiModelProperty(notes = "추천 유저 ID", example = "ae405ce0-8a9b-11ee-b9d8-0242ac120002", required = false)
    private String user_id2;

    @ApiModelProperty(notes = "상태코드", example = "U01", required = true)
    private String status_id;

    @ApiModelProperty(notes = "프로필이미지ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String profile_img_id;

    @ApiModelProperty(notes = "비밀번호", example = "DSTdmfkaksjtm12!!", required = true)
    private String user_pwd;

    @ApiModelProperty(notes = "닉네임", example = "금쪽이", required = true)
    private String user_nickname;

    @ApiModelProperty(notes = "이름", example = "정금쪽", required = true)
    private String user_name;

    @ApiModelProperty(notes = "이메일", example = "aaa@gmail.com", required = true)
    private String user_email;

    @ApiModelProperty(notes = "마지막 로그인", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    private Timestamp user_last_login;

    @ApiModelProperty(notes = "전화번호1", example = "010-1111-2222", required = true)
    private String user_phone_num1;

    @ApiModelProperty(notes = "전화번호2", example = "010-2222-2222", required = false)
    private String user_phone_num2;

    @ApiModelProperty(notes = "주소", example = "서울 종로구 인사동", required = true)
    private String user_address;

    @ApiModelProperty(notes = "생년월일", example = "YYYY-MM-DD", required = true)
    private Date user_birth;

    @ApiModelProperty(notes = "신분증 인증", example = "Y", required = false)
    private String user_is_certificated;

    @ApiModelProperty(notes = "호스트 여부", example = "Y", required = true)
    private String user_is_host;

    @ApiModelProperty(notes = "호스팅 시작 일자", example = "YYYY-MM-DD hh:mm:ss.000000", required = false)
    private Timestamp user_hosting_started_at;

    @ApiModelProperty(notes = "프로필이미지url", example = "http://down.edunet4u.net/KEDNCM/A000800002_20140423/e6_so_44_01_image01_01.jpg", required = false)
    private String user_img_url;

    @ApiModelProperty(notes = "자기소개", example = "여행이 취미입니다만,", required = false)
    private String user_bio;

    @ApiModelProperty(notes = "최초등록일자", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    private Timestamp created_at;

    @ApiModelProperty(notes = "최초등록자ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String created_id;

    @ApiModelProperty(notes = "최종변경일자", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    private Timestamp updated_at;

    @ApiModelProperty(notes = "최종변경자ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String updated_id;
}
