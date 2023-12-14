package com.universestay.project.chat.service;

import com.universestay.project.chat.dao.ChatRoomDao;
import com.universestay.project.dto.ChattingRoomDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatRoomServiceImpl implements ChatRoomService {

    @Autowired
    private ChatRoomDao chatRoomDao;


    @Override
    public int createRoom(ChattingRoomDto chattingRoomDto) {
        try {
            return chatRoomDao.createRoom(chattingRoomDto);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Override
    public ChattingRoomDto selectChatRoom(ChattingRoomDto chattingRoomDto) throws Exception {
        return chatRoomDao.selectChatRoom(chattingRoomDto);
    }
}