package com.universestay.project.admin.service;

import com.universestay.project.admin.dto.NoticeDto;
import java.util.List;
import java.util.Map;

public interface NoticeService {

    // 공지사항 전체 글 개수
    int getCount() throws Exception;

    // 공지사항 목록
    List<NoticeDto> getList() throws Exception;

    List<Map<String, Object>> getPage(Map map) throws Exception;

    // 공지사항 조회
    NoticeDto read(Integer notice_id) throws Exception;

    // 공지사항 삭제
    int remove(Integer notice_id) throws Exception;

    // 공지사항 등록
    int write(NoticeDto noticeDto) throws Exception;

    // 공지사항 수정
    int modify(NoticeDto noticeDto) throws Exception;

    String getAdminId(String admin_email) throws Exception;

}
