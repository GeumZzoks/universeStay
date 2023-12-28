package com.universestay.project.chat.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker // 문자 채팅용
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

    @Override
    public void configureMessageBroker(MessageBrokerRegistry config) {
        config.enableSimpleBroker("/subscribe"); // 메시지 받을 때 요청 url, 여러개써도됨
        config.setApplicationDestinationPrefixes("/app"); // 메시지 보낼 때 요청 url
    }

    // 웹 소켓 연결을 위한 엔드포인트 설정 및 stomp 엔드포인트 설정
    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        registry.addEndpoint("/endpoint") // stomp 접속 주소 url => /endpoint
                .setAllowedOrigins("*") // 경민 : 나연님 혹시 에러나면 이줄 없애보세요
                .withSockJS(); // SocketJS 를 연결한다는 설정
    }
}
