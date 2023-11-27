package com.universestay.project.admin.service;

import com.universestay.project.admin.dao.EventDao;
import com.universestay.project.dto.EventDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EventServiceImpl implements EventService {

    @Autowired
    EventDao eventDao;

    @Override
    public Integer insert(EventDto dto) throws Exception {
        return null;
    }

    @Override
    public EventDto select(Integer event_id) throws Exception {
        return null;
    }

    @Override
    public List<EventDto> selectAll() throws Exception {
        return null;
    }

    @Override
    public List<EventDto> search() throws Exception {
        return null;
    }

    @Override
    public Integer update(EventDto dto) throws Exception {
        return null;
    }

    @Override
    public Integer delete(Integer event_id, String admin_id) throws Exception {
        return null;
    }
}
