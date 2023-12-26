package com.universestay.project.inquiry.service;

import com.universestay.project.inquiry.dto.InquiryChattingMessageDto;
import com.universestay.project.inquiry.dto.InquiryChattingRoomDto;

import java.util.List;
import java.util.Map;

public interface UserInquiryService {
    InquiryChattingRoomDto getChattingRoom(String chatting_room_id) throws Exception;

    List<InquiryChattingRoomDto> getChattingRoomList(String user_id) throws Exception;

    List<Map<String, Object>> getSimpleChattingRoomList(String user_id) throws Exception;

    String getUserId(String chatting_room_id) throws Exception;

    int createChattingRoom(InquiryChattingRoomDto dto) throws Exception;

    InquiryChattingMessageDto readChattingMessage(int chatting_message_id) throws Exception;

    InquiryChattingMessageDto readLastChattingMessage(String chatting_room_id) throws Exception;

    List<InquiryChattingMessageDto> getChattingMessageList(String chatting_room_id) throws Exception;

    int createChattingMessage(InquiryChattingMessageDto dto) throws Exception;
}
