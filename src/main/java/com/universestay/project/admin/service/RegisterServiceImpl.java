package com.universestay.project.admin.service;

import com.universestay.project.admin.dao.RegisterDao;
import com.universestay.project.admin.dto.AdminDto;
import com.universestay.project.common.exception.CommonException;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RegisterServiceImpl implements RegisterService {

    private final RegisterDao registerDao;

    @Autowired
    public RegisterServiceImpl(RegisterDao registerDao) {
        this.registerDao = registerDao;
    }

    @Override
    public Integer checkUniqueId(String admin_nickname) throws CommonException {
        return registerDao.checkUniqueId(admin_nickname);
    }

    @Override
    public Integer registerAdmin(AdminDto adminDto) throws CommonException {

        String uuid = UUID.randomUUID().toString();
        adminDto.setAdmin_id(uuid);
        adminDto.setCreated_id(uuid);
        adminDto.setUpdated_id(uuid);

        return registerDao.insertUser(adminDto);
    }
}
