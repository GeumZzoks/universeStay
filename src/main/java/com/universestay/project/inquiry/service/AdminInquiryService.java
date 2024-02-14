package com.universestay.project.inquiry.service;

import com.universestay.project.inquiry.dto.InquiryChattingMessageDto;
import com.universestay.project.inquiry.dto.InquiryChattingRoomDto;

import java.util.List;
import java.util.Map;

public interface AdminInquiryService {

    InquiryChattingRoomDto getChattingRoom(String chatting_room_id) throws Exception;

    List<InquiryChattingRoomDto> getChattingRoomList(String admin_id) throws Exception;

    int assignInquiry(InquiryChattingRoomDto dto) throws Exception;

    InquiryChattingMessageDto getChattingMessage(int chatting_message_id) throws Exception;

    List<Map<String, Object>> getChattingMessageList(String chatting_room_id) throws Exception;

    int createChattingMessage(InquiryChattingMessageDto dto) throws Exception;

    List<Map<String, Object>> getMyChattingRoomList(String admin_id) throws Exception;
}
