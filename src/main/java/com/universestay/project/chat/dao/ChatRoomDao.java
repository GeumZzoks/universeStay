package com.universestay.project.chat.dao;

import com.universestay.project.dto.ChattingRoomDto;
import java.util.List;
import java.util.Map;

public interface ChatRoomDao {

    int createRoom(ChattingRoomDto chattingRoomDto) throws Exception;

    ChattingRoomDto selectChatRoom(ChattingRoomDto chattingRoomDto) throws Exception;

    String selectChatRoomId(ChattingRoomDto chattingRoomDto) throws Exception;

    List<Map<String, Object>> selectChatRoomList(String userId) throws Exception;
}