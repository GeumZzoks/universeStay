package com.universestay.project.user.controller;

import com.universestay.project.user.service.HostBookingManagementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user/myPage")
public class HostBookingManagementController {

    @Autowired
    HostBookingManagementService hostBookingManagementService;

    @GetMapping("/hostbookingmanagement")
    public String bookingManagement(HttpSession session) {
        return "user/myPage/hostBookingManagement";
    }

    @ResponseBody
    @PostMapping("/hostbookingmanagement")
    public List<Map<String,Object>> bookingPage(@RequestParam(required = false, defaultValue = "1") int page, HttpSession session) {
        List<Map<String, Object>> list = null;
        try {
            list = hostBookingManagementService.getBookingRequestList((String) session.getAttribute("user_id"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @ResponseBody
    @PostMapping("/hostbookingmanagement/aprv")
    public List<Map<String, Object>> approveBooking(String booking_id, String is_approve, HttpSession session) {
        System.out.println("*** POST *** /hostbookingmanagement/aprv");
        List<Map<String, Object>> list = null;
        try {
            if (is_approve.equals("Y")) {
                hostBookingManagementService.approveBookingRequest(booking_id);
            } else {
                hostBookingManagementService.rejectBookingRequest(booking_id);
            }
            list = hostBookingManagementService.getBookingRequestList((String) session.getAttribute("user_id"));
            for (Map<String, Object> dto : list){
                System.out.println("dto = " + dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
