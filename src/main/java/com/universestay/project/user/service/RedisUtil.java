//package com.universestay.project.user.service;
//
//import java.util.concurrent.TimeUnit;
//import lombok.RequiredArgsConstructor;
//import org.springframework.data.redis.core.RedisTemplate;
//import org.springframework.data.redis.core.ValueOperations;
//import org.springframework.stereotype.Component;
//import org.springframework.stereotype.Service;
//
//@Service
//@RequiredArgsConstructor
//@Component
//public class RedisUtil {
//
//    private final RedisTemplate<String, String> redisTemplate;
//
//    // key를 통해 value 리턴
//    public String getData(String key) {
//        ValueOperations<String, String> valueOperations = redisTemplate.opsForValue();
//        return valueOperations.get(key);
//    }
//
//    public void setData(String key, String value) {
//        ValueOperations<String, String> valueOperations = redisTemplate.opsForValue();
//        valueOperations.set(key, value);
//    }
//
//    // 유효 시간 동안 (key, value) 저장
//    public void setDataExpire(String key, String value, long duration) {
//        ValueOperations<String, String> valueOperations = redisTemplate.opsForValue();
//
//        // Set the value in Redis
//        valueOperations.set(key, value);
//
//        // Set the expiration time for the key in Redis
//        redisTemplate.expire(key, duration, TimeUnit.SECONDS);
//    }
//
//    // 삭제
//    public void deleteData(String key) {
//        redisTemplate.delete(key);
//    }
//}
