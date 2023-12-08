package com.universestay.project.admin.service;

import com.universestay.project.admin.dao.NoticeDao;
import com.universestay.project.admin.dto.NoticeDto;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    NoticeDao noticeDao;

    @Override
    public int getCount() throws Exception {
        return noticeDao.count();
    }

    @Override
    public List<NoticeDto> getList() throws Exception {
        return noticeDao.selectAll();
    }

    @Override
    public List<Map<String, Object>> getPage(Map map) throws Exception {
        return noticeDao.selectPage(map);
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
        return noticeDao.insertSelectKey(noticeDto);
    }

    @Override
    public int modify(NoticeDto noticeDto) throws Exception {
        return noticeDao.update(noticeDto);
    }

    @Override
    public String getAdminId(String admin_email) throws Exception {
        return noticeDao.selectAdminId(admin_email);
    }
}
