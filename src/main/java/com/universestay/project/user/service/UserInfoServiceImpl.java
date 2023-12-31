package com.universestay.project.user.service;

import com.universestay.project.common.S3.AwsS3ImgUploaderService;
import com.universestay.project.user.dao.ProfileImgDao;
import com.universestay.project.user.dao.UserInfoDao;
import com.universestay.project.user.dto.UserDto;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.util.Base64;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UserInfoServiceImpl implements UserInfoService, PasswordEncryption {

    @Autowired
    private String uploadProfileImgPath;

    @Autowired
    UserInfoDao userInfoDao;

    @Autowired
    ProfileImgDao profileImgDao;

    @Autowired
    AwsS3ImgUploaderService awsS3ImgUploaderService;

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
    @Transactional
    public int updateUserInfo(MultipartFile img, UserDto user) throws Exception {
        //img를 첨부했다면 아래 과정 진행
        if (img == null) {
            userInfoDao.updateUserInfo(user);
        }

        if (img != null && !img.isEmpty()) {
            String imgUrl = awsS3ImgUploaderService.uploadImageToS3(
                    img, "profile-img"); // aws로 이미지 업로드후 s3 url 받아오기
            profileImgDao.insertProfileImg(user.getUser_id(),
                    imgUrl);
        } else {
            System.out.println("이미지는 없음");
        }

        userInfoDao.updateUserInfo(user);
        return 0;
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

    @Override
    public String changePwd(String check_pwd, String new_pwd, String new_pwd2,
            HttpSession httpSession)
            throws Exception {
        String user_email = (String) httpSession.getAttribute("user_email");
        String original_pwd = getUserInfo(user_email).getUser_pwd();

        // 사용자가 현재 비밀번호를 입력한 것을 암호화 : db에 암호화된 비밀번호와 비교하기 위해
        String encrypt_input_pwd = encrypt(user_email, check_pwd);

        if (original_pwd.equals(encrypt_input_pwd) && new_pwd.equals(new_pwd2)) {
            // 원래 비밀번호와 DB에 저장된 비밀번호가 같고, 신규 비밀번호와 신규비밀번호 체크가 같으면 비밀번호를 변경한다.

            // 사용자가 입력한 신규 비밀번호를 암호화
            String encrypt_new_pwd = encrypt(user_email, new_pwd);

            userInfoDao.changePwd(user_email, encrypt_new_pwd);
            return "Correct";
        } else if (!original_pwd.equals(encrypt_input_pwd)) {
            return "Incorrect_with_DB";
        } else if (!new_pwd.equals(new_pwd2)) {
            return "Incorrect_with_pwd_pwd2";
        }

        return "Server_Error";
    }

    @Override
    public String encrypt(String email, String password) {
        try {
            KeySpec spec = new PBEKeySpec(password.toCharArray(), getSalt(email), 85319, 128);
            SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");

            byte[] hash = factory.generateSecret(spec).getEncoded();
            return Base64.getEncoder().encodeToString(hash);
        } catch (NoSuchAlgorithmException | UnsupportedEncodingException |
                 InvalidKeySpecException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public byte[] getSalt(String email)
            throws NoSuchAlgorithmException, UnsupportedEncodingException {
        MessageDigest digest = MessageDigest.getInstance("SHA-512");
        byte[] keyBytes = email.getBytes("UTF-8");

        return digest.digest(keyBytes);
    }

}


