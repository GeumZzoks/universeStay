package com.universestay.project.inquiry.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.*;

import java.sql.Timestamp;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@ToString
public class InquiryChattingRoomDto {

    @ApiModelProperty(notes = "채팅방번호", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    String chatting_room_id;

    @ApiModelProperty(notes = "유저 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    String user_id;

    @ApiModelProperty(notes = "관리자 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = false)
    String admin_id;

    @ApiModelProperty(notes = "답변상태", example = "B01", required = true)
    String status_id;

    @ApiModelProperty(notes = "최초등록일자", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    Timestamp created_at;

    @ApiModelProperty(notes = "최초등록자 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    String created_id;

    @ApiModelProperty(notes = "최종변경일자", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    Timestamp updated_at;

    @ApiModelProperty(notes = "최종변경자 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    String updated_id;
}
