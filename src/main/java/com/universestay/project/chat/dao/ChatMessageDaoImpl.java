package com.universestay.project.chat.dao;

import com.universestay.project.dto.ChattingMessageDto;
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
}
