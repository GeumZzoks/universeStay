package com.universestay.project.admin.service;

import com.universestay.project.dto.EventDto;

import java.util.List;

public interface EventService {

    Integer insert(EventDto dto) throws Exception;

    EventDto select(Integer event_id) throws Exception;

    List<EventDto> selectAll() throws Exception;

    Integer update(EventDto dto) throws Exception;

    Integer delete(Integer event_id, String admin_id) throws Exception;

    List<EventDto> search() throws Exception;
}
