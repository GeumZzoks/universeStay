package com.universestay.project.admin.service;

import com.universestay.project.admin.dao.EventDao;
import com.universestay.project.dto.EventDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class EventServiceImpl implements EventService {

    @Autowired
    EventDao eventDao;

    @Autowired
    HttpSession session;


    @Override
    public EventDto select(Integer event_id) throws Exception {
        return eventDao.select(event_id);
    }

    @Override
    public Integer write(EventDto dto) throws Exception {
        String writer = (String) session.getAttribute("id");
        dto.setAdmin_id(writer);
        dto.setCreated_id(writer);
        dto.setUpdated_id(writer);
        return eventDao.insert(dto);
    }

    @Override
    @Transactional
    public EventDto read(Integer event_id) throws Exception {
        EventDto eventDto = eventDao.select(event_id);
        eventDao.update_hit(event_id);

        return eventDto;
    }

    @Override
    public List<EventDto> list() throws Exception {
        List<EventDto> eventDto = eventDao.selectAll();
        return eventDto;
    }

    @Override
    public List<EventDto> search() throws Exception {
        return null;
    }

    @Override
    public Integer update(EventDto eventDto) throws Exception {
        String admin_id = (String) session.getAttribute("id");
        eventDto.setUpdated_id(admin_id);
        return eventDao.update(eventDto);
    }

    @Override
    public Integer delete(Integer event_id) throws Exception {
        return eventDao.delete(event_id);
    }
}
