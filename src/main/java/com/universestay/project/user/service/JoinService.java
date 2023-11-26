package com.universestay.project.user.service;

import com.universestay.project.user.dto.UserRequestDto;

public interface JoinService {

    int registerUser(UserRequestDto userRequestDto) throws Exception;
    
}
