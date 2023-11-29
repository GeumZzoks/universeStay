package com.universestay.project.admin.dao;

import com.universestay.project.admin.dto.SearchCondition;
import com.universestay.project.user.dto.UserDto;

import java.util.List;
import java.util.Map;

public interface UserManagementDao {
    int countUser() throws Exception;

    UserDto selectUser(String user_id) throws Exception;

    int updateUser(UserDto dto) throws Exception;

    int insertUser(UserDto dto) throws Exception;

    int deleteUser(String user_id) throws Exception;

    List<UserDto> selectPage(Map map) throws Exception;

    List<UserDto> selectAll() throws Exception;
    
    int searchResultCount(SearchCondition sc) throws Exception;

    List<UserDto> searchSelectPage(SearchCondition sc) throws Exception;
}
