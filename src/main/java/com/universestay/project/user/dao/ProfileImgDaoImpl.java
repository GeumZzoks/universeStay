package com.universestay.project.user.dao;

import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProfileImgDaoImpl implements ProfileImgDao {

    @Autowired
    SqlSession session;
    private static String namespace = "com.universestay.project.user.dao.ProfileImgDao.";

    @Override
    public int insertProfileImg(String user_id, String profile_img_url) throws Exception {
        Map<String, String> map = Map.of("user_id", user_id, "profile_img_url", profile_img_url);
        return session.insert(namespace + "insertProfileImg", map);
    }
}
