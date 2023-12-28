package com.universestay.project.admin.dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReservationToEmailJobDaoImpl implements ReservationToEmailJobDao {

    @Autowired
    SqlSession session;

    public static String namespace = "com.universestay.project.resources.mybatis.mapper.admin.dao.ReservationToEmailJobDao.";

    @Override
    public List<Map<String, Object>> selectAlert() throws Exception {
        return session.selectList(namespace + "selectAlert");
    }
}
