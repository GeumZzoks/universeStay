package com.universestay.project.admin.dao;

import com.universestay.project.admin.dto.EventDto;
import com.universestay.project.common.SearchCondition;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

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
    public String getAdminUuid(String admin_email) throws Exception {
        return session.selectOne(namespace + "getAdminUuid", admin_email);
    }

    @Override
    public List<Map<String, Object>> searchSelectPage(SearchCondition sc) throws Exception {
        return session.selectList(namespace + "searchSelectPage", sc);
    }

    @Override
    public List<EventDto> selectAll() throws Exception {
        return session.selectList(namespace + "selectAll");
    }

    @Override
    public List<EventDto> selectPage(Map map) throws Exception {
        return session.selectList(namespace + "selectPage", map);
    }

    @Override
    public int searchResultCnt(SearchCondition sc) throws Exception {
        System.out.println("sc in searchResultCnt() = " + sc);
        System.out.println("session = " + session);
        return session.selectOne(namespace + "searchResultCnt", sc);
    }

    @Override
    public Integer update(EventDto dto) throws Exception {
        return session.update(namespace + "update", dto);
    }

    @Override
    public Integer update_hit(Integer event_id) throws Exception {
        return session.update(namespace + "update_hit", event_id);
    }

    @Override
    public Integer delete(Integer event_id) throws Exception {
        return session.delete(namespace + "delete", event_id);
    }
}
