package com.universestay.project.payment.dto;


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
public class PaymentDto {

    @ApiModelProperty(notes = "결제 데이터 Uuid ", example = "bce7bee6-24b3-445a-baab-17a5ba4474f3")
    private String payment_id;

    @ApiModelProperty(notes = "예약 번호 ", example = "e07f07dd-4485-4253-accb-e89a715b0fad")
    private String booking_id;

    @ApiModelProperty(notes = "결제 성공 여부", example = "true")
    private Boolean payment_is_success;

    @ApiModelProperty(notes = "상품 이름", example = "예약번호")
    private String payment_name;

    @ApiModelProperty(notes = "결제 실패 코드")
    private String payment_error_code;

    @ApiModelProperty(notes = "결제 실패 메세지")
    private String payment_error_msg;

    @ApiModelProperty(notes = "포트원 고유 결제번호", example = "imp_347242536261")
    private String payment_imp_uid;

    @ApiModelProperty(notes = "주문번호", example = "57008833-33004")
    private String payment_merchant_uid;

    @ApiModelProperty(notes = "결제 방법", example = "card")
    private String payment_pay_method;

    @ApiModelProperty(notes = "결제 금액", example = "2500000")
    private int payment_paid_amount;

    @ApiModelProperty(notes = "결제 상태", example = "paid")
    private String payment_status;

    @ApiModelProperty(notes = "PG사 구분코드 ", example = "kcp")
    private String payment_pg_provider;

    @ApiModelProperty(notes = "간편결제 구분코드")
    private String payment_emb_pg_provider;

    @ApiModelProperty(notes = "PG사 거래번호", example = "22336466628585")
    private String payment_pg_tid;

    @ApiModelProperty(notes = "주문자명", example = "주성우")
    private String payment_buyer_name;

    @ApiModelProperty(notes = "주문자 이메일", example = "test@google.com")
    private String payment_buyer_email;

    @ApiModelProperty(notes = "주문자 연락처", example = "01012341234")
    private String payment_buyer_tel;

    @ApiModelProperty(notes = "주문자 주소", example = "서울시 종로구 종각역")
    private String payment_buyer_addr;

    @ApiModelProperty(notes = "주문자 우편번호", example = "12093")
    private String payment_buyer_postcode;

    @ApiModelProperty(notes = "결제 승인 시간", example = "1648344363")
    private Timestamp payment_paid_at;

    @ApiModelProperty(notes = "거래 매출 전표 Url", example = "https://admin8.kcp.co.kr/assist/bill.BillActionNew.do?cmd=card_bill&tno=22336466628585&order_no=imp_347242536261&trade_mony=1004")
    private String payment_receipt_url;

    @ApiModelProperty(notes = "카드 승인 번호", example = "42827474")
    private String payment_apply_num;

    @ApiModelProperty(notes = "환불 신청 여부", example = "N")
    private String payment_is_refund = "N";

    @ApiModelProperty(notes = "쿠폰 사용 여부", example = "N")
    private String payment_is_used = "N";

    @ApiModelProperty(notes = "결제 취소 여부", example = "N")
    private String payment_is_cancel = "N";

    @ApiModelProperty(notes = "취소 승인 번호")
    private String payment_cancel_auth_num;

    @ApiModelProperty(notes = "취소 승인 날짜")
    private String payment_cancel_date;

    @ApiModelProperty(notes = "통화", example = "KRW")
    private String payment_currency;

    @ApiModelProperty(notes = "주문자 카드사", example = "BC카드")
    private String payment_card_name;

    @ApiModelProperty(notes = "은행", example = "국민은행")
    private String payment_bank_name;

    @ApiModelProperty(notes = "카드 한도", example = "0")
    private int payment_card_quota;

    @ApiModelProperty(notes = "카드 번호", example = "5389200000007150")
    private String payment_card_number;

    @ApiModelProperty(notes = "최종 승인 여부", example = "N")
    private String payment_is_approved = "N";

    @ApiModelProperty(notes = "최초등록일자", example = "0000-00-00 00:00:00", required = true)
    private Timestamp created_at;
    @ApiModelProperty(notes = "최초등록자ID", example = "jungsuk_airbnb", required = true)
    private String created_id;
    @ApiModelProperty(notes = "최초변경일자", example = "0000-00-00 00:00:00", required = true)
    private Timestamp updated_at;
    @ApiModelProperty(notes = "최종변경자ID", example = "jungsuk_airbnb", required = true)
    private String updated_id;

}


