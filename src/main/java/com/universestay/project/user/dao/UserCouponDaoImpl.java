package com.universestay.project.user.dao;

import com.universestay.project.user.dto.UserCouponDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class UserCouponDaoImpl implements UserCouponDao {

    @Autowired
    SqlSession session;

    public static String namespace = "com.universestay.project.mybatis.mapper.user.userCouponMapper.";

    @Override
    public Integer totalCount(String user_id) throws Exception {
        return session.selectOne(namespace + "totalCount", user_id);
    }

    @Override
    public Integer isIssued(String user_id, Integer coupon_id) throws Exception {
        Map map = new HashMap();
        map.put("user_id", user_id);
        map.put("coupon_id", coupon_id);
        return session.selectOne(namespace + "isIssued", map);
    }

    @Override
    public UserCouponDto select(String user_id, Integer coupon_id) throws Exception {
        Map map = new HashMap();
        map.put("user_id", user_id);
        map.put("coupon_id", coupon_id);
        return session.selectOne(namespace + "select", map);
    }

    @Override
    public List<Map<String, Object>> selectAll(String user_id) throws Exception {
        return session.selectList(namespace + "selectAll", user_id);
    }

    @Override
    public Integer insert(UserCouponDto userCouponDto) throws Exception {
        return session.insert(namespace + "insert", userCouponDto);
    }

    @Override
    public String getUserUuid(String user_email) throws Exception {
        return session.selectOne(namespace + "getUserUuid", user_email);
    }
}
