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
public class CardDto {

    @ApiModelProperty(notes = "카드 ID", example = "0", required = true)
    private int card_id;

    @ApiModelProperty(notes = "유저 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String user_id;

    @ApiModelProperty(notes = "카드 번호", example = "4564-4545-4521-5454", required = true)
    private String card_num;

    @ApiModelProperty(notes = "카드사", example = "삼성카드", required = true)
    private String card_credit_company;

    @ApiModelProperty(notes = "카드 만료일", example = "07/23", required = true)
    private Date card_expire_date;

    @ApiModelProperty(notes = "카드 CVC", example = "456", required = true)
    private int card_cvc;

    @ApiModelProperty(notes = "최초등록일자", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    private Timestamp created_at;

    @ApiModelProperty(notes = "최초등록자ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String created_id;

    @ApiModelProperty(notes = "최종변경일자", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    private Timestamp updated_at;

    @ApiModelProperty(notes = "최종변경자ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String updated_id;
}
