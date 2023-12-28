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

    // 업데이트가 됐으면 1로 반환을 받고 싶어서 반환타입 int 설정
    @Override
    public Integer updateLastLogin(String user_email) throws Exception {
        return session.update(namespace+"updateLastLogin", user_email);
    }


}
