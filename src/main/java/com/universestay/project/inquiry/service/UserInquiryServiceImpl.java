package com.universestay.project.inquiry.service;

import com.universestay.project.inquiry.dao.UserInquiryDao;
import com.universestay.project.inquiry.dto.InquiryChattingMessageDto;
import com.universestay.project.inquiry.dto.InquiryChattingRoomDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserInquiryServiceImpl implements UserInquiryService {

    @Autowired
    UserInquiryDao userInquiryDao;

    @Override
    public InquiryChattingRoomDto getChattingRoom(String chatting_room_id) throws Exception {
        return userInquiryDao.selectChattingRoom(chatting_room_id);
    }

    @Override
    public List<InquiryChattingRoomDto> getChattingRoomList(String user_id) throws Exception {
        return userInquiryDao.selectChattingRoomList(user_id);
    }

    @Override
    public int createChattingRoom(InquiryChattingRoomDto dto) throws Exception {
        return userInquiryDao.insertChattingRoom(dto);
    }

    @Override
    public InquiryChattingMessageDto readChattingMessage(int chatting_message_id) throws Exception {
        return userInquiryDao.selectChattingMessage(chatting_message_id);
    }

    @Override
    public InquiryChattingMessageDto readLastChattingMessage(String chatting_room_id) throws Exception {
        return userInquiryDao.selectChattingMessageLastOne(chatting_room_id);
    }

    @Override
    public List<InquiryChattingMessageDto> getChattingMessageList(String chatting_room_id) throws Exception {
        return userInquiryDao.selectChattingMessageList(chatting_room_id);
    }

    @Override
    public int createChattingMessage(InquiryChattingMessageDto dto) throws Exception {
        return userInquiryDao.insertChattingMessage(dto);
    }
}
