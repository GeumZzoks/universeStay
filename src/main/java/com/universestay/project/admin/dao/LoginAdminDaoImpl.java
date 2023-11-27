package com.universestay.project.admin.dao;

import com.universestay.project.admin.dto.AdminDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginAdminDaoImpl implements LoginAdminDao {

    private final String namespace = "com.universestay.project.admin.dao.LoginAdminDao.";
    private final SqlSession session;


    @Autowired
    public LoginAdminDaoImpl(SqlSession session) {
        this.session = session;
    }

    @Override
    public AdminDto selectUser(String admin_id) {
        return session.selectOne(namespace + "select", admin_id);
    }
}
