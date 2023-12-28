package com.universestay.project.user.controller;

import com.universestay.project.user.dto.WishListDto;
import com.universestay.project.user.service.WishListService;
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
import java.util.UUID;

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

                // room_main_photo 값을 배열의 맨 앞에 추가
                String roomMainPhoto = (String) wishList.get(i).get("room_main_photo");
                String[] updatedRoomImg = new String[roomImg.length + 1];
                updatedRoomImg[0] = roomMainPhoto;
                System.arraycopy(roomImg, 0, updatedRoomImg, 1, roomImg.length);

                // room_img_url_list를 업데이트된 배열로 설정
                wishList.get(i).put("room_img_url_list", updatedRoomImg);
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

            if (user_email == null) {
                System.out.println("exception1");
                throw new Exception();
            }

            try {
                if (wishListService.delete(user_id, room_id) == 1) {
                    return ResponseEntity.ok("DEL_OK");
                } else {
                    throw new Exception();
                }
            } catch (Exception DelErr) {
                try {
                    String wishlist_id = UUID.randomUUID().toString();
                    wishListDto.setWishlist_id(wishlist_id);
                    wishListDto.setUser_id(user_id);
                    wishListDto.setRoom_id(room_id);
                    wishListDto.setCreated_id(user_id);
                    wishListDto.setUpdated_id(user_id);
                    wishListService.insert(wishListDto);
                    return ResponseEntity.ok("IST_OK");
                } catch (Exception IstErr) {
                    IstErr.printStackTrace();
                    return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("IST_ERR");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("NOT_LOGGED_IN");
        }
    }

}
