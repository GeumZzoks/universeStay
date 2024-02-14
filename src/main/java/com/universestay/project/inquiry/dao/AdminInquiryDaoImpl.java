package com.universestay.project.inquiry.dao;

import com.universestay.project.inquiry.dto.InquiryChattingMessageDto;
import com.universestay.project.inquiry.dto.InquiryChattingRoomDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class AdminInquiryDaoImpl implements AdminInquiryDao {

    @Autowired
    private SqlSession session;
    private static String namespace = "com.universestay.project.resources.mybatis.mapper.inquiry.AdminInquiryMapper.";

    @Override
    public InquiryChattingRoomDto selectChattingRoom(String chatting_room_id) throws Exception {
        return session.selectOne(namespace + "selectChattingRoom", chatting_room_id);
    }

    @Override
    public List<InquiryChattingRoomDto> selectChattingRoomList(String admin_id) throws Exception {
        return session.selectList(namespace + "selectChattingRoomList", admin_id);
    }

    @Override
    public int updateChattingRoomAdminId(InquiryChattingRoomDto dto) throws Exception {
        return session.update(namespace + "updateChattingRoomAdminId", dto);
    }

    @Override
    public int updateChattingRoomUpdatedAt(String chatting_room_id) throws Exception {
        return session.update(namespace + "updateChattingRoomUpdatedAt", chatting_room_id);
    }

    @Override
    public int deleteChattingRoom(String chatting_room_id) throws Exception {
        return session.delete(namespace + "chatting_room_id");
    }

    @Override
    public InquiryChattingMessageDto selectChattingMessage(int chatting_message_id) throws Exception {
        return session.selectOne(namespace + "selectChattingMessage", chatting_message_id);
    }

    @Override
    public List<Map<String, Object>> selectChattingMessageList(String chatting_room_id) throws Exception {
        return session.selectList(namespace + "selectChattingMessageList", chatting_room_id);
    }

    @Override
    public int insertChattingMessage(InquiryChattingMessageDto dto) throws Exception {
        return session.insert(namespace + "insertChattingMessage", dto);
    }

    @Override
    public List<Map<String, Object>> selectMyChattingRoomList(String admin_id) throws Exception {
        return session.selectList(namespace + "selectMyChattingRoomList", admin_id);
    }
}
