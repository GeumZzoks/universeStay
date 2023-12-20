package com.universestay.project.user.controller;

import com.universestay.project.admin.service.CouponService;
import com.universestay.project.user.dto.UserCouponDto;
import com.universestay.project.user.service.UserCouponService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("/user/myPage/coupon")
public class UserCouponController {

    @Autowired
    UserCouponService userCouponService;

    @Autowired
    CouponService couponService;

    @GetMapping
    public String myCoupon(HttpSession session, Model model) {
        String user_email = (String) session.getAttribute("user_email");
        try {
            String user_id = userCouponService.getUserUuid(user_email);
            Integer total_cnt = userCouponService.totalCount(user_id);
            List<Map<String, Object>> userCouponDtos = userCouponService.selectAll(user_id);

            model.addAttribute("total_cnt", total_cnt);
            model.addAttribute("list", userCouponDtos);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "user/myPage/coupon";
    }

    @PostMapping("/issue")
    public ResponseEntity<String> issue(Integer event_id, UserCouponDto userCouponDto, HttpSession session) {
        String user_email = (String) session.getAttribute("user_email");
        try {
            String user_id = userCouponService.getUserUuid(user_email);
            Integer coupon_id = couponService.selectByEvent(event_id);

            if (userCouponService.isIssued(user_id, coupon_id) == 0) {
                userCouponDto.setCoupon_id(coupon_id);
                userCouponDto.setUser_id(user_id);
                userCouponDto.setCreated_id(user_id);
                userCouponDto.setUpdated_id(user_id);
                userCouponService.insert(userCouponDto);
                return ResponseEntity.ok("ISSUE_OK");
            } else {
                return ResponseEntity.ok("ISSUED");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("ISSUE_ERR");
        }
    }

}
