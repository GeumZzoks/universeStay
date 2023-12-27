package com.universestay.project.oauth.service;

import com.universestay.project.oauth.dto.google.GoogleInfResponseDto;
import com.universestay.project.oauth.dto.google.GoogleRequestDto;
import com.universestay.project.oauth.dto.google.GoogleResponseDto;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
@PropertySource("classpath:config/oauth.properties")
public class GoogleLoginService {

    @Value("${GOOGLE_CLIENT_ID}")
    private String googleClientId;
    @Value("${GOOGLE_SECRET}")
    private String googleClientPw;
    @Value("${GOOGLE_REDIRECT_URL}")
    private String GOOGLE_REDIRECT_URL;

    public ResponseEntity<GoogleInfResponseDto> getGoogleInfo(String authCode) throws Exception {
        RestTemplate restTemplate = new RestTemplate();

        // googleClientId, googleClientPw, authCode를 사용하여 GoogleRequestDto를 빌더패턴으로 생성한다.
        GoogleRequestDto googleOAuthRequestParam = GoogleRequestDto
                .builder()
                .clientId(googleClientId)
                .clientSecret(googleClientPw)
                .code(authCode)
                .redirectUri("http://universestay.store/oauth2/google")
                .grantType("authorization_code").build();

        // RestTemplate을 활용하여 https://oauth2.googleapis.com/token (구글 인가 서버)에 토큰을 요청한다.
        // 동기식으로 결과 값을 받아와서 ResponseEntity<GoogleResponseDto>에 저장한다.
        ResponseEntity<GoogleResponseDto> resultEntity = restTemplate.postForEntity(
                "https://oauth2.googleapis.com/token",
                googleOAuthRequestParam, GoogleResponseDto.class);

        String jwtToken = resultEntity.getBody().getId_token();

        return getUserInfoWithToken(jwtToken);
    }

    private ResponseEntity<GoogleInfResponseDto> getUserInfoWithToken(String jwtToken)
            throws Exception {
        RestTemplate restTemplate = new RestTemplate();
        // Map에 토큰을 저장한다.
        Map<String, String> map = new HashMap<>();
        map.put("id_token", jwtToken);
        // RestTemplate을 활용하여 https://oauth2.googleapis.com/tokeninfo (리소스 서버)에 유저 리소스를 요청한다.
        // 동기적으로 결과값을 받아온다.
        ResponseEntity<GoogleInfResponseDto> resultEntity = restTemplate.postForEntity(
                "https://oauth2.googleapis.com/tokeninfo",
                map, GoogleInfResponseDto.class);

        return resultEntity;
    }
}
