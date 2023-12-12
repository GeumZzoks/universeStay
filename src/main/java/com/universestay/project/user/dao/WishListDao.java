package com.universestay.project.user.dao;

import com.universestay.project.user.dto.WishListDto;

import java.util.List;
import java.util.Map;

public interface WishListDao {

    Integer insert(WishListDto dto) throws Exception;

    List<Map<String, Object>> selectAll(String user_id) throws Exception;

    Integer delete(String user_id, String room_id) throws Exception;

    String getUserUuid(String user_email) throws Exception;
}
