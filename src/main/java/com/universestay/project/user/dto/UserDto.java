package com.universestay.project.user.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.Objects;

public class UserDto {

    private String user_id;
    private String user_id2;
    private String status_id;
    private String profile_img_id;
    private String user_pwd;
    private String user_nickname;
    private String user_name;
    private String user_email;
    private Timestamp user_last_login;
    private String user_phone_num1;
    private String user_phone_num2;
    private String user_address;
    private Date user_birth;
    private String user_is_certificated;
    private String user_is_host;
    private Timestamp user_hosting_started_at;
    private String user_img_url;
    private String user_bio;
    private Timestamp created_at;
    private String created_id;
    private Timestamp updated_at;
    private String updated_id;

    public UserDto() {
    }

    public UserDto(String user_id, String user_id2, String status_id, String profile_img_id,
            String user_pwd, String user_nickname, String user_name, String user_email,
            Timestamp user_last_login, String user_phone_num1, String user_phone_num2,
            String user_address, Date user_birth, String user_is_certificated, String user_is_host,
            Timestamp user_hosting_started_at, String user_img_url, String user_bio,
            Timestamp created_at, String created_id, Timestamp updated_at, String updated_id) {
        this.user_id = user_id;
        this.user_id2 = user_id2;
        this.status_id = status_id;
        this.profile_img_id = profile_img_id;
        this.user_pwd = user_pwd;
        this.user_nickname = user_nickname;
        this.user_name = user_name;
        this.user_email = user_email;
        this.user_last_login = user_last_login;
        this.user_phone_num1 = user_phone_num1;
        this.user_phone_num2 = user_phone_num2;
        this.user_address = user_address;
        this.user_birth = user_birth;
        this.user_is_certificated = user_is_certificated;
        this.user_is_host = user_is_host;
        this.user_hosting_started_at = user_hosting_started_at;
        this.user_img_url = user_img_url;
        this.user_bio = user_bio;
        this.created_at = created_at;
        this.created_id = created_id;
        this.updated_at = updated_at;
        this.updated_id = updated_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUser_id2() {
        return user_id2;
    }

    public void setUser_id2(String user_id2) {
        this.user_id2 = user_id2;
    }

    public String getStatus_id() {
        return status_id;
    }

    public void setStatus_id(String status_id) {
        this.status_id = status_id;
    }

    public String getProfile_img_id() {
        return profile_img_id;
    }

    public void setProfile_img_id(String profile_img_id) {
        this.profile_img_id = profile_img_id;
    }

    public String getUser_pwd() {
        return user_pwd;
    }

    public void setUser_pwd(String user_pwd) {
        this.user_pwd = user_pwd;
    }

    public String getUser_nickname() {
        return user_nickname;
    }

    public void setUser_nickname(String user_nickname) {
        this.user_nickname = user_nickname;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public Timestamp getUser_last_login() {
        return user_last_login;
    }

    public void setUser_last_login(Timestamp user_last_login) {
        this.user_last_login = user_last_login;
    }

    public String getUser_phone_num1() {
        return user_phone_num1;
    }

    public void setUser_phone_num1(String user_phone_num1) {
        this.user_phone_num1 = user_phone_num1;
    }

    public String getUser_phone_num2() {
        return user_phone_num2;
    }

    public void setUser_phone_num2(String user_phone_num2) {
        this.user_phone_num2 = user_phone_num2;
    }

    public String getUser_address() {
        return user_address;
    }

    public void setUser_address(String user_address) {
        this.user_address = user_address;
    }

    public Date getUser_birth() {
        return user_birth;
    }

    public void setUser_birth(Date user_birth) {
        this.user_birth = user_birth;
    }

    public String getUser_is_certificated() {
        return user_is_certificated;
    }

    public void setUser_is_certificated(String user_is_certificated) {
        this.user_is_certificated = user_is_certificated;
    }

    public String getUser_is_host() {
        return user_is_host;
    }

    public void setUser_is_host(String user_is_host) {
        this.user_is_host = user_is_host;
    }

    public Timestamp getUser_hosting_started_at() {
        return user_hosting_started_at;
    }

    public void setUser_hosting_started_at(Timestamp user_hosting_started_at) {
        this.user_hosting_started_at = user_hosting_started_at;
    }

    public String getUser_img_url() {
        return user_img_url;
    }

    public void setUser_img_url(String user_img_url) {
        this.user_img_url = user_img_url;
    }

    public String getUser_bio() {
        return user_bio;
    }

    public void setUser_bio(String user_bio) {
        this.user_bio = user_bio;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public String getCreated_id() {
        return created_id;
    }

    public void setCreated_id(String created_id) {
        this.created_id = created_id;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }

    public String getUpdated_id() {
        return updated_id;
    }

    public void setUpdated_id(String updated_id) {
        this.updated_id = updated_id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        UserDto userDto = (UserDto) o;
        return user_id.equals(userDto.user_id) && Objects.equals(user_id2, userDto.user_id2)
                && status_id.equals(userDto.status_id) && profile_img_id.equals(
                userDto.profile_img_id)
                && user_pwd.equals(userDto.user_pwd) && user_nickname.equals(userDto.user_nickname)
                && user_name.equals(userDto.user_name) && user_email.equals(userDto.user_email)
                && user_last_login.equals(userDto.user_last_login) && user_phone_num1.equals(
                userDto.user_phone_num1) && Objects.equals(user_phone_num2,
                userDto.user_phone_num2) && user_address.equals(userDto.user_address)
                && user_birth.equals(userDto.user_birth) && Objects.equals(
                user_is_certificated, userDto.user_is_certificated) && user_is_host.equals(
                userDto.user_is_host) && Objects.equals(user_hosting_started_at,
                userDto.user_hosting_started_at) && Objects.equals(user_img_url,
                userDto.user_img_url) && Objects.equals(user_bio, userDto.user_bio)
                && created_at.equals(userDto.created_at) && created_id.equals(userDto.created_id)
                && updated_at.equals(userDto.updated_at) && updated_id.equals(userDto.updated_id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(user_id, user_id2, status_id, profile_img_id, user_pwd, user_nickname,
                user_name, user_email, user_last_login, user_phone_num1, user_phone_num2,
                user_address,
                user_birth, user_is_certificated, user_is_host, user_hosting_started_at,
                user_img_url,
                user_bio, created_at, created_id, updated_at, updated_id);
    }

    @Override
    public String toString() {
        return "UserDto{" +
                "user_id='" + user_id + '\'' +
                ", user_id2='" + user_id2 + '\'' +
                ", status_id='" + status_id + '\'' +
                ", profile_img_id='" + profile_img_id + '\'' +
                ", user_pwd='" + user_pwd + '\'' +
                ", user_nickname='" + user_nickname + '\'' +
                ", user_name='" + user_name + '\'' +
                ", user_email='" + user_email + '\'' +
                ", user_last_login=" + user_last_login +
                ", user_phone_num1='" + user_phone_num1 + '\'' +
                ", user_phone_num2='" + user_phone_num2 + '\'' +
                ", user_address='" + user_address + '\'' +
                ", user_birth=" + user_birth +
                ", user_is_certificated='" + user_is_certificated + '\'' +
                ", user_is_host='" + user_is_host + '\'' +
                ", user_hosting_started_at=" + user_hosting_started_at +
                ", user_img_url='" + user_img_url + '\'' +
                ", user_bio='" + user_bio + '\'' +
                ", created_at=" + created_at +
                ", created_id='" + created_id + '\'' +
                ", updated_at=" + updated_at +
                ", updated_id='" + updated_id + '\'' +
                '}';
    }
}
