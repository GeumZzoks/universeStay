package com.universestay.project.admin.dao;

import com.universestay.project.admin.dto.NoticeDto;
import java.util.List;

public interface NoticeDao {

    List<NoticeDto> selectAll() throws Exception;

    NoticeDto select(Integer notice_id) throws Exception;

    int delete(Integer notice_id) throws Exception;

    int insert(NoticeDto noticeDto) throws Exception;

    int update(NoticeDto noticeDto) throws Exception;


}
