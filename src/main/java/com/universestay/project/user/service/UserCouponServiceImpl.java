package com.universestay.project.user.service;

import com.universestay.project.user.dao.UserCouponDao;
import com.universestay.project.user.dto.UserCouponDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class UserCouponServiceImpl implements UserCouponService {

    @Autowired
    UserCouponDao userCouponDao;

    @Override
    public Integer totalCount(String user_id) throws Exception {
        return userCouponDao.totalCount(user_id);
    }

    @Override
    public Integer isIssued(String user_id, Integer coupon_id) throws Exception {
        return userCouponDao.isIssued(user_id, coupon_id);
    }

    @Override
    public UserCouponDto select(String user_id, Integer coupon_id) throws Exception {
        return userCouponDao.select(user_id, coupon_id);
    }

    @Override
    public List<Map<String, Object>> selectAll(String user_id) throws Exception {
        return userCouponDao.selectAll(user_id);
    }

    @Override
    public Integer insert(UserCouponDto userCouponDto) throws Exception {
        return userCouponDao.insert(userCouponDto);
    }

    @Override
    public String getUserUuid(String user_email) throws Exception {
        return userCouponDao.getUserUuid(user_email);
    }
}
