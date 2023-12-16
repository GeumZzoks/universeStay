package com.universestay.project.main.controller;

import com.universestay.project.admin.dto.EventDto;
import com.universestay.project.admin.service.EventService;
import com.universestay.project.common.MainSearchCondition;
import com.universestay.project.common.PageHandler;
import com.universestay.project.common.SearchCondition;
import com.universestay.project.room.service.RoomService;
import com.universestay.project.user.dto.UserDto;
import com.universestay.project.user.service.ProfileImgService;
import com.universestay.project.user.service.UserInfoService;
import com.universestay.project.user.service.WishListService;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@Controller
public class MainController {

    @Autowired
    UserInfoService userInfoService;
    @Autowired
    ProfileImgService profileImgService;
    @Autowired
    RoomService roomService;

    @Autowired
    WishListService wishListService;

    @Autowired
    EventService eventService;

    @GetMapping("/event")
    public String main(Model model) {
        try {
            List<EventDto> eventMainDto = eventService.selectMain();
            System.out.println("eventMainDto = " + eventMainDto);
            model.addAttribute("eventMainDto", eventMainDto);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "main/eventPage";
    }

    @GetMapping("/")
    public String main(HttpSession session, Model model)
            throws Exception {
        String userEmail = (String) (session.getAttribute("user_email"));

        if (userEmail == null) {
            return "main/main";
        }

        UserDto user = userInfoService.getUserInfo(userEmail);
        String profileImgUrl = profileImgService.getProfileImgUrl(user.getUser_id());
        String isHost = user.getUser_is_host();

        model.addAttribute("user", user);
        model.addAttribute("profileImgUrl", profileImgUrl);
        model.addAttribute("isHost", isHost);
        return "main/main";
    }

    @ResponseBody
    @RequestMapping("/scroll")
    public List<Map<String, Object>> main2(HttpSession session, Model model,
            @RequestParam String currentPage,
            @RequestParam(value = "category", defaultValue = "") String category,
            @RequestParam(value = "view", defaultValue = "") String view,
            @RequestParam(value = "address", defaultValue = "") String address,
            @RequestParam(value = "search_capa", defaultValue = "") String search_capa,
            @RequestParam(value = "search_start_date", defaultValue = "") String search_start_date,
            @RequestParam(value = "search_end_date", defaultValue = "") String search_end_date,
            @RequestParam(value = "search_min_price", defaultValue = "") String search_min_price,
            @RequestParam(value = "search_max_price", defaultValue = "") String search_max_price,
            HttpServletResponse response
    ) throws Exception {
        List<Map<String, Object>> roomList = new ArrayList<>();

        try {

            String userEmail = (String) (session.getAttribute("user_email"));
            String user_id;

            if (userEmail != null) {
                UserDto user = userInfoService.getUserInfo(userEmail);
                user_id = user.getUser_id();
            } else {
                user_id = "";
            }

            //한번에 불러올 숙소 개수
            final int PAGE_ROW_COUNT = 8;

            //만약 '국내 전체'로 값이 들어오면 빈 문자열로 바꿔서 전체 검색
            if (address.equals("국내 전체")) {
                address = "";
            }

            //서치컨디션 생성
            SearchCondition sc = new MainSearchCondition(Integer.parseInt(currentPage),
                    PAGE_ROW_COUNT, category, view,
                    address, search_start_date, search_end_date, search_capa, search_min_price,
                    search_max_price, user_id);
            int totalCount = roomService.countAllRoom(sc);

            if (totalCount == 0) {
                return roomList;
            }

            PageHandler pageHandler = new PageHandler(totalCount, sc);
            Integer totalPageCount = pageHandler.getTotalPage();

            //룸 리스트 반환
            roomList = roomService.lookUpAllRoom(sc);

            //이미지 url 처리 + 룸 리스트에 정제해서 넣기
            for (int i = 0; i < roomList.size(); i++) {
                String roomImgUrl = (String) roomList.get(i).get("room_img_url_list");
                String[] roomImg = roomImgUrl.split(", ");

                roomList.get(i).put("room_img_url_list", roomImg);
                // 총 페이지 숫자를 리스트에 추가해서 넣기
                roomList.get(i).put("totalPageCount", totalPageCount);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return roomList;
    }
}

