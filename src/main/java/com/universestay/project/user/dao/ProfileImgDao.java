package com.universestay.project.user.dao;

import com.universestay.project.user.dto.ProfileImgDto;
import java.util.List;

public interface ProfileImgDao {

    ProfileImgDto findProfileImg(String user_id) throws Exception;

    List<ProfileImgDto> findProfileImgs(String user_id) throws Exception;

    int insertProfileImg(String user_id, String profile_img_url) throws Exception;

    int updateProfileImgStatus(String user_id) throws Exception;
}
