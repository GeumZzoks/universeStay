package com.universestay.project.user.controller;

import com.universestay.project.user.dto.WishListDto;
import com.universestay.project.user.service.WishListService;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/myPage/wishLists")
public class WishListController {

    @Autowired
    WishListService wishListService;

    @GetMapping
    public String list(Model m, HttpSession session) {
        try {
            String user_email = (String) session.getAttribute("user_email");
            String user_id = wishListService.getUserUuid(user_email);
            List<Map<String, Object>> wishList = wishListService.selectAll(user_id);
            for (int i = 0; i < wishList.size(); i++) {
                String roomImgUrl = (String) wishList.get(i).get("room_img_url_list");
                String[] roomImg = roomImgUrl.split(", ");

                wishList.get(i).put("room_img_url_list", roomImg);
            }

            m.addAttribute("list", wishList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "user/myPage/wishList";
    }

    @PostMapping("/active")
    public ResponseEntity<String> insert(String room_id, WishListDto wishListDto,
            HttpSession session) {
        try {
            String user_email = (String) session.getAttribute("user_email");
            String user_id = wishListService.getUserUuid(user_email);
            System.out.println("user_email = " + user_email);
            System.out.println("user_id = " + user_id);

            if (user_email == null) {
                System.out.println("exception1");
                throw new Exception();
            }

            try {
                if (wishListService.delete(user_id, room_id) == 1) {
                    System.out.println("1 = " + 1);
                    return ResponseEntity.ok("DEL_OK");
                } else {
                    System.out.println("exception2");
                    throw new Exception();
                }
            } catch (Exception DelErr) {
                try {
                    System.out.println("exception3");
                    String wishlist_id = UUID.randomUUID().toString();
                    wishListDto.setWishlist_id(wishlist_id);
                    wishListDto.setUser_id(user_id);
                    wishListDto.setRoom_id(room_id);
                    wishListDto.setCreated_id(user_id);
                    wishListDto.setUpdated_id(user_id);
                    wishListService.insert(wishListDto);
                    return ResponseEntity.ok("IST_OK");
                } catch (Exception IstErr) {
                    System.out.println("exception4");
                    IstErr.printStackTrace();
                    return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("IST_ERR");
                }
            }
        } catch (Exception e) {
            System.out.println("exception5");
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("NOT_LOGGED_IN");
        }
    }

}
