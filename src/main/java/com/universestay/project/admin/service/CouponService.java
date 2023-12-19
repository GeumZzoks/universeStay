package com.universestay.project.admin.service;

import com.universestay.project.admin.dto.CouponDto;
import com.universestay.project.admin.dto.EventDto;
import com.universestay.project.common.SearchCondition;

import java.util.List;
import java.util.Map;

public interface CouponService {

    Integer insert(CouponDto dto) throws Exception;

    EventDto select(Integer coupon_id) throws Exception;

    CouponDto selectOnEvent(Integer event_id) throws Exception;

    Integer selectByEvent(Integer event_id) throws Exception;

    List<CouponDto> selectAll() throws Exception;

    Integer update(CouponDto dto) throws Exception;

    Integer issue(Integer coupon_id) throws Exception;

    Integer stopIssue(Integer coupon_id) throws Exception;

    Integer delete(Integer coupon_id) throws Exception;

    List<CouponDto> list() throws Exception;

    List<CouponDto> getList() throws Exception;

    List<CouponDto> getPage(Map map) throws Exception;

    int getSearchResultCnt(SearchCondition sc) throws Exception;

    List<CouponDto> getSearchResultPage(SearchCondition sc) throws Exception;

}
