package com.universestay.project.user.dto;

import io.swagger.annotations.ApiModelProperty;
import java.sql.Date;
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
public class UserRequestDto {

    @ApiModelProperty(notes = "유저 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String user_id;

    @ApiModelProperty(notes = "비밀번호", example = "DSTdmfkaksjtm12!!", required = true)
    private String user_pwd;

    @ApiModelProperty(notes = "닉네임", example = "금쪽이", required = true)
    private String user_nickname;

    @ApiModelProperty(notes = "이름", example = "정금쪽", required = true)
    private String user_name;

    @ApiModelProperty(notes = "이메일", example = "aaa@gmail.com", required = true)
    private String user_email;

    @ApiModelProperty(notes = "전화번호1", example = "010-1111-2222", required = true)
    private String user_phone_num1;

    @ApiModelProperty(notes = "전화번호2", example = "010-2222-2222", required = false)
    private String user_phone_num2;

    @ApiModelProperty(notes = "주소", example = "서울 종로구 인사동", required = true)
    private String user_address;

    @ApiModelProperty(notes = "생년월일", example = "YYYY-MM-DD", required = true)
    private Date user_birth;

    @ApiModelProperty(notes = "프로필이미지url", example = "http://down.edunet4u.net/KEDNCM/A000800002_20140423/e6_so_44_01_image01_01.jpg", required = false)
    private String user_img_url;

}
