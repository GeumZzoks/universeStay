package com.universestay.project.user.service;

import com.universestay.project.user.dao.ProfileImgDao;
import com.universestay.project.user.dao.UserInfoDao;
import com.universestay.project.user.dto.UserDto;
import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UserInfoServiceImpl implements UserInfoService {

    @Autowired
    private String uploadProfileImgPath;

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
    public int updateUserInfo(MultipartFile img, UserDto user) throws Exception {
        System.out.println("img = " + img);
        //img를 첨부했다면 아래 과정 진행
        if (img == null) {
            userInfoDao.updateUserInfo(user);
        }

        if (img != null && !img.isEmpty()) {
            //확장자를 포함한 파일 이름 전체 추출
            String originalName = img.getOriginalFilename();
            //이미지가 저장될 로컬 저장소의 경로 정의
            String savePath = getUploadPath() + uploadProfileImgPath;
            //저장될 이미지 이름을 정의
            String saveFileName = generateFileName(originalName);

            //savePath에 saveFileName으로 파일을 저장한다.
            img.transferTo(new File(savePath,
                    saveFileName));
            //profileImg에 DB를 저장한다. 이때 프로필 저장되는 이미지 경로는 /src/main/webapp/resources/upload-imgs/profileImg/ + 파일명임. 불러올때는 앞에
            profileImgDao.insertProfileImg(user.getUser_id(),
                    "/resources/upload-imgs/profileImg/" + saveFileName);
        } else {
            System.out.println("이미지는 없음");
        }

        userInfoDao.updateUserInfo(user);
        return 0;
    }


    //로컬 저장소에 upload할 절대적인 경로 얻어오기
    public String getUploadPath() {
        String home = this.getClass().getResource("/").getPath();
        String targetFolder = "universeStay";

        int index = home.indexOf(targetFolder);
        String desiredPath = home.substring(0, index + targetFolder.length());
        return desiredPath;
    }

    public static String generateFileName(String originalName) {
        Timestamp currentTime = new Timestamp(System.currentTimeMillis());

        // 현재 시간을 형식화하여 공백과 콜론 제거
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        String currentTimeString = sdf.format(currentTime);

        // 특수 문자와 공백을 제거하고 유효한 파일명으로 변환
        String savedName = currentTimeString + "_" + originalName.replaceAll("[^a-zA-Z0-9.-]", "_");

        return savedName;
    }

    @Override
    public String checkNickname(String user_email, String user_nickname) throws Exception {
        UserDto userInfo = userInfoDao.getUserInfo(user_email);
        if (userInfo.getUser_nickname().equals(user_nickname)) {
            //본인의 닉네임을 그대로 쓸때 가능
            return "N";
        } else if (userInfoDao.checkNickname(user_email, user_nickname) == 0) {
            //본인의 기존 닉네임을 제외하고 다른 닉네임들에서 중복이 있는지 체크하기.
            return "N";
        }
        return "Y";
    }
}
