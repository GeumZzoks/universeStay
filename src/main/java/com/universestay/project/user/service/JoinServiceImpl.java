package com.universestay.project.user.service;

import com.universestay.project.user.dao.UserJoinDao;
import com.universestay.project.user.dto.UserDto;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

@Service
public class JoinServiceImpl implements JoinService {

    @Autowired
    UserJoinDao userJoinDao;

    private String uuid_user_id;

    @Override
    public int registerUser(UserDto userDto) {

        uuid_user_id = UUID.randomUUID().toString();
        String status_id = "U01";

        String user_pwd_encrypt = encrypt(userDto.getUser_email(), userDto.getUser_pwd());

        userDto.setUser_id(uuid_user_id);
        userDto.setUser_pwd(user_pwd_encrypt);
        userDto.getUser_name();
        userDto.getUser_address();
        userDto.getUser_email();
        userDto.getUser_phone_num1();
        userDto.getUser_phone_num2();
        userDto.getUser_birth();
        userDto.setStatus_id(status_id);
        userDto.setCreated_id(uuid_user_id);
        userDto.setUpdated_id(uuid_user_id);

        try {
            return userJoinDao.insertUser(userDto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // 회원가입 시, 유효성 체크
    public Map<String, String> validateHandling(Errors errors) {
        Map<String, String> validatorResult = new HashMap<>();

        for (FieldError error : errors.getFieldErrors()) {
            String validKeyName = String.format("valid_%s", error.getField());
            validatorResult.put(validKeyName, error.getDefaultMessage());
        }

        return validatorResult;
    }


    @Override
    public int checkNickname(String user_nickname) throws Exception {
        return userJoinDao.checkNickname(user_nickname);
    }

    @Override
    public int checkEmail(String user_email) throws Exception {
        return userJoinDao.checkEmail(user_email);
    }

    // 비밀번호 암호화
    private String encrypt(String email, String password) {
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