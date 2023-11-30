package com.universestay.project.user.service;

import com.universestay.project.user.dao.UserInfoDao;
import com.universestay.project.user.dto.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserInfoServiceImpl implements UserInfoService {

    @Autowired
    UserInfoDao userInfoDao;


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
    public int updateUserInfo(UserDto userDto) throws Exception {

        //---- 아직 profileImg mapper, Dao를 만들지 못해서 보류---//

        // To-do (추후)
//        UserDto user = userInfoDao.getUserInfo(userDto.getUser_email());
//        1.이미지 삭제 : 어떤 한 유저가 갖고있는 profile_img_id를 참조해서 ProfileImg 테이블을 뒤진다음 해당 프로필 이미지 삭제여부는 Y로 바꾼다.
//        String profileImgId = user.getProfile_img_id();
//        2. 새로운 프로필 이미지 등록 : 새로운 ProfileImg db가 하나 생성되고, 해당 db의 profile_img_id를 참조하여 User 테이블에서 profile_img_id를 바꾼다
//        3. user.setProfile_img_id("새로운 프로필 이미지 아이디"); 를 통해서 user에 새로운 프로필 이미지 아이디를 넣는다.

//        return userInfoDao.updateUserInfo(user);
        return 0;
    }
}
