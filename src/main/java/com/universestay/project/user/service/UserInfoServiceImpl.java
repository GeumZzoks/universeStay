package com.universestay.project.user.service;

import com.universestay.project.user.dao.ProfileImgDao;
import com.universestay.project.user.dao.UserInfoDao;
import com.universestay.project.user.dto.UserDto;
import java.io.File;
import java.sql.Timestamp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UserInfoServiceImpl implements UserInfoService {

    @Autowired
    private String uploadPath;

    @Autowired
    UserInfoDao userInfoDao;

    @Autowired
    ProfileImgDao profileImgDao;

    @Override
    public UserDto getUserInfo(String user_email) throws Exception {
        UserDto userInfo;
        //유저 이메일을 통해서 유저 정보를 db에서 조회한 뒤, user 객체를 반환.
        try {
            userInfo = userInfoDao.getUserInfo(user_email);
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception();
        }
        return userInfo;
    }

    @Override
    public int updateUserInfo(MultipartFile img, UserDto userDto) throws Exception {

        Timestamp currentTime = new Timestamp(System.currentTimeMillis());
        //확장자를 포함한 파일 이름 전체 추출
        String originalName = img.getOriginalFilename();
        //확장자 이름 추출
        String fileExtension = originalName.substring(originalName.lastIndexOf('.'));
        //현재 시간 + 원래 파일 이름 => 고유한 파일명 생성하기
        String savedName = currentTime + originalName;

        //업로드 패스에 저장된 이름으로 파일을 전송한다.
        img.transferTo(new File(uploadPath, savedName));
        profileImgDao.insertProfileImg(userDto.getUser_id(), uploadPath + "/" + savedName);
        userInfoDao.updateUserInfo(userDto);
        return 0;
    }
}
