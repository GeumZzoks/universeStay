package com.universestay.project.notice.dto;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.sql.Timestamp;
import lombok.AllArgsConstructor;
import lombok.Data;
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
@ApiModel(description = "Notice DTO")
@Data
public class NoticeDto {


    @ApiModelProperty(notes = "공지 번호 ID", example = "1", required = true)
    private Integer notice_id;

    @ApiModelProperty(notes = "관리자 ID", example = "0ca24692-89ea-11ee-b9d1-0242ac120002", required = true)
    private String admin_id;

    @ApiModelProperty(notes = "공지사항 제목", example = "2023/11/23 목요일 - 서버 점검이 있습니다.", required = true)
    private String notice_title;

    @ApiModelProperty(notes = "공지사항 내용", example = "universeStay를 이용하시는 고객 여러분 감사드립니다! 조금 더 안정적인 서비스 제공을 위하여 2023/11/23 목요일 23:50 ~ 24:00 까지 10분간 서비스 점검이 있을 예정입니다.", required = true)
    private String notice_ctt;

    @ApiModelProperty(notes = "조회수", example = "0", required = true)
    private Integer notice_hit;

    @ApiModelProperty(notes = "공개 여부", example = "N", required = false)
    private String notice_is_open;

    @ApiModelProperty(notes = "생성 날짜", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    private Timestamp created_at;

    @ApiModelProperty(notes = "생성자", example = "jungsuk_airbnb", required = true)
    private String created_id;

    @ApiModelProperty(notes = "갱신 날짜", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    private Timestamp updated_at;

    @ApiModelProperty(notes = "갱신자", example = "jungsuk_airbnb", required = true)
    private String updated_id;

}
