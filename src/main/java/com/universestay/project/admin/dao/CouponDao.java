package com.universestay.project.admin.dao;

import com.universestay.project.admin.dto.CouponDto;
import com.universestay.project.admin.dto.EventDto;
import com.universestay.project.common.SearchCondition;

import java.util.List;
import java.util.Map;

public interface CouponDao {

    Integer insert(CouponDto dto) throws Exception;

    EventDto select(Integer coupon_id) throws Exception;

    CouponDto selectOnEvent(Integer event_id) throws Exception;

    Integer selectByEvent(Integer event_id) throws Exception;

    List<CouponDto> selectAll() throws Exception;

    Integer update(CouponDto dto) throws Exception;

    Integer issue(Integer coupon_id) throws Exception;

    Integer stopIssue(Integer coupon_id) throws Exception;

    Integer delete(Integer coupon_id) throws Exception;

    List<CouponDto> searchSelectPage(SearchCondition sc) throws Exception;

    List<CouponDto> selectPage(Map map) throws Exception;

    int searchResultCnt(SearchCondition sc) throws Exception;
}
