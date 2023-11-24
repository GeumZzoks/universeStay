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
public class UserCouponDto {

    @ApiModelProperty(notes = "유저 쿠폰 ID", example = "0", required = true)
    private int user_coupon_id;

    @ApiModelProperty(notes = "유저 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String user_id;

    @ApiModelProperty(notes = "쿠폰 ID", example = "0", required = true)
    private int coupon_id;

    @ApiModelProperty(notes = "결제번호 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String payment_id;

    @ApiModelProperty(notes = "쿠폰 발급 일자", example = "YYYY-MM-DD hh:mm:ss.000000", required = false)
    private Timestamp user_coupon_issue_date;

    @ApiModelProperty(notes = "쿠폰 사용 날짜", example = "YYYY-MM-DD hh:mm:ss.000000", required = false)
    private Timestamp user_coupon_used_date;

    @ApiModelProperty(notes = "쿠폰 사용 여부", example = "N", required = true)
    private String user_coupon_is_used;

    @ApiModelProperty(notes = "쿠폰 만료 날짜", example = "YYYY-MM-DD hh:mm:ss.000000", required = false)
    private Timestamp user_coupon_expire_date;

    @ApiModelProperty(notes = "최초등록일자", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    private Timestamp created_at;

    @ApiModelProperty(notes = "최초등록자ID", example = "jungsuk_airbnb", required = true)
    private String created_id;

    @ApiModelProperty(notes = "최종변경일자", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    private Timestamp updated_at;

    @ApiModelProperty(notes = "최종변경자ID", example = "jungsuk_airbnb", required = true)
    private String updated_id;

}
