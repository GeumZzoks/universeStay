package com.universestay.project.admin.dao;

import com.universestay.project.admin.dto.AdminDto;
import com.universestay.project.common.exception.CommonException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RegisterDaoImpl implements RegisterDao {

    private final String namespace = "com.universestay.project.resources.mybatis.mapper.admin.registerMapper.";
    private final SqlSession session;

    @Autowired
    public RegisterDaoImpl(SqlSession session) {
        this.session = session;
    }

    @Override
    public Integer selectUser(String admin_id) throws CommonException {
        return session.selectOne(namespace + "select", admin_id);
    }

//    @Override
//    public AdminDto selectUser(String admin_id) throws CommonException {
//        return session.selectOne(namespace + "select", admin_id);
//    }

    @Override
    public Integer insertUser(AdminDto adminDto) throws CommonException {
        return session.insert(namespace + "insert", adminDto);
    }

    @Override
    public Integer deleteUser(String admin_id) throws CommonException {
        return session.delete(namespace + "delete", admin_id);
    }

    @Override
    public Integer deleteUserAll() throws CommonException {
        return session.delete(namespace + "deleteAll");
    }

    @Override
    public Integer updateUser(AdminDto adminDto) throws CommonException {
        return session.update(namespace + "update", adminDto);
    }
}
