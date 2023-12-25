package com.universestay.project.review.controller;

import com.universestay.project.review.service.RoomReviewService;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class RoomReviewController {

    @Autowired
    RoomReviewService roomReviewService;

    @GetMapping("/room/{room_id}/reviews")
    @ResponseBody
    public ResponseEntity<List<Map<String, Object>>> reviews(@PathVariable String room_id,
            Model m) {
        List<Map<String, Object>> list = null;
        try {
            list = roomReviewService.getRoomReviewList(room_id);
            return new ResponseEntity<List<Map<String, Object>>>(list, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<Map<String, Object>>>(HttpStatus.BAD_REQUEST);
        }
    }

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
