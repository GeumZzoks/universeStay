package com.universestay.project.admin.dao;

import com.universestay.project.admin.dto.NoticeDto;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDaoImpl implements NoticeDao {

    @Autowired
    private SqlSession session;

    private static String namespace = "com.universestay.project.admin.dao.NoticeDao.";

    @Override
    public int count() throws Exception {
        return session.selectOne(namespace + "count");
    }

    @Override
    public List<NoticeDto> selectAll() throws Exception {
        return session.selectList(namespace + "selectAll");
    }

    @Override
    public List<NoticeDto> selectPage(Map map) throws Exception {
        return session.selectList(namespace + "selectPage", map);
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
    public int insertSelectKey(NoticeDto noticeDto) throws Exception {
        return session.insert(namespace + "insertSelectKey", noticeDto);
    }

    @Override
    public int update(NoticeDto noticeDto) throws Exception {
        return session.update(namespace + "update", noticeDto);
    }

    @Override
    public String selectAdminId(String admin_email) throws Exception {
        return session.selectOne(namespace + "selectAdminId", admin_email);
    }


}
