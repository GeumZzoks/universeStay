package com.universestay.project.chat.dao;

import com.universestay.project.dto.ChattingRoomDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatRoomDaoImpl implements ChatRoomDao {

    @Autowired
    private SqlSession sqlSession;

    private static String namespace = "com.universestay.project.chat.dao.ChatRoomDao.";


    @Override
    public int createRoom(ChattingRoomDto chattingRoomDto) {
        return sqlSession.insert(namespace + "createRoom", chattingRoomDto);
    }

    @Override
    public ChattingRoomDto selectChatRoom(ChattingRoomDto chattingRoomDto) throws Exception {
        System.out.println(chattingRoomDto.getRoom_id());
        return sqlSession.selectOne(namespace + "selectChatRoom", chattingRoomDto);
    }

    @Override
    public String selectChatRoomId(ChattingRoomDto chattingRoomDto) throws Exception {
        return sqlSession.selectOne(namespace + "selectChatRoomId", chattingRoomDto);
    }


}