package com.universestay.project.admin.dao;

import com.universestay.project.admin.dto.AdminDto;
import com.universestay.project.common.exception.CommonException;

public interface RegisterDao {

    /* 회원 조회 */
    Integer selectUser(String admin_id) throws CommonException;
//    AdminDto selectUser(String admin_id) throws CommonException;

    /* 회원 등록 */
    Integer insertUser(AdminDto adminDto) throws CommonException;

    /* 회원 수정 */
    Integer updateUser(AdminDto adminDto) throws CommonException;

    /* 회원 삭제 */
    Integer deleteUser(String admin_id) throws CommonException;

    /* 전체 삭제 */
    Integer deleteUserAll() throws CommonException;

    /* 관리자 닉네임 존재 여부 확인 */
    Integer checkUniqueId(String admin_nickname) throws CommonException;
}
