package com.universestay.project.admin.service;

import com.universestay.project.common.SearchCondition;
import com.universestay.project.user.dto.UserDto;

import java.util.List;
import java.util.Map;

public interface UserManagementService {
    int getCount() throws Exception;

    UserDto read(String user_id) throws Exception;

    int modify(UserDto userDto) throws Exception;

    List<UserDto> getList() throws Exception;

    List<UserDto> getPage(Map map) throws Exception;

    int getSearchResultCnt(SearchCondition sc) throws Exception;

    List<UserDto> getSearchResultPage(SearchCondition sc) throws Exception;
}
