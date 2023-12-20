package com.universestay.project.user.service;

import com.universestay.project.user.dto.UserCouponDto;

import java.util.List;
import java.util.Map;

public interface UserCouponService {

    Integer totalCount(String user_id) throws Exception;

    Integer isIssued(String user_id, Integer coupon_id) throws Exception;

    UserCouponDto select(String user_id, Integer coupon_id) throws Exception;

    List<Map<String, Object>> selectAll(String user_id) throws Exception;

    Integer insert(UserCouponDto userCouponDto) throws Exception;

    String getUserUuid(String user_email) throws Exception;
}
