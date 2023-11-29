package com.universestay.project.admin.service;

import com.universestay.project.admin.dto.NoticeDto;
import java.util.List;

public interface NoticeService {

    List<NoticeDto> getList() throws Exception;

    NoticeDto read(Integer notice_id) throws Exception;

    int remove(Integer notice_id) throws Exception;

    int write(NoticeDto noticeDto) throws Exception;

    int modify(NoticeDto noticeDto) throws Exception;

}
