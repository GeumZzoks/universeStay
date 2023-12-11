package com.universestay.project.room.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/room/book")
public class BookingRoomController {

    @GetMapping("/test")
    public String test(RedirectAttributes redirectAttributes) {
        redirectAttributes.addAttribute("test", "Test");
        return "redirect:/room/book/test1";
    }

    @GetMapping("/test1")
    public String test1(@RequestParam String test) {

        System.out.println(test);

        return "room/book";
    }

    @GetMapping
    public String bookRoom() {
        /* 앞단(숙소 상세)에서 넘어온 숙소 정보를 받아야하네? */
        /* 그걸 VIEW에 뿌려 */
        return "room/book";
    }

    @GetMapping("/share/{UUID}") // post 매핑으로 변경 예정
    public String bookShare(@PathVariable String UUID) {
        /*  */

        /* 예약 요청 버튼을 JS에서 누르게 되면 */
        /* JS에서 UUID 만들어서 쿼리스트링에 넘김 */
        /* VIEW 단에서 입력되어 있는 정보를 여기로 넘김 */
        /* DB에 저장 Booking(예약 확정 상태는 아님) */
        /* VIEW 단에 뿌려주기 */
        return "room/bookShare";
    }

    /* 삭제 예정 */
//    @GetMapping("mailSend")
//    public String mailSend() {
//        return "room/mailSend";
//    }

    @PostMapping("sendEmailForRoomInfo")
    public ResponseEntity<String> sendEmailForRoomInfo() {
        /* 일단 사용자가 입력한 이메일을 받는다. */
        /* VIEW에서 정보를 가져와서 이메일과 함께 ajax 요청을 보낸다. */

        return ResponseEntity.status(HttpStatus.OK).body("YES");
    }
}
