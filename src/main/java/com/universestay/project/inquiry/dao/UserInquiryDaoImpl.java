package com.universestay.project.inquiry.dao;

import com.universestay.project.inquiry.dto.InquiryChattingMessageDto;
import com.universestay.project.inquiry.dto.InquiryChattingRoomDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class UserInquiryDaoImpl implements UserInquiryDao {

    @Autowired
    private SqlSession session;
    private static String namespace = "com.universestay.project.resources.mybatis.mapper.inquiry.UserInquiryMapper.";

    @Override
    public InquiryChattingRoomDto selectChattingRoom(String chatting_room_id) throws Exception {
        return session.selectOne(namespace + "selectChattingRoom", chatting_room_id);
    }

    @Override
    public List<Map<String, Object>> selectSimpleChattingRoomList(String user_id) throws Exception {
        return session.selectList(namespace + "selectSimpleChattingRoomList", user_id);
    }

    @Override
    public String selectUserIdCheck(String chatting_room_id) throws Exception {
        return session.selectOne(namespace + "selectUserIdCheck", chatting_room_id);
    }

    @Override
    public List<InquiryChattingRoomDto> selectChattingRoomList(String user_id) throws Exception {
        return session.selectList(namespace + "selectChattingRoomList", user_id);
    }

    @Override
    public int insertChattingRoom(InquiryChattingRoomDto dto) throws Exception {
        return session.insert(namespace + "insertChattingRoom", dto);
    }

    @Override
    public int updateChattingRoomAdminId(InquiryChattingRoomDto dto) throws Exception {
        return session.update(namespace + "updateChattingRoomAdminId", dto);
    }

    @Override
    public int updateChattingRoomStatus(InquiryChattingRoomDto dto) throws Exception {
        return session.update(namespace + "updateChattingRoomStatus", dto);
    }

    @Override
    public int updateChattingRoomUpdatedAt(String chatting_room_id) throws Exception {
        return session.update(namespace + "updateChattingRoomUpdatedAt", chatting_room_id);
    }

    @Override
    public int deleteChattingRoom(String chatting_room_id) throws Exception {
        return session.delete(namespace + "deleteChattingRoom", chatting_room_id);
    }

    @Override
    public InquiryChattingMessageDto selectChattingMessage(int chatting_message_id) throws Exception {
        return session.selectOne(namespace + "selectChattingMessage", chatting_message_id);
    }

    @Override
    public InquiryChattingMessageDto selectChattingMessageLastOne(String chatting_room_id) throws Exception {
        return session.selectOne(namespace + "selectChattingMessageLastOne", chatting_room_id);
    }

    @Override
    public List<InquiryChattingMessageDto> selectChattingMessageList(String chatting_room_id) throws Exception {
        return session.selectList(namespace + "selectChattingMessageList", chatting_room_id);
    }

    @Override
    public int insertChattingMessage(InquiryChattingMessageDto dto) throws Exception {
        return session.insert(namespace + "insertChattingMessage", dto);
    }
}
