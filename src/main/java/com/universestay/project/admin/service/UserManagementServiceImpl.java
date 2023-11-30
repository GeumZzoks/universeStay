package com.universestay.project.admin.service;

import com.universestay.project.admin.dao.UserManagementDao;
import com.universestay.project.common.SearchCondition;
import com.universestay.project.user.dto.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class UserManagementServiceImpl implements UserManagementService {

    @Autowired
    UserManagementDao userManagementDao;

    @Override
    public int getCount() throws Exception {
        return userManagementDao.countUser();
    }

    @Override
    public UserDto read(String user_id) throws Exception {
        return userManagementDao.selectUser(user_id);
    }

    @Override
    public int modify(UserDto userDto) throws Exception {
        return userManagementDao.updateUser(userDto);
    }

    @Override
    public List<UserDto> getList() throws Exception {
        return userManagementDao.selectAll();
    }

    @Override
    public List<UserDto> getPage(Map map) throws Exception {
        return userManagementDao.selectPage(map);
    }

    @Override
    public int getSearchResultCnt(SearchCondition sc) throws Exception {
        return userManagementDao.searchResultCount(sc);
    }

    @Override
    public List<UserDto> getSearchResultPage(SearchCondition sc) throws Exception {
        return userManagementDao.searchSelectPage(sc);
    }
}
