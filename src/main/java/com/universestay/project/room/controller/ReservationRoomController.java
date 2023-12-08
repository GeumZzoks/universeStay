package com.universestay.project.room.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/room/reserve")
public class ReservationRoomController {


    @GetMapping
    public String reservationRoom() {
        return "room/reservation";
    }

    @GetMapping("/reservationShare")
    public String reservationShare() {
        return "room/reservationShare";
    }

}
