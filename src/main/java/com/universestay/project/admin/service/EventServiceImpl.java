package com.universestay.project.admin.service;

import com.universestay.project.admin.dao.EventDao;
import com.universestay.project.admin.dto.EventDto;
import com.universestay.project.admin.dto.EventImgDto;
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

    @Override
    public Map<String, Object> selectWithImg(Integer event_id) throws Exception {
        eventDao.update_hit(event_id);
        return eventDao.selectWithImg(event_id);
    }

    @Override
    public List<Map<String, Object>> selectMain() throws Exception {
        return eventDao.selectMain();
    }

    @Override
    public String getAdminUuid(String admin_email) throws Exception {
        return eventDao.getAdminUuid(admin_email);
    }

    @Override
    @Transactional
    public Integer write(EventDto dto, EventImgDto eventImgDto) throws Exception {
        eventDao.insert(dto);
        Integer event_id = dto.getEvent_id();
        eventImgDto.setEvent_id(event_id);
        return eventDao.insertImg(eventImgDto);
    }

    @Override
    @Transactional
    public Map<String, Object> read(Integer event_id) throws Exception {
        Map<String, Object> eventDto = eventDao.selectWithImg(event_id);
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
    public List<Map<String, Object>> getSearchResultPage(SearchCondition sc) throws Exception {
        return eventDao.searchSelectPage(sc);
    }

    @Override
    public Integer update(EventDto eventDto) throws Exception {
        return eventDao.update(eventDto);
    }

    @Override
    public Integer updateImg(EventImgDto eventImgDto) throws Exception {
        return eventDao.updateImg(eventImgDto);
    }

    @Override
    public Integer delete(Integer event_id) throws Exception {
        return eventDao.delete(event_id);
    }
}
