package com.universestay.project.docs;

import io.swagger.annotations.ApiModelProperty;

public class SwaggerTestModel {

    @ApiModelProperty(notes = "사용자 이름", example = "금쪽이", required = true)
    private String username;

    @ApiModelProperty(notes = "사용자 이메일", example = "abc@example.com", required = true)
    private String email;

    @ApiModelProperty(notes = "사용자 비밀번호", example = "1234", required = true)
    private String pwd;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
}