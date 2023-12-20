package com.universestay.project.admin.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.*;

import java.sql.Timestamp;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@ToString
public class CouponDto {

    @ApiModelProperty(notes = "쿠폰 ID", example = "0", required = true)
    private int coupon_id;

    @ApiModelProperty(notes = "이벤트 ID", example = "1", required = false)
    private int event_id;

    @ApiModelProperty(notes = "쿠폰 생성일", example = "YYYY-MM-DD hh:mm:ss.000000", required = false)
    private Timestamp coupon_created_date;

    @ApiModelProperty(notes = "쿠폰 이름", example = "웰컴 쿠폰", required = false)
    private String coupon_name;

    @ApiModelProperty(notes = "쿠폰 설명", example = "신규가입자 웰컴 쿠폰", required = false)
    private String coupon_desc;

    @ApiModelProperty(notes = "쿠폰 발행 사유", example = "신규가입자 웰컴 쿠폰 발급", required = false)
    private String coupon_usage;

    @ApiModelProperty(notes = "쿠폰 사용 가능 일수", example = "90", required = false)
    private int coupon_usable_day;

    @ApiModelProperty(notes = "프로모션 진행 상태", example = "Y", required = true)
    private String coupon_is_activated;

    @ApiModelProperty(notes = "쿠폰 타입", example = "정률할인", required = false)
    private String coupon_type;

    @ApiModelProperty(notes = "쿠폰 할인율", example = "10", required = false)
    private int coupon_discount_rate;

    @ApiModelProperty(notes = "쿠폰 할인 한도 금액", example = "10000", required = false)
    private int coupon_discount_limit;

    @ApiModelProperty(notes = "쿠폰 할인 금액", example = "5000", required = false)
    private int coupon_discount_amount;

    @ApiModelProperty(notes = "최초등록일자", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    private Timestamp created_at;

    @ApiModelProperty(notes = "최초등록자ID", example = "jungsuk_airbnb", required = true)
    private String created_id;

    @ApiModelProperty(notes = "최종변경일자", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    private Timestamp updated_at;

    @ApiModelProperty(notes = "최종변경자ID", example = "jungsuk_airbnb", required = true)
    private String updated_id;


}
