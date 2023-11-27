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
public class OAuthDto {

    @ApiModelProperty(notes = "OAuthId", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String oauth_id;

    @ApiModelProperty(notes = "유저 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String user_id;

    @ApiModelProperty(notes = "OAuth 토큰", example = "asdfadfsdfsdafa_dafdscxkmsd_sdfsdaf234wasdf", required = false)
    private String oauth_token;

    @ApiModelProperty(notes = "OAuth SNS", example = "카카오", required = false)
    private String oauth_sns;

    @ApiModelProperty(notes = "최초등록일자", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    private Timestamp created_at;

    @ApiModelProperty(notes = "최초등록자ID", example = "jungsuk_airbnb", required = true)
    private String created_id;

    @ApiModelProperty(notes = "최종변경일자", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    private Timestamp updated_at;

    @ApiModelProperty(notes = "최종변경자ID", example = "jungsuk_airbnb", required = true)
    private String updated_id;

}
