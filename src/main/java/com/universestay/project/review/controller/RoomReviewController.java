package com.universestay.project.review.controller;

import com.universestay.project.review.dto.RoomReviewDto;
import com.universestay.project.review.service.RoomReviewService;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
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

//    @GetMapping("/user/review/write")
//    public String getWrite() {
//        return "review/reviewWrite";
//    }

//    @PostMapping("/user/review/write")
//    public String write(RedirectAttributes rttr, HttpSession session, RoomReviewDto roomReviewDto,
//            String room_id, Model m) {
//        String writer = (String) session.getAttribute("user_email");
//        roomReviewDto.setUser_id(writer);
//        roomReviewDto.setRoom_id(room_id);
//        roomReviewDto.setReview_writer(writer);
//        roomReviewDto.setCreated_id(writer);
//        roomReviewDto.setUpdated_id(writer);
//        try {
//            return "redirect:/user/reviews";
//        } catch (Exception e) {
//            e.printStackTrace();
//            m.addAttribute(roomReviewDto);
//            return "";
//        }
//    }

    @GetMapping("/user/reviews")
    public String reviews(Model m, HttpSession session) {
//        String writer = (String) session.getAttribute("user_email");
//        String writer = "a65b5ec4-39bb-4df9-a28a-6d6c7df28756";
        try {
            List<Map<String, Object>> list = roomReviewService.getUserReviewList(
                    "065b5ec4-39bb-4df9-a28a-6d6c7df28796");
            m.addAttribute("list", list);

        } catch (Exception e) {

        }
        return "review/userReviews";
    }


}
