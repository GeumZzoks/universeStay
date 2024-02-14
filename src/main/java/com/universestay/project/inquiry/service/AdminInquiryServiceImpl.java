package com.universestay.project.inquiry.service;

import com.universestay.project.inquiry.dao.AdminInquiryDao;
import com.universestay.project.inquiry.dto.InquiryChattingMessageDto;
import com.universestay.project.inquiry.dto.InquiryChattingRoomDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class AdminInquiryServiceImpl implements AdminInquiryService {

    @Autowired
    AdminInquiryDao adminInquiryDao;

    @Override
    public InquiryChattingRoomDto getChattingRoom(String chatting_room_id) throws Exception {
        return adminInquiryDao.selectChattingRoom(chatting_room_id);
    }

    @Override
    public List<InquiryChattingRoomDto> getChattingRoomList(String admin_id) throws Exception {
        return adminInquiryDao.selectChattingRoomList(admin_id);
    }

    @Override
    public int assignInquiry(InquiryChattingRoomDto dto) throws Exception {
        return adminInquiryDao.updateChattingRoomAdminId(dto);
    }

    @Override
    public InquiryChattingMessageDto getChattingMessage(int chatting_message_id) throws Exception {
        return adminInquiryDao.selectChattingMessage(chatting_message_id);
    }

    @Override
    public List<Map<String, Object>> getChattingMessageList(String chatting_room_id) throws Exception {
        return adminInquiryDao.selectChattingMessageList(chatting_room_id);
    }

    @Override
    public int createChattingMessage(InquiryChattingMessageDto dto) throws Exception {
        return adminInquiryDao.insertChattingMessage(dto);
    }

    @Override
    public List<Map<String, Object>> getMyChattingRoomList(String admin_id) throws Exception {
        return adminInquiryDao.selectMyChattingRoomList(admin_id);
    }
}
