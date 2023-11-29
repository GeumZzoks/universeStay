package com.universestay.project.admin.dao;

import com.universestay.project.dto.EventDto;

import java.util.List;

public interface EventDao {

    Integer insert(EventDto dto) throws Exception;

    EventDto select(Integer event_id) throws Exception;

    List<EventDto> selectAll() throws Exception;

    Integer update(EventDto dto) throws Exception;

    Integer update_hit(Integer event_id) throws Exception;

    Integer delete(Integer event_id) throws Exception;

    List<EventDto> search(String search) throws Exception;

}
