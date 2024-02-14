package com.universestay.project.admin.service;

import com.universestay.project.admin.dao.DashBoardDao;
import com.universestay.project.common.exception.CommonException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class DashBoardServiceImpl implements DashBoardService {

    private final DashBoardDao dashBoardDao;

    @Autowired
    public DashBoardServiceImpl(DashBoardDao dashBoardDao) {
        this.dashBoardDao = dashBoardDao;
    }

    @Override
    public String countTotalUser() throws CommonException {
        return dashBoardDao.countTotalUser();
    }

    @Override
    public String countTotalHost() throws CommonException {
        return dashBoardDao.countTotalHost();
    }

    @Override
    public String countTotalInquiries() throws CommonException {
        return dashBoardDao.countTotalInquiries();
    }

    @Override
    public List<Map<String, Object>> selectListRoom() throws CommonException {
        return dashBoardDao.selectListRoom();
    }

    @Override
    public List<Map<String, Object>> selectListInquiry() throws CommonException {
        return dashBoardDao.selectListInquiry();
    }

    @Override
    public Integer updateInquiryStatus(Map<String, Object> map) throws CommonException {
        return dashBoardDao.updateInquiryStatus(map);
    }

    @Override
    public Integer updateConfirmIndividualRoom(String roomId) throws CommonException {
        return dashBoardDao.updateConfirmIndividualRoom(roomId);
    }

    @Override
    public Integer updateRejectIndividualRoom(String roomId) throws CommonException {
        return dashBoardDao.updateRejectIndividualRoom(roomId);
    }
}
