package com.universestay.project.admin.dao;

import com.universestay.project.admin.dto.CouponDto;
import com.universestay.project.admin.dto.EventDto;
import com.universestay.project.admin.dto.InquiryDto;
import com.universestay.project.admin.dto.NoticeDto;
import com.universestay.project.common.exception.CommonException;
import com.universestay.project.user.dto.UserDto;

public interface DashBoardDao {

    /*
     * 대시보드 전체 목록
     * 1. 유저 관리
     * 2. 호스팅 관리
     * 3. 공지사항
     * 4. 이벤트
     * 5. 문의사항
     * 6. 쿠폰
     */
    UserDto selectUserManagement() throws CommonException;
    // TODO: 호스팅 관리 추가 해야함

    NoticeDto selectNotice() throws CommonException;

    EventDto selectEvent() throws CommonException;

    InquiryDto selectInquiry() throws CommonException;

    CouponDto selectCoupon() throws CommonException;

    /*  */
}
