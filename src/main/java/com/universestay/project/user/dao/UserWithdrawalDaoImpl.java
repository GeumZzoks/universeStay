package com.universestay.project.user.dao;

import com.universestay.project.user.dto.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserWithdrawalDaoImpl implements UserWithdrawalDao {

    @Autowired
    SqlSession session;
    private static String namespace = "com.universestay.project.user.dao.UserWithdrawalDao.";

    @Override
    public int deleteUser(String user_email) throws Exception {
        return session.update(namespace + "deleteUser", user_email);
    }

    @Override
    public UserDto selectUserByUuid(String uuid) throws Exception {
        return session.selectOne(namespace + "selectUserByUuid", uuid);
    }
}
