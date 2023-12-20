package com.universestay.project.dto;

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
public class ChattingRoomDto {

    @ApiModelProperty(notes = "채팅방 번호", example = "b2b729a2-89e6-11ee-b9d1-0242ac120002", required = true)
    private String chatting_room_id;

    @ApiModelProperty(notes = "호스트 ID", example = "fc0cb9be-89e6-11ee-b9d1-0242ac120002", required = true)
    private String user_id2;

    @ApiModelProperty(notes = "게스트 ID", example = "02c13ef6-89e7-11ee-b9d1-0242ac120002", required = true)
    private String user_id;

    @ApiModelProperty(notes = "숙소 ID", example = "b2b729a2-89e6-11ee-b9d1-0242ac120002", required = true)
    private String room_id;

    @ApiModelProperty(notes = "최초등록일자", example = "2023/08/11", required = true)
    private Timestamp created_at;

    @ApiModelProperty(notes = "최초등록자 ID", example = "jungsuk_airbnb", required = true)
    private String created_id;

    @ApiModelProperty(notes = "최종변경일자", example = "2023/11/18", required = true)
    private Timestamp updated_at;

    @ApiModelProperty(notes = "최종변경자 ID", example = "jungsuk_airbnb", required = true)
    private String updated_id;

}
