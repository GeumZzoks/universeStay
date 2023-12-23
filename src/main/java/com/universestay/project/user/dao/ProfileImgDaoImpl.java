package com.universestay.project.user.dao;

import com.universestay.project.user.dto.ProfileImgDto;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class ProfileImgDaoImpl implements ProfileImgDao {

    @Autowired
    SqlSession session;

    private String uuid_profile_img_id;

    private static String namespace = "com.universestay.project.user.dao.ProfileImgDao.";

    @Override
    public ProfileImgDto findProfileImg(String user_id) throws Exception {
        return session.selectOne(namespace + "findProfileImg", user_id);
    }

    @Override
    public List<ProfileImgDto> findProfileImgs(String user_id) {
        return session.selectList(namespace + "findProfileImgs", user_id);
    }

    @Override
    public int updateProfileImgStatus(String user_id) throws Exception {
        Map<String, String> map = Map.of("user_id", user_id, "profile_img_is_remove", "Y");
        return session.update(namespace + "updateProfileImgStatus", map);
    }

    @Override
    @Transactional
    public int insertProfileImg(String user_id, String profile_img_url)
            throws Exception {

        System.out.println("user_id = " + user_id);

        //새로운 profileImg를 insert하기 전, 기존 프로필 이미지 사진들의 profile_img_is_remove속성을 Y로 바꾼다.
        try {
            updateProfileImgStatus(user_id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        uuid_profile_img_id = UUID.randomUUID().toString();
        Map<String, String> map = Map.of("profile_img_id", uuid_profile_img_id, "user_id", user_id,
                "profile_img_url", profile_img_url);
        return session.insert(namespace + "insertProfileImg", map);
    }
}
