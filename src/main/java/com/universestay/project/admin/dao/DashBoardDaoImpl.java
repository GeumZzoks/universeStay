package com.universestay.project.admin.dao;

import com.universestay.project.common.exception.CommonException;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DashBoardDaoImpl implements DashBoardDao {

    private final SqlSession session;
    private final String namespace = "com.universestay.project.resources.mybatis.mapper.admin.dashBoardMapper.";

    @Autowired
    public DashBoardDaoImpl(SqlSession session) {
        this.session = session;
    }


    @Override
    public String countTotalUser() throws CommonException {
        return session.selectOne(namespace + "countTotalUser");
    }

    @Override
    public String countTotalHost() throws CommonException {
        return session.selectOne(namespace + "countTotalHost");
    }

    @Override
    public String countTotalInquiries() throws CommonException {
        return session.selectOne(namespace + "countTotalInquiries");
    }

    @Override
    public List<Map<String, Object>> selectListRoom() throws CommonException {
        return session.selectList(namespace + "selectListRoom");
    }

    @Override
    public List<Map<String, Object>> selectListInquiry() throws CommonException {
        return session.selectList(namespace + "selectListInquiry");
    }

    @Override
    public Integer updateConfirmIndividualRoom(String roomId) throws CommonException {
        return session.update(namespace + "updateConfirmIndividualRoom", roomId);
    }

    @Override
    public Integer updateRejectIndividualRoom(String roomId) throws CommonException {
        return session.update(namespace + "updateRejectIndividualRoom", roomId);
    }

}
