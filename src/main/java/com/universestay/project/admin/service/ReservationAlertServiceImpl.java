package com.universestay.project.admin.service;

import com.universestay.project.admin.dao.ReservationToEmailJobDao;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ReservationAlertServiceImpl implements ReservationAlertService {

    @Autowired
    ReservationToEmailJobDao reservationToEmailJobDao;

    @Override
    @Transactional
    public List<Map<String, Object>> selectReservationAlert() throws Exception {
        return reservationToEmailJobDao.selectAlert();
    }
}
