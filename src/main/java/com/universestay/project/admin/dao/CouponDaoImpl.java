package com.universestay.project.admin.dao;

import com.universestay.project.admin.dto.CouponDto;
import com.universestay.project.admin.dto.EventDto;
import com.universestay.project.common.SearchCondition;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class CouponDaoImpl implements CouponDao {

    @Autowired
    SqlSession session;

    public static String namespace = "com.universestay.project.mybatis.mapper.admin.couponMapper.";

    @Override
    public Integer insert(CouponDto dto) throws Exception {
        return session.insert(namespace + "insert", dto);
    }

    @Override
    public EventDto select(Integer coupon_id) throws Exception {
        return session.selectOne(namespace + "select", coupon_id);
    }

    @Override
    public CouponDto selectOnEvent(Integer event_id) throws Exception {
        return session.selectOne(namespace + "selectOnEvent", event_id);
    }


    @Override
    public Integer selectByEvent(Integer event_id) throws Exception {
        return session.selectOne(namespace + "selectByEvent", event_id);
    }

    @Override
    public List<CouponDto> selectAll() throws Exception {
        return session.selectList(namespace + "selectAll");
    }

    @Override
    public Integer update(CouponDto dto) throws Exception {
        return session.update(namespace + "update", dto);
    }

    @Override
    public Integer issue(Integer coupon_id) throws Exception {
        return session.update(namespace + "issue", coupon_id);
    }

    @Override
    public Integer stopIssue(Integer coupon_id) throws Exception {
        return session.update(namespace + "stopIssue", coupon_id);
    }

    @Override
    public Integer delete(Integer coupon_id) throws Exception {
        return session.delete(namespace + "delete", coupon_id);
    }

    @Override
    public List<CouponDto> searchSelectPage(SearchCondition sc) throws Exception {
        return session.selectList(namespace + "searchSelectPage", sc);
    }

    @Override
    public List<CouponDto> selectPage(Map map) throws Exception {
        return session.selectList(namespace + "selectPage", map);
    }

    @Override
    public int searchResultCnt(SearchCondition sc) throws Exception {
        return session.selectOne(namespace + "searchResultCnt", sc);
    }
}
