package com.universestay.project.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/event")
public class EventController {

    @GetMapping("/list")
    public String list() {
        return "admin/eventList";
    }

    @GetMapping
    public String read() {

        return "admin/event";
    }

    @GetMapping("/write")
    public String write() {
        return "admin/eventInput";
    }

}
