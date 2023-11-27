package com.universestay.project.admin.dao;

import com.universestay.project.admin.dto.AdminDto;

public interface LoginAdminDao {

    AdminDto selectUser(String admin_id);
}
