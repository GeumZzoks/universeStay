package com.universestay.project.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/reserve")
public class ReservationRoomController {


    @GetMapping
    public String reservationRoom() {
        return "user/reservation";
    }

}
