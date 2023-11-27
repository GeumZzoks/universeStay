package com.universestay.project.user.dao;

import com.universestay.project.user.dto.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserLoginDaoImpl implements UserLoginDao {

    @Autowired
    private SqlSession session;
    private static String namespace = "com.universestay.project.user.dao.UserLoginDao.";

    @Override
    public UserDto selectUser(String user_email) throws Exception {
        return session.selectOne(namespace + "selectUser", user_email);
    }

}
