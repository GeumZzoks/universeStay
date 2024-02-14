package com.universestay.project.admin.dao;

import com.universestay.project.admin.dto.AdminDto;
import com.universestay.project.common.exception.CommonException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginAdminDaoImpl implements LoginAdminDao {

    private final String namespace = "com.universestay.project.resources.mybatis.mapper.admin.LoginAdminDao.";
    private final SqlSession session;


    @Autowired
    public LoginAdminDaoImpl(SqlSession session) {
        this.session = session;
    }

    @Override
    public AdminDto selectUser(String admin_email) throws CommonException {
        return session.selectOne(namespace + "select", admin_email);
    }

    @Override
    public String selectAdminId(String admin_email) throws CommonException {
        return session.selectOne(namespace + "selectAdminId", admin_email);
    }
}
