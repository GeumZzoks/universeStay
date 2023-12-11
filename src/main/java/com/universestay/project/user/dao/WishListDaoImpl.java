package com.universestay.project.user.dao;

import com.universestay.project.user.dto.WishListDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class WishListDaoImpl implements WishListDao {

    @Autowired
    SqlSession session;

    public static String namespace = "com.universestay.project.mybatis.mapper.user.wishListMapper.";

    public Integer insert(WishListDto dto) throws Exception {
        return session.insert(namespace + "insert", dto);
    }

    @Override
    public List<Map<String, Object>> selectAll(String user_id) throws Exception {
        return session.selectList(namespace + "selectAll", user_id);
    }

    @Override
    public Integer delete(String user_id, String room_id) throws Exception {
        Map map = new HashMap();
        map.put("user_id", user_id);
        map.put("room_id", room_id);
        return session.delete(namespace + "delete", map);
    }

    @Override
    public String getUserUuid(String user_email) throws Exception {
        return session.selectOne(namespace + "getUserUuid", user_email);
    }
}
