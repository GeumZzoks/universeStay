package com.universestay.project.admin.dao;

import com.universestay.project.common.exception.CommonException;
import java.util.List;
import java.util.Map;

public interface DashBoardDao {


    String countTotalUser() throws CommonException;

    String countTotalHost() throws CommonException;

    String countTotalInquiries() throws CommonException;

    List<Map<String, Object>> selectListRoom() throws CommonException;

    List<Map<String, Object>> selectListInquiry() throws CommonException;

    Integer updateConfirmIndividualRoom(String roomId) throws CommonException;

    Integer updateRejectIndividualRoom(String roomId) throws CommonException;


}
