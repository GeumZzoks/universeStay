package com.universestay.project.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.*;

import java.sql.Timestamp;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@ToString
@Data
public class PaymentDto {

    @ApiModelProperty(notes = "결제번호 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String payment_id;
    @ApiModelProperty(notes = "예약 번호", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String booking_id;
    @ApiModelProperty(notes = "결제 방법", example = "CARD", required = true)
    private String payment_method;
    @ApiModelProperty(notes = "결제 금액", example = "100000", required = true)
    private int payment_price;
    @ApiModelProperty(notes = "결제 날짜", example = "0000-00-00 00:00:00", required = true)
    private Timestamp payment_date;
    @ApiModelProperty(notes = "카드 승인 번호", example = "123456789", required = true)
    private String payment_card_aprv_num;
    @ApiModelProperty(notes = "페이팔 승인 번호", example = "ABCD1234ABCD", required = false)
    private String payment_paypal_aprv_num;
    @ApiModelProperty(notes = "입금자명", example = "honggildong", required = true)
    private String payment_name;
    @ApiModelProperty(notes = "취소 승인 번호", example = "123456789", required = false)
    private String payment_cancel_auth_num;
    @ApiModelProperty(notes = "취소 날짜", example = "0000-00-00 00:00:00", required = false)
    private Timestamp payment_cancel_date;
    @ApiModelProperty(notes = "환불 신청 여부", example = "N", required = true)
    private String payment_is_refund;
    @ApiModelProperty(notes = "쿠폰 사용 여부", example = "Y", required = false)
    private String payment_is_used;
    @ApiModelProperty(notes = "결제취소여부", example = "N", required = false)
    private String payment_is_cancel;
    @ApiModelProperty(notes = "최초등록일자", example = "0000-00-00 00:00:00", required = true)
    private Timestamp created_at;
    @ApiModelProperty(notes = "최초등록자ID", example = "jungsuk_airbnb", required = true)
    private String created_id;
    @ApiModelProperty(notes = "최초변경일자", example = "0000-00-00 00:00:00", required = true)
    private Timestamp updated_at;
    @ApiModelProperty(notes = "최종변경자ID", example = "jungsuk_airbnb", required = true)
    private String updated_id;
}
