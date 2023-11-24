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
public class RefundDto {

    @ApiModelProperty(notes = "환불번호 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String refund_id;
    @ApiModelProperty(notes = "결제번호 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String payment_id;
    @ApiModelProperty(notes = "상태코드 ID", example = "RE01", required = true)
    private String status_id;
    @ApiModelProperty(notes = "환불 신청일자", example = "0000-00-00 00:00:00", required = true)
    private Timestamp refund_request_date;
    @ApiModelProperty(notes = "환불 날짜", example = "0000-00-00 00:00:00", required = true)
    private Timestamp refund_date;
    @ApiModelProperty(notes = "환불 승인 번호", example = "123456789", required = true)
    private int refund_aprv_num;
    @ApiModelProperty(notes = "최초등록일자", example = "0000-00-00 00:00:00", required = true)
    private Timestamp created_at;
    @ApiModelProperty(notes = "최초등록자ID", example = "jungsuk_airbnb", required = true)
    private String created_id;
    @ApiModelProperty(notes = "최초변경일자", example = "0000-00-00 00:00:00", required = true)
    private Timestamp updated_at;
    @ApiModelProperty(notes = "최종변경자ID", example = "jungsuk_airbnb", required = true)
    private String updated_id;
}
