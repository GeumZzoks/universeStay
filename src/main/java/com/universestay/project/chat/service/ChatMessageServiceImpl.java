package com.universestay.project.chat.service;

import com.universestay.project.chat.dao.ChatMessageDao;
import com.universestay.project.dto.ChattingMessageDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatMessageServiceImpl implements ChatMessageService {

    @Autowired
    private ChatMessageDao chatDao;

    @Override
    public int insertChat(ChattingMessageDto chatDto) {
        chatDto.setChat_ctt(chatDto.getChat_ctt());
        chatDto.setCreated_id(chatDto.getUser_id());
        chatDto.setUpdated_id(chatDto.getUser_id());

        return chatDao.insertChat(chatDto);
    }

}
