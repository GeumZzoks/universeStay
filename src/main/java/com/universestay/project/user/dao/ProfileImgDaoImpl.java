package com.universestay.project.user.dao;

import java.util.Map;
import java.util.UUID;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProfileImgDaoImpl implements ProfileImgDao {

    @Autowired
    SqlSession session;

    private String uuid_profile_img_id;

    private static String namespace = "com.universestay.project.user.dao.ProfileImgDao.";

    @Override
    public int insertProfileImg(String user_id, String profile_img_url)
            throws Exception {
        uuid_profile_img_id = UUID.randomUUID().toString();
        Map<String, String> map = Map.of("profile_img_id", uuid_profile_img_id, "user_id", user_id,
                "profile_img_url", profile_img_url);
        return session.insert(namespace + "insertProfileImg", map);
    }
}
