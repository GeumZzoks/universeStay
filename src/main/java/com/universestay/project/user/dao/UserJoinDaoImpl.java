package com.universestay.project.user.dao;

import com.universestay.project.user.dto.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserJoinDaoImpl implements UserJoinDao {

    @Autowired
    SqlSession session;
    private static String namespace = "com.universestay.project.user.dao.UserJoinDao.";

    @Override
    public int insertUser(UserDto userDto) {
        try {
            return session.insert(namespace + "insertUser", userDto);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return e.getMessage().length();
        }
    }

    @Override
    public int checkNickname(String user_nickname) throws Exception {
        return session.selectOne(namespace + "checkId", user_nickname);
    }

    @Override
    public int checkEmail(String user_email) throws Exception {
        return session.selectOne(namespace + "checkEmail", user_email);
    }


}
