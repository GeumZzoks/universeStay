package com.universestay.project.admin.service;

import com.universestay.project.admin.dto.AdminDto;
import com.universestay.project.common.exception.CommonException;

public interface RegisterService {

    Integer checkUniqueId(String admin_nickname) throws CommonException;

    Integer registerAdmin(AdminDto adminDto) throws CommonException;

    /* 관리자 이메일 존재 여부 확인 */
    Integer checkUniqueEmail(String admin_email) throws CommonException;

    /* 관리자 핸드폰 존재 여부 확인 */
    Integer checkUniquePhoneNumber(String admin_phone_num) throws CommonException;
}
