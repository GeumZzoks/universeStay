package com.universestay.project.admin.dao;

import com.universestay.project.admin.dto.CouponDto;
import com.universestay.project.admin.dto.EventDto;
import com.universestay.project.admin.dto.InquiryDto;
import com.universestay.project.admin.dto.NoticeDto;
import com.universestay.project.common.exception.CommonException;
import com.universestay.project.user.dto.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DashBoardDaoImpl implements DashBoardDao {

    private final SqlSession session;
    private final String namespace = "com.universestay.project.resources.mybatis.mapper.admin.dashBoardMapper.";

    @Autowired
    public DashBoardDaoImpl(SqlSession session) {
        this.session = session;
    }


    @Override
    public UserDto selectUserManagement() throws CommonException {
        return null;
    }

    @Override
    public NoticeDto selectNotice() throws CommonException {
        return null;
    }

    @Override
    public EventDto selectEvent() throws CommonException {
        return null;
    }

    @Override
    public InquiryDto selectInquiry() throws CommonException {
        return null;
    }

    @Override
    public CouponDto selectCoupon() throws CommonException {
        return null;
    }
}
