package com.universestay.project.admin.service;

import com.universestay.project.admin.dao.EventDao;
import com.universestay.project.admin.dto.EventDto;
import com.universestay.project.common.SearchCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;


@Service
public class EventServiceImpl implements EventService {

    @Autowired
    EventDao eventDao;

    @Override
    public EventDto select(Integer event_id) throws Exception {
        return eventDao.select(event_id);
    }

    public String getAdminNickname(String admin_id) throws Exception {
        return eventDao.getAdminNickname(admin_id);
    }

    @Override
    public Integer write(EventDto dto) throws Exception {
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
    public List<EventDto> getList() throws Exception {
        return eventDao.selectAll();
    }

    @Override
    public List<EventDto> getPage(Map map) throws Exception {
        return eventDao.selectPage(map);
    }

    @Override
    public int getSearchResultCnt(SearchCondition sc) throws Exception {
        return eventDao.searchResultCnt(sc);
    }

    @Override
    public List<EventDto> getSearchResultPage(SearchCondition sc) throws Exception {
        return eventDao.searchSelectPage(sc);
    }

    @Override
    public Integer update(EventDto eventDto) throws Exception {
        return eventDao.update(eventDto);
    }

    @Override
    public Integer delete(Integer event_id) throws Exception {
        return eventDao.delete(event_id);
    }
}
