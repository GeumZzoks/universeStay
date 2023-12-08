package com.universestay.project.admin.dao;

import java.util.List;
import java.util.Map;

public interface ReservationToEmailJobDao {

    List<Map<String, Object>> selectAlert() throws Exception;

}
