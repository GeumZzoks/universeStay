package com.universestay.project.common.exception;

import lombok.Getter;

@Getter
public class CommonException extends RuntimeException {

    private final StatusCode statusCode;

    public CommonException(StatusCode statusCode) {
        super(statusCode.getStatusMsg());
        this.statusCode = statusCode;
    }

}
