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
public class InquiryChattingMessageDto {

    @ApiModelProperty(notes = "채팅메세지번호 ID", example = "1", required = true)
    int chatting_message_id;

    @ApiModelProperty(notes = "채팅방번호", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    String chatting_room_id;

    @ApiModelProperty(notes = "작성자 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    String writer_id;

    @ApiModelProperty(notes = "채팅 내용", example = "abcdefghijklm", required = true)
    String chatting_ctt;

    @ApiModelProperty(notes = "최초등록일자", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    Timestamp created_at;

    @ApiModelProperty(notes = "최초등록자 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    String created_id;

    @ApiModelProperty(notes = "최종변경일자", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    Timestamp updated_at;

    @ApiModelProperty(notes = "최종변경자 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    String updated_id;

}
