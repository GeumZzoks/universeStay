package com.universestay.project.admin.service;

import com.universestay.project.admin.dto.AdminDto;
import com.universestay.project.common.exception.CommonException;

public interface RegisterService {

    Integer checkUniqueId(String admin_nickname) throws CommonException;

    Integer registerAdmin(AdminDto adminDto) throws CommonException;
}
