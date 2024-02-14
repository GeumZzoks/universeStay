package com.universestay.project.inquiry.dao;

import com.universestay.project.inquiry.dto.InquiryChattingMessageDto;
import com.universestay.project.inquiry.dto.InquiryChattingRoomDto;

import java.util.List;
import java.util.Map;

public interface AdminInquiryDao {
    InquiryChattingRoomDto selectChattingRoom(String chatting_room_id) throws Exception;

    List<InquiryChattingRoomDto> selectChattingRoomList(String admin_id) throws Exception;

    int updateChattingRoomAdminId(InquiryChattingRoomDto dto) throws Exception;

    int updateChattingRoomUpdatedAt(String chatting_room_id) throws Exception;

    int deleteChattingRoom(String chatting_room_id) throws Exception;

    InquiryChattingMessageDto selectChattingMessage(int chatting_message_id) throws Exception;

    List<Map<String, Object>> selectChattingMessageList(String chatting_room_id) throws Exception;

    int insertChattingMessage(InquiryChattingMessageDto dto) throws Exception;

    List<Map<String, Object>> selectMyChattingRoomList(String admin_id) throws Exception;
}
