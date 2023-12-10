package com.universestay.project.review.controller;

import com.universestay.project.review.dto.RoomReviewDto;
import com.universestay.project.review.service.RoomReviewService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class RoomReviewController {

    @Autowired
    RoomReviewService roomReviewService;

    @GetMapping("/room/{room_id}/reviews")
    public String reviews(@PathVariable String room_id, Model m, RedirectAttributes rttr) {
        try {
            List<RoomReviewDto> list = roomReviewService.getRoomReviewList(room_id);
            m.addAttribute("list", list);
            return "redirect:/room/" + room_id;
        } catch (Exception e) {
            e.printStackTrace();
            rttr.addFlashAttribute("msg", "REV_ERR");
            return "redirect:/room/" + room_id;
        }
    }
}
