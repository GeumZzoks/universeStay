package com.universestay.project.user.dao;

import com.universestay.project.user.dto.BookingDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.Map;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class HostBookingManagementDaoImplTest {

    @Autowired
    HostBookingManagementDao hostBookingManagementDao;

    @Test
    public void selectBookingRequestList() throws Exception {
        List<Map<String, Object>> list = hostBookingManagementDao.selectBookingRequestList("165b5ec4-39bb-4df9-a28a-6d6c7df28756");
        for(Map<String, Object> dto : list){
            System.out.println("dto = " + dto);
        }
        assertTrue(list != null);
    }

    @Test
    public void approveBookingRequest() throws Exception {
        int result = hostBookingManagementDao.aprvBookingRequest("e27c83b0-acd6-441c-b5e0-ab488144b232");
        System.out.println("approve result = " + result);
        assertTrue(result == 1);
    }

    @Test
    public void rejectBookingRequest() throws Exception {
        int result = hostBookingManagementDao.rjtBookingRequest("e27c83b0-acd6-441c-b5e0-ab488144b232");
        System.out.println("reject result = " + result);
        assertTrue(result >= 1);
    }
}