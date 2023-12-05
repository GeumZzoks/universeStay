package com.universestay.project.room.controller;

import com.universestay.project.room.dto.RoomDto;
import com.universestay.project.room.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/room")
public class RoomController {

    @Autowired
    RoomService roomService;

    @GetMapping("")
    public String showRoom() {
        return "/room/roomDetail";
    }

    @GetMapping("/{room_id}")
    public String lookUpRoom(@PathVariable String room_id, Model model) {
        try {
            RoomDto room = roomService.lookUpRoom(room_id);

            if (room == null) {
                // TODO: 에러메세지 보여주고 메인으로 이동
                return "main/main";
            }

            model.addAttribute("room", room);
            
            return "room/roomDetail";
        } catch (Exception e) {
            e.printStackTrace();
            // TODO: 에러메세지 보여주고 메인으로 이동
            return "main/main";
        }

    }

    @GetMapping("/roomDelete")
    public String roomDelete() {
        return "/room/roomDelete";
    }
}
