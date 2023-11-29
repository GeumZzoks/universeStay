package com.universestay.project.notice.dao;

import com.universestay.project.notice.dto.NoticeDto;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDaoImpl implements NoticeDao {

    @Autowired
    private SqlSession session;

    private static String namespace = "com.universestay.project.notice.dao.NoticeDao.";

    @Override
    public List<NoticeDto> selectAll() throws Exception {
        return session.selectList(namespace + "selectAll");
    }

    @Override
    public NoticeDto select(Integer notice_id) throws Exception {
        return session.selectOne(namespace + "select", notice_id);
    }

    @Override
    public int delete(Integer notice_id) throws Exception {
        return session.delete(namespace + "delete", notice_id);
    }

    @Override
    public int insert(NoticeDto noticeDto) throws Exception {
        return session.insert(namespace + "insert", noticeDto);
    }

    @Override
    public int update(NoticeDto noticeDto) throws Exception {
        return session.update(namespace + "update", noticeDto);
    }


}
