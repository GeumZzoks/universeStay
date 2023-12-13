package com.universestay.project.chatting.service;

import com.universestay.project.chatting.dao.ChatDao;
import com.universestay.project.dto.ChattingRoomDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatServiceImpl implements ChatService {

    @Autowired
    private ChatDao chatDao;

    @Override
    public int createRoom(ChattingRoomDto chattingRoomDto) {
        try {
            return chatDao.createRoom(chattingRoomDto);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}
