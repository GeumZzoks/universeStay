package com.universestay.project.notice.dao;

import com.universestay.project.notice.dto.NoticeDto;
import java.util.List;
import java.util.Map;

public interface NoticeDao {

    // 공지사항 전체 글 개수
    int count() throws Exception;

    // 공지사항 목록
    List<NoticeDto> selectAll() throws Exception;

    List<NoticeDto> selectPage(Map map) throws Exception;

    // 공자사항 조회
    NoticeDto select(Integer notice_id) throws Exception;

    // 공지사항 삭제
    int delete(Integer notice_id) throws Exception;

    // 공지사항 등록
    int insert(NoticeDto noticeDto) throws Exception;

    // 공지사항 수정
    int update(NoticeDto noticeDto) throws Exception;

}
