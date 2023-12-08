package com.universestay.project.admin.service;

import com.universestay.project.admin.dao.CouponDao;
import com.universestay.project.admin.dto.CouponDto;
import com.universestay.project.admin.dto.EventDto;
import com.universestay.project.common.SearchCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CouponServiceImpl implements CouponService {

    @Autowired
    CouponDao couponDao;

    @Override
    public Integer insert(CouponDto dto) throws Exception {
        return couponDao.insert(dto);
    }

    @Override
    public EventDto select(Integer coupon_id) throws Exception {
        return couponDao.select(coupon_id);
    }

    @Override
    public List<CouponDto> selectAll() throws Exception {
        return couponDao.selectAll();
    }

    @Override
    public Integer update(CouponDto dto) throws Exception {
        return couponDao.update(dto);
    }

    @Override
    public Integer issue(Integer coupon_id) throws Exception {
        return couponDao.issue(coupon_id);
    }

    @Override
    public Integer stopIssue(Integer coupon_id) throws Exception {
        return couponDao.stopIssue(coupon_id);
    }

    @Override
    public Integer delete(Integer coupon_id) throws Exception {
        return couponDao.delete(coupon_id);
    }

    @Override
    public List<CouponDto> list() throws Exception {
        List<CouponDto> couponDto = couponDao.selectAll();
        return couponDto;
    }

    @Override
    public List<CouponDto> getList() throws Exception {
        return couponDao.selectAll();
    }

    @Override
    public List<CouponDto> getPage(Map map) throws Exception {
        return couponDao.selectPage(map);
    }

    @Override
    public int getSearchResultCnt(SearchCondition sc) throws Exception {
        return couponDao.searchResultCnt(sc);
    }

    @Override
    public List<CouponDto> getSearchResultPage(SearchCondition sc) throws Exception {
        return couponDao.searchSelectPage(sc);
    }
}
