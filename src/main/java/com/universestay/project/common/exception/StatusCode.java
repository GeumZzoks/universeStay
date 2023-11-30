package com.universestay.project.common.exception;

import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
public enum StatusCode {
    // 예시
    NULL_INPUT_CHAT_REQUEST(HttpStatus.BAD_REQUEST, "101", "필수 입력항목중 미입력 항목이 존재합니다.");

    private final HttpStatus httpStatus;
    private final String statusCode;
    private final String statusMsg;

    StatusCode(HttpStatus httpStatus, String statusCode, String statusMsg) {
        this.httpStatus = httpStatus;
        this.statusCode = statusCode;
        this.statusMsg = statusMsg;
    }
}
