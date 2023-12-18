package com.universestay.project.user.dao;

import com.universestay.project.user.dto.BookingDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class HostBookingManagementDaoImpl implements  HostBookingManagementDao{

    @Autowired
    private SqlSession session;
    private static String namespace = "com.universestay.project.resources.mybatis.mapper.user.hostBookingManagementMapper.";

    @Override
    public List<Map<String, Object>> selectBookingRequestList(String user_id) throws Exception {
        return session.selectList(namespace + "selectBookingRequestList", user_id);
    }

    @Override
    public int aprvBookingRequest(String booking_id) throws Exception {
        return session.update(namespace + "aprvBookingRequest", booking_id);
    }

    @Override
    public int rjtBookingRequest(String booking_id) throws Exception {
        return session.delete(namespace + "rjtBookingRequest", booking_id);
    }
}
