package com.universestay.project.admin.dao;

import com.universestay.project.room.dto.RoomDto;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HostingManagementDaoImpl implements HostingManagementDao {

    @Autowired
    SqlSession session;

    public static String namespace = "com.universestay.project.mybatis.mapper.admin.hostingManagementMapper.";

    @Override
    public List<RoomDto> selectAll() throws Exception {
        return session.selectList(namespace + "selectAll");
    }

    @Override
    public List<RoomDto> searchList(Map<String, String> map) throws Exception {
        return session.selectList(namespace + "searchList", map);
    }

    @Override
    public Integer updateAll(Map<String, Object> paramMap) throws Exception {
        return session.update(namespace + "updateAll", paramMap);
    }
}
