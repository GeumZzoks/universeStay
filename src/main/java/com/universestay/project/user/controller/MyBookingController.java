package com.universestay.project.user.controller;

import com.universestay.project.review.dto.RoomReviewDto;
import com.universestay.project.user.service.MyBookingService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/myPage/mybookings")
public class MyBookingController {

    @Autowired
    MyBookingService myBookingService;

    @GetMapping("/abc")
    public String abc() {
        System.out.println("111111");
        return "room/reservation";
    }

    // 서비스페이지 상단에서 내 예약 내역 눌렀을 때
    @GetMapping
    public String myBooking(HttpSession session, Model model) throws Exception {
        // TODO: 2023-12-09 나중에 지우기 세션 코드 넣기
//        session.setAttribute("user_email", "ming7606@naver.com");
        // TODO: 2023-12-09 여기까지----------------

        System.out.println("URL ---- /user/mybookings/");
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
            List<Map<String, Object>> list1 = myBookingService.getMyBookingList(map1);
            List<Map<String, Object>> list2 = myBookingService.getMyBookingList(map2);

            // TODO: 2023-12-09 test용 나중에 지울 것.
            for (Map<String, Object> dto : list1) {
                System.out.println("dto = " + dto);
            }
            System.out.println("---------------------------------------------------");
            for (Map<String, Object> dto : list2) {
                System.out.println("dto = " + dto);
            }

            // 뷰파일에 넘겨줄 model setting
            model.addAttribute("list1", list1);
            model.addAttribute("list2", list2);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "user/myBookings";
    }

    @PostMapping("/writereview")
    public String writeReview(String room_id, String review_stars, String review_ctt,
            HttpSession session) {
        String str = review_stars;
        Double double1 = null;
        if (!str.equals("null")) {
            double1 = Double.parseDouble(str);
        }
        System.out.println("double1 = " + double1);

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
        System.out.println("agasgsagsagsag");
        try {
            System.out.println("111111111111111");
            int result = myBookingService.writeRoomReview(dto2);
            System.out.println("222222222222");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect: /user/myPage/mybookings/";
    }
}
