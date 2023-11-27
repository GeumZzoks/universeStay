package com.universestay.project.admin.dao;

import com.universestay.project.dto.EventDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class EventDaoImpl implements EventDao {

    @Autowired
    SqlSession session;

    public static String namespace = "com.universestay.project.mybatis.mapper.admin.EventMapper.";

    @Override
    public Integer insert(EventDto dto) throws Exception {
        return session.insert(namespace + "insert", dto);
    }

    @Override
    public EventDto select(Integer event_id) throws Exception {
        return session.selectOne(namespace + "select", event_id);
    }

    @Override
    public List<EventDto> selectAll() throws Exception {
        return session.selectList(namespace + "selectAll");
    }

    @Override
    public List<EventDto> search(String search) throws Exception {
        return session.selectList(namespace + "search", search);
    }

    @Override
    public Integer update(EventDto dto) throws Exception {
        return session.update(namespace + "update", dto);
    }

    @Override
    public Integer delete(Integer event_id) throws Exception {
        return session.delete(namespace + "delete", event_id);
    }
}
