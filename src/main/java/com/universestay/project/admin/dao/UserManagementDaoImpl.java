package com.universestay.project.admin.dao;

import com.universestay.project.admin.dto.SearchCondition;
import com.universestay.project.user.dto.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class UserManagementDaoImpl implements UserManagementDao {

    @Autowired
    private SqlSession session;
    private static String namespace = "com.universestay.project.admin.dao.UserManagementMapper.";

    @Override
    public int countUser() throws Exception {
        return session.selectOne(namespace + "countUser");
    }

    @Override
    public UserDto selectUser(String user_id) throws Exception {
        return session.selectOne(namespace + "selectUser", user_id);
    }

    @Override
    public int updateUser(UserDto dto) throws Exception {
        return session.update(namespace + "updateUser", dto);
    }

    @Override
    public int insertUser(UserDto dto) throws Exception {
        return session.insert(namespace + "insertUser", dto);
    }

    @Override
    public int deleteUser(String user_id) throws Exception {
        return session.delete(namespace + "deleteUser", user_id);
    }

    @Override
    public List<UserDto> selectPage(Map map) throws Exception {
        return session.selectList(namespace + "selectPage", map);
    }

    @Override
    public List<UserDto> selectAll() throws Exception {
        return session.selectList(namespace + "selectAll");
    }


    @Override
    public int searchResultCount(SearchCondition sc) throws Exception {
        return session.selectOne(namespace + "searchResultCount", sc);
    }

    @Override
    public List<UserDto> searchSelectPage(SearchCondition sc) throws Exception {
        return session.selectList(namespace + "searchSelectPage", sc);
    }
}
