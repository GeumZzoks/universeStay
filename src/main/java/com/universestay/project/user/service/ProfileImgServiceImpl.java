package com.universestay.project.user.service;


import com.universestay.project.user.dao.ProfileImgDao;
import com.universestay.project.user.dto.ProfileImgDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProfileImgServiceImpl implements ProfileImgService {

    @Autowired
    ProfileImgDao profileImgDao;

    @Override
    public String getProfileImgUrl(String user_id) throws Exception {
        ProfileImgDto profileImg = profileImgDao.findProfileImg(user_id);

        if (profileImg != null) {
            return profileImg.getProfile_img_url();
        } else {
            return "";
        }
    }
}
