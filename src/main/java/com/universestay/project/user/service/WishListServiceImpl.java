package com.universestay.project.user.service;

import com.universestay.project.user.dao.WishListDao;
import com.universestay.project.user.dto.WishListDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class WishListServiceImpl implements WishListService {

    @Autowired
    WishListDao wishListDao;

    @Override
    public Integer insert(WishListDto dto) throws Exception {
        return wishListDao.insert(dto);
    }

    @Override
    public List<Map<String, Object>> selectAll(String user_id) throws Exception {
        return wishListDao.selectAll(user_id);
    }

    @Override
    public Integer delete(String user_id, String room_id) throws Exception {
        return wishListDao.delete(user_id, room_id);
    }

    @Override
    public String getUserUuid(String user_email) throws Exception {
        return wishListDao.getUserUuid(user_email);
    }
}
