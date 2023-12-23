package com.universestay.project.inquiry.dao;

import com.universestay.project.inquiry.dto.InquiryChattingMessageDto;
import com.universestay.project.inquiry.dto.InquiryChattingRoomDto;

import java.util.List;

public interface UserInquiryDao {
    InquiryChattingRoomDto selectChattingRoom(String chatting_room_id) throws Exception;

    List<InquiryChattingRoomDto> selectChattingRoomList(String user_id) throws Exception;

    int insertChattingRoom(InquiryChattingRoomDto dto) throws Exception;

    int updateChattingRoomAdminId(InquiryChattingRoomDto dto) throws Exception;

    int updateChattingRoomStatus(InquiryChattingRoomDto dto) throws Exception;

    int updateChattingRoomUpdatedAt(String chatting_room_id) throws Exception;

    int deleteChattingRoom(String chatting_room_id) throws Exception;

    InquiryChattingMessageDto selectChattingMessage(int chatting_message_id) throws Exception;

    InquiryChattingMessageDto selectChattingMessageLastOne(String chatting_room_id) throws Exception;

    List<InquiryChattingMessageDto> selectChattingMessageList(String chatting_room_id) throws Exception;

    int insertChattingMessage(InquiryChattingMessageDto dto) throws Exception;
}
