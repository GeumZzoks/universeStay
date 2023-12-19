package com.universestay.project.chat.controller;

import com.universestay.project.chat.service.ChatRoomService;
import com.universestay.project.dto.ChattingRoomDto;
import com.universestay.project.room.dto.RoomDto;
import com.universestay.project.room.service.RoomService;
import com.universestay.project.user.dao.UserWithdrawalDao;
import com.universestay.project.user.dto.UserDto;
import com.universestay.project.user.service.ProfileImgServiceImpl;
import com.universestay.project.user.service.UserInfoService;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ChattingRoomController {

    @Autowired
    RoomService roomService;

    @Autowired
    UserWithdrawalDao userWithdrawalDao;

    @Autowired
    ProfileImgServiceImpl profileImgService;

    @Autowired
    UserInfoService userInfoService;

    @Autowired
    ChatRoomService chatRoomService;


    // 호스트 처음 연락 화면
    @RequestMapping("/chatting/contact_host/{room_id}")
    public String contact_host(@PathVariable String room_id, @RequestParam String chat_room_id,
            @ModelAttribute ChattingRoomDto chattingRoomDto,
            Model model) {
        try {
            RoomDto room = roomService.lookUpRoom(room_id);
            UserDto host = userWithdrawalDao.selectUserByUuid(room.getUser_id());
            String profileImgUrl = profileImgService.getProfileImgUrl(room.getUser_id());

            model.addAttribute("room", room);
            model.addAttribute("host", host);
            model.addAttribute("chat_room_id", chat_room_id);
            model.addAttribute("profileImgUrl", profileImgUrl);
            return "/chatting/contact_host";

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    // 채팅방 생성
    @RequestMapping("/chatting/createRoom/{room_id}")
    public String createRoom(Model model, @PathVariable String room_id,
            @ModelAttribute ChattingRoomDto chattingRoomDto, HttpSession session,
            RedirectAttributes rattr) {

        try {
            // 로그인한 사용자 id 받아오기
            String user_id = (String) session.getAttribute("user_id");
            // 호스트 id 받아오기
            RoomDto room = roomService.lookUpRoom(room_id);
            String user_id2 = String.valueOf(
                    userWithdrawalDao.selectUserByUuid(room.getUser_id()).getUser_id());

            chattingRoomDto.setUser_id(user_id);
            chattingRoomDto.setUser_id2(user_id2);
            chattingRoomDto.setRoom_id(room_id);

            // 기존 채팅방이 존재하는지 조회
            ChattingRoomDto chatRoom = chatRoomService.selectChatRoom(chattingRoomDto);

            // 기존 채팅방이 존재할 경우
            if (chatRoom != null && chatRoom.getRoom_id().equals(room_id) && chatRoom.getUser_id()
                    .equals(user_id) && chatRoom.getUser_id2().equals(user_id2)) {

                // 채팅방 아이디 조회
                String chat_room_id = chatRoomService.selectChatRoomId(chattingRoomDto);
                rattr.addAttribute("chat_room_id", chat_room_id); // chat_room_id를 요청 파라미터로 추가

                // 채팅방으로 이동
                return "redirect:/chatting/contact_host/" + room_id;
            }
            // 기존 채팅방이 존재하지 않을 경우
            else {
                // 채팅방 아이디 생성
                String chat_room_id = UUID.randomUUID().toString();

                // dto에 채팅방 아이디, 유저 아이디, 호스트 아이디 저장
                chattingRoomDto.setChatting_room_id(chat_room_id);
                chattingRoomDto.setUser_id(user_id);
                chattingRoomDto.setUser_id2(user_id2);
                chattingRoomDto.setRoom_id(room_id);
                chattingRoomDto.setCreated_id(user_id);
                chattingRoomDto.setUpdated_id(user_id);

                // 채팅방 생성
                int result = chatRoomService.createRoom(chattingRoomDto);
                // 채팅방 생성 성공 시
                String msg = "OK";

                model.addAttribute("chat_room_id", chat_room_id);
                model.addAttribute("room_id", room_id);
                model.addAttribute("user_id", user_id);
                model.addAttribute("user_id2", user_id2);
                rattr.addAttribute("chat_room_id", chat_room_id); // chat_room_id를 요청 파라미터로 추가
                rattr.addFlashAttribute("msg", msg);
                // 채팅방으로 이동
                return "redirect:/chatting/contact_host/" + room_id;
            }
        } catch (Exception e) {
            // 채팅방 생성 실패 시
            String msg = "FAIL";
            e.printStackTrace();
            rattr.addFlashAttribute("msg", msg);

            return "redirect:/room/" + room_id;
        }

    }

    // 전체 채팅 목록 화면
    @RequestMapping("/chatting/chattingRoomList")
    public String rooms(HttpSession session, RedirectAttributes rattr, Model model) {
        String user_id = session.getAttribute("user_id").toString();
        String msg = "OK";

        try {
            // 현재 로그인한 id 의 채팅방 목록 조회
            List<Map<String, Object>> chatRoomList = chatRoomService.selectChatRoomList(user_id);
            // 채팅방 목록을 하나씩 화면에 전달
            model.addAttribute("chatRoomList", chatRoomList);

            rattr.addFlashAttribute("msg", msg);
            // 채팅방 목록 화면으로 이동
            return "/chatting/chattingRoomList2";

        } catch (Exception e) {
            e.printStackTrace();
            msg = "FAIL";
            rattr.addFlashAttribute("msg", msg);
            // 메인 화면으로 이동
            return "redirect:/";
        }
    }

    // 채팅 테스트 화면 - 삭제 예정
    @RequestMapping("/chatting/chatting")
    public String chatTest() {

        return "/chatting/chatting";
    }


}