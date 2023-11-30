package com.universestay.project.admin.dao;

import com.universestay.project.dto.RoomDto;
import java.util.List;
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
}
