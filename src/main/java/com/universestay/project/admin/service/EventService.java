package com.universestay.project.admin.service;

import com.universestay.project.admin.dto.EventDto;
import com.universestay.project.admin.dto.EventImgDto;
import com.universestay.project.common.SearchCondition;

import java.util.List;
import java.util.Map;

public interface EventService {

    EventDto select(Integer event_id) throws Exception;

    Map<String, Object> selectWithImg(Integer event_id) throws Exception;

    List<Map<String, Object>> selectMain() throws Exception;

    String getAdminUuid(String admin_email) throws Exception;

    List<EventDto> getList() throws Exception;

    List<EventDto> getPage(Map map) throws Exception;

    int getSearchResultCnt(SearchCondition sc) throws Exception;

    List<Map<String, Object>> getSearchResultPage(SearchCondition sc) throws Exception;

    Integer write(EventDto dto, EventImgDto eventImgDto) throws Exception;

    Map<String, Object> read(Integer event_id) throws Exception;

    List<EventDto> list() throws Exception;

    Integer update(EventDto dto, EventImgDto eventImgDto) throws Exception;

    Integer delete(Integer event_id) throws Exception;

}
