package com.universestay.project.chat.service;

import com.universestay.project.dto.ChattingRoomDto;

public interface ChatRoomService {

    int createRoom(ChattingRoomDto chattingRoomDto);

    ChattingRoomDto selectChatRoom(ChattingRoomDto chattingRoomDto) throws Exception;
}