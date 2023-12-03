package com.universestay.project.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class DashBoardController {


    @GetMapping("/dashboard")
    public String dashboard() {
        return "/admin/dashboard";
    }

    //    public boolean loginCheck(HttpServletRequest request) {
//        // 1. 세션을 얻어서(false는 session이 없어도 새로 생성하지 않는다. 반환값 null)
//        HttpSession sessions = request.getSession(false);
//
//        // 2. 세션에 id가 있는지 확인, 있으면 true 반환
//        return sessions != null && sessions.getAttribute("id") != null;
//    }
}
