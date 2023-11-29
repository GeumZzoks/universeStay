package com.universestay.project.admin.service;

import com.universestay.project.dto.EventDto;

import java.util.List;

public interface EventService {

    EventDto select(Integer event_id) throws Exception;

    Integer write(EventDto dto) throws Exception;

    EventDto read(Integer event_id) throws Exception;

    List<EventDto> list() throws Exception;

    Integer update(EventDto dto) throws Exception;

    Integer delete(Integer event_id) throws Exception;

    List<EventDto> search() throws Exception;
}
