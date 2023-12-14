package com.universestay.project.chat.dao;

import com.universestay.project.dto.ChattingRoomDto;

public interface ChatRoomDao {

    int createRoom(ChattingRoomDto chattingRoomDto) throws Exception;

    ChattingRoomDto selectChatRoom(ChattingRoomDto chattingRoomDto) throws Exception;
}