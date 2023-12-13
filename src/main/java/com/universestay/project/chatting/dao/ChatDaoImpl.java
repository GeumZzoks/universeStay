package com.universestay.project.chatting.dao;

import com.universestay.project.dto.ChattingRoomDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDaoImpl implements ChatDao {

    @Autowired
    private SqlSession sqlSession;

    private static String namespace = "com.universestay.project.chatting.dao.ChatDao.";

    @Override
    public int createRoom(ChattingRoomDto chattingRoomDto) {
        return sqlSession.insert(namespace + "createRoom", chattingRoomDto);
    }


}
