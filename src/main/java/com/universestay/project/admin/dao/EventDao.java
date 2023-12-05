package com.universestay.project.admin.dao;

import com.universestay.project.admin.dto.EventDto;
import com.universestay.project.common.SearchCondition;

import java.util.List;
import java.util.Map;

public interface EventDao {

    Integer insert(EventDto dto) throws Exception;

    EventDto select(Integer event_id) throws Exception;

    String getAdminUuid(String admin_email) throws Exception;

    List<Map<String, Object>> searchSelectPage(SearchCondition sc) throws Exception;

    List<EventDto> selectAll() throws Exception;

    List<EventDto> selectPage(Map map) throws Exception;

    int searchResultCnt(SearchCondition sc) throws Exception;

//    List<EventDto> searchSelectPage(SearchCondition sc) throws Exception;

    Integer update(EventDto dto) throws Exception;

    Integer update_hit(Integer event_id) throws Exception;

    Integer delete(Integer event_id) throws Exception;


}
