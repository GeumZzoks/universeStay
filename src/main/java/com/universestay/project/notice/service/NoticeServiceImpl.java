package com.universestay.project.notice.service;

import com.universestay.project.notice.dao.NoticeDao;
import com.universestay.project.notice.dto.NoticeDto;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    NoticeDao noticeDao;

    @Override
    public List<NoticeDto> getList() throws Exception {
        return noticeDao.selectAll();
    }

    @Override
    public NoticeDto read(Integer notice_id) throws Exception {
        return noticeDao.select(notice_id);
    }

    @Override
    public int remove(Integer notice_id) throws Exception {
        return noticeDao.delete(notice_id);
    }

    @Override
    public int write(NoticeDto noticeDto) throws Exception {
        return noticeDao.insert(noticeDto);
    }

    @Override
    public int modify(NoticeDto noticeDto) throws Exception {
        return noticeDao.update(noticeDto);
    }
}
