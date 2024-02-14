package com.universestay.project.inquiry.service;

import com.universestay.project.inquiry.dao.UserInquiryDao;
import com.universestay.project.inquiry.dto.InquiryChattingMessageDto;
import com.universestay.project.inquiry.dto.InquiryChattingRoomDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

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
    public List<Map<String, Object>> getSimpleChattingRoomList(String user_id) throws Exception {
        return userInquiryDao.selectSimpleChattingRoomList(user_id);
    }

    @Override
    public String getUserId(String chatting_room_id) throws Exception {
        return userInquiryDao.selectUserIdCheck(chatting_room_id);
    }

    @Override
    public int createChattingRoom(InquiryChattingRoomDto dto) throws Exception {
        InquiryChattingMessageDto MessageDto = new InquiryChattingMessageDto();
        MessageDto.setChatting_room_id(dto.getChatting_room_id());
        MessageDto.setWriter_id(dto.getUser_id());
        MessageDto.setChatting_ctt("문의");
        MessageDto.setCreated_id(dto.getCreated_id());
        return (userInquiryDao.insertChattingRoom(dto) & userInquiryDao.insertChattingMessage(MessageDto));
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
    public List<Map<String, Object>> getChattingMessageList(String chatting_room_id) throws Exception {
        return userInquiryDao.selectChattingMessageList(chatting_room_id);
    }

    @Override
    public int createChattingMessage(InquiryChattingMessageDto dto) throws Exception {
        return userInquiryDao.insertChattingMessage(dto);
    }
}
