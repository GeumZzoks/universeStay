package com.universestay.project.user.controller;

import com.universestay.project.review.dto.RoomReviewDto;
import com.universestay.project.user.service.MyBookingService;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/myPage/mybookings")
public class MyBookingController {

    @Autowired
    MyBookingService myBookingService;

    // 서비스페이지 상단에서 내 예약 내역 눌렀을 때
    @GetMapping
    public String myBooking(HttpSession session, Model model) throws Exception {

        String user_email = (String) session.getAttribute("user_email");
        try {
            // mapper에 전달해줄 parameter
            // map1은 이용이 끝나지 않은 ( 예약신청, 예약완료, 예약취소, 예약반려 ) 예약을 조회하기 위한 용도
            // map2는 이용완료 상태의 예약을 조회하기 위한 용도
            Map map1 = new HashMap();
            map1.put("status_id", "미이용완료");
            map1.put("user_email", user_email);
            Map map2 = new HashMap();
            map2.put("status_id", "이용완료");
            map2.put("user_email", user_email);

            // list1은 이용이 끝나지 않은 ( 예약신청, 예약완료, 예약취소, 예약반려 ) 예약건들에 대한 List이다
            // mapper의 select ressulttype을 map으로 주었으므로
            // 결과가 (컬럼이름, 컬럼값) 형태의 맵을 이루고
            // 또한, 예약 2건 이상일 수 있으므로 List 형태로 받는다.
            // list2는 이용완료 된 예약건들에 대한 List이며
            // 나머지는 상동하다.

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

            List<Map<String, Object>> list1 = myBookingService.getMyBookingList(map1);
            System.out.println(
                    "--------------------------------------------------------------------------------------------------------------------------------");
            for (int i = 0; i < list1.size(); i++) {
                String booking_checkin_date = sdf.format(list1.get(i)
                        .get("booking_checkin_date"));
                String booking_checkout_date = sdf.format(list1.get(i)
                        .get("booking_checkout_date"));
                String created_at = sdf.format(list1.get(i).get("created_at"));
                list1.get(i).put("booking_checkin_date", booking_checkin_date);
                list1.get(i).put("booking_checkout_date", booking_checkout_date);
                list1.get(i).put("created_at", created_at);
            }
            List<Map<String, Object>> list2 = myBookingService.getMyBookingList(map2);

            for (int i = 0; i < list2.size(); i++) {
                String booking_checkin_date = sdf.format(list2.get(i)
                        .get("booking_checkin_date"));
                String booking_checkout_date = sdf.format(list2.get(i)
                        .get("booking_checkout_date"));
                String created_at = sdf.format(list2.get(i).get("created_at"));
                list2.get(i).put("booking_checkin_date", booking_checkin_date);
                list2.get(i).put("booking_checkout_date", booking_checkout_date);
                list2.get(i).put("created_at", created_at);
            }
//            booking_checkin_date
//            booking_checkout_date
            // created_at
            // 뷰파일에 넘겨줄 model setting

            System.out.println(list2);

            model.addAttribute("list1", list1);
            model.addAttribute("list2", list2);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "user/myBookings";
    }

    @PostMapping("/writereview")
    @Transactional(rollbackFor = Exception.class)
    public String writeReview(String booking_id, String room_id, String review_stars,
            String review_ctt,
            HttpSession session) {
        String str = review_stars;
        System.out.println("booking_id = " + booking_id);
        Double double1 = null;
        if (!str.equals("null")) {
            double1 = Double.parseDouble(str);
        }

        String uuid_review_id = UUID.randomUUID().toString();
        RoomReviewDto dto2 = new RoomReviewDto();
        dto2.setReview_id(uuid_review_id);
        dto2.setUser_id((String) session.getAttribute("user_id"));
        dto2.setRoom_id(room_id);
        dto2.setReview_writer((String) session.getAttribute("user_id"));
        if (double1 != null) {
            if (double1 >= 0.0 && double1 <= 5.0) {
                dto2.setReview_stars(double1);
            }
        }

        dto2.setReview_ctt(review_ctt);
        dto2.setCreated_id((String) session.getAttribute("user_id"));

        try {
            myBookingService.writeRoomReview(dto2);
            myBookingService.updateReviewStatus(booking_id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect: /user/myPage/mybookings/";
    }
}
