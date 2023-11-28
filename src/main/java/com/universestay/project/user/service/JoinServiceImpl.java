package com.universestay.project.user.service;

import com.universestay.project.user.dao.UserJoinDao;
import com.universestay.project.user.dto.UserDto;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.util.Base64;
import java.util.UUID;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JoinServiceImpl implements JoinService {

    @Autowired
    UserJoinDao userJoinDao;

    @Override
    public int registerUser(UserDto userDto) throws Exception {

        String uuid = UUID.randomUUID().toString();
        String status_id = "U01";

        String user_pwd_encrypt = encrypt(userDto.getUser_email(), userDto.getUser_pwd());

        userDto.setUser_id(uuid);
        userDto.setUser_pwd(user_pwd_encrypt);
        userDto.getUser_pwd();
        userDto.getUser_name();
        userDto.getUser_address();
        userDto.getUser_email();
        userDto.getUser_phone_num1();
        userDto.getUser_phone_num2();
        userDto.getUser_birth();
        userDto.setStatus_id(status_id);
        userDto.setCreated_id(uuid);
        userDto.setUpdated_id(uuid);
        userDto.getUser_img_url();

        return userJoinDao.insertUser(userDto);
    }

    @Override
    public int checkNickname(String user_nickname) throws Exception {
        int result = 0;

        System.out.println("user_nickname = " + user_nickname);
        result = userJoinDao.checkNickname(user_nickname);
        return result;
    }

    // 비밀번호 암호화
    private String encrypt(String email, String password) {
        System.out.println("email = " + email);
        System.out.println("password = " + password);
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

    private byte[] getSalt(String email)
            throws NoSuchAlgorithmException, UnsupportedEncodingException {

        MessageDigest digest = MessageDigest.getInstance("SHA-512");
        byte[] keyBytes = email.getBytes("UTF-8");

        return digest.digest(keyBytes);
    }
}
