package com.universestay.project.chatting.dao;

import com.universestay.project.dto.ChattingRoomDto;

public interface ChatDao {

    int createRoom(ChattingRoomDto chattingRoomDto) throws Exception;

}
