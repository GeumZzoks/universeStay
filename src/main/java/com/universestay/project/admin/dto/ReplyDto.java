package com.universestay.project.admin.dto;


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
public class ReplyDto {


    @ApiModelProperty(notes = "문의 댓글 ID", example = "1", required = true)
    private Integer reply_id;

    @ApiModelProperty(notes = "문의 ID", example = "1", required = true)
    private Integer inquiry_id;

    @ApiModelProperty(notes = "작성자", example = "nick", required = true)
    private String reply_writer_id;

    @ApiModelProperty(notes = "댓글 내용", example = "호스트의 숙소를 예약하고 싶은데 결제는 어떻게 해야하나요?", required = true)
    private String reply_ctt;

    @ApiModelProperty(notes = "생성 날짜", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    private Timestamp created_at;

    @ApiModelProperty(notes = "생성자", example = "jungsuk_airbnb", required = true)
    private String created_id;

    @ApiModelProperty(notes = "갱신 날짜", example = "YYYY-MM-DD hh:mm:ss.000000", required = true)
    private Timestamp updated_at;

    @ApiModelProperty(notes = "갱신자", example = "jungsuk_airbnb", required = true)
    private String updated_id;

}
