package com.universestay.project.main.controller;

import com.universestay.project.room.service.RoomService;
import com.universestay.project.user.dto.UserDto;
import com.universestay.project.user.service.ProfileImgService;
import com.universestay.project.user.service.UserInfoService;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    @Autowired
    UserInfoService userInfoService;

    @Autowired
    ProfileImgService profileImgService;

    @Autowired
    RoomService roomService;

    @GetMapping("/")
    public String main(HttpSession session, Model model) throws Exception {
        String userEmail = (String) (session.getAttribute("user_email"));
        List<Map<String, Object>> roomList = roomService.lookUpAllRoom();

        for (int i = 0; i < roomList.size(); i++) {
            String roomImgUrl = (String) roomList.get(i).get("room_img_url_list");
            String[] roomImg = roomImgUrl.split(", ");

            roomList.get(i).put("room_img_url_list", roomImg);
        }

        model.addAttribute("roomList", roomList);

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
}

