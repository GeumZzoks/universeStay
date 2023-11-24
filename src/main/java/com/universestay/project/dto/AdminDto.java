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
public class AdminDto {


    @ApiModelProperty(notes = "관리자 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String admin_id;

    @ApiModelProperty(notes = "관리자 닉네임", example = "nickhealthy", required = true)
    private String admin_nickname;

    @ApiModelProperty(notes = "관리자 비밀번호", example = "12341234aA!", required = true)
    private String admin_pwd;

    @ApiModelProperty(notes = "전화번호", example = "010-3135-9103", required = true)
    private String admin_phone_num;

    @ApiModelProperty(notes = "이메일", example = "alskadmlcraz1@gmail.com", required = true)
    private String admin_email;

    @ApiModelProperty(notes = "생성 날짜", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    private Timestamp created_at;

    @ApiModelProperty(notes = "생성자", example = "jungsuk_airbnb", required = true)
    private String created_id;

    @ApiModelProperty(notes = "갱신 날짜", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    private Timestamp updated_at;

    @ApiModelProperty(notes = "갱신자", example = "jungsuk_airbnb", required = true)
    private String updated_id;

}
