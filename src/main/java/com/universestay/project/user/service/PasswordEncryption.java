package com.universestay.project.user.service;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

public interface PasswordEncryption {

    String encrypt(String email, String password);

    byte[] getSalt(String email) throws NoSuchAlgorithmException, UnsupportedEncodingException;
}
