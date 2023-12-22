package com.universestay.project.room.dto;

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
public class SendEmailBookInfoDto {

    /*
     * 1. 숙소 상세에서 인풋에 데이터 넣으면서 VIEW에 뿌린다.
     * 2. JS로 클릭을 할 때 그 데이터를 다음 컨트롤러에게 넘긴다.
     * 3.
     * */


    /*
     * 부제목(링크 - 숙소 상세),
     * 요청 취소(링크 - 숙소 ID) API
     */

    private String[] emails;

    /* Room - room_main_photo */
    private String room_main_photo;

    /* ROOM - room_name */
    private String room_name;

    /* 제목(링크 - 숙소 상세) / 사진(링크 - 숙소 상세) */
    private String room_detail_link;

    /* ProfileImg - profile_img_url*/
    private String profile_img_url;

    /* 프로필 이미지(링크 - 유저 정보 링크) */
    private String profile_link;

    /* Booking - booking_checkin_date | 체크인 */
    private String booking_checkin_date;

    /* Booking - booking_checkout_date | 체크아웃 */
    private String booking_checkout_date;


}
