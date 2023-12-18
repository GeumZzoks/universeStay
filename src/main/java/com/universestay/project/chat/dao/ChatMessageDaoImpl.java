package com.universestay.project.chat.dao;

import com.universestay.project.dto.ChattingMessageDto;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatMessageDaoImpl implements ChatMessageDao {

    private static String namespace = "com.universestay.project.chat.dao.ChatMessageDao.";

    @Autowired
    private SqlSession sqlSession;

    @Override
    public int insertChat(ChattingMessageDto chattingMessageDto) {
        return sqlSession.insert(namespace + "insertChat", chattingMessageDto);
    }

    @Override
    public List<Map<String, Object>> selectChatList(String chat_room_id) {
        return sqlSession.selectList(namespace + "selectChatList", chat_room_id);
    }

    @Override
    public List<ChattingMessageDto> selectFirstChatList(String chat_room_id) {
        return null;
    }

}
