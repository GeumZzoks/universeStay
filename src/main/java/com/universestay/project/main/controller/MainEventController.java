package com.universestay.project.main.controller;

import com.universestay.project.admin.dto.CouponDto;
import com.universestay.project.admin.service.CouponService;
import com.universestay.project.admin.service.EventService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;
import java.util.Map;

@Slf4j
@Controller
public class MainEventController {

    @Autowired
    EventService eventService;

    @Autowired
    CouponService couponService;

    @GetMapping("/event")
    public String eventList(Model model) {
        try {
            List<Map<String, Object>> eventMainDto = eventService.selectMain();
            model.addAttribute("eventMainDto", eventMainDto);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "main/eventPage";
    }

    @GetMapping("/event/{event_id}")
    public String eventDetail(@PathVariable Integer event_id, Model model) {
        try {
            Map<String, Object> eventDto = eventService.selectWithImg(event_id);
            CouponDto couponDto = couponService.selectOnEvent(event_id);
            model.addAttribute("eventDto", eventDto);
            model.addAttribute("couponDto", couponDto);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "main/eventDetail";
    }
}
