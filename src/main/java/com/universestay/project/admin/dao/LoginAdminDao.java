package com.universestay.project.admin.dao;

import com.universestay.project.admin.dto.AdminDto;
import com.universestay.project.common.exception.CommonException;

public interface LoginAdminDao {

    AdminDto selectUser(String admin_email) throws CommonException;
}
