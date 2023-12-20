package com.universestay.project.room.controller;

import com.universestay.project.common.exception.CommonException;
import com.universestay.project.room.dto.SendEmailBookInfoDto;
import com.universestay.project.room.service.BookService;
import com.universestay.project.room.service.BookShareMailSendService;
import com.universestay.project.room.service.RoomService;
import com.universestay.project.user.dto.BookingDto;
import java.util.Arrays;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/room/book")
public class BookingRoomController {

    private BookShareMailSendService bookShareMailSendService;
    private RoomService roomService;
    private BookService bookService;

    @Autowired
    public BookingRoomController(BookShareMailSendService bookShareMailSendService,
            RoomService roomService, BookService bookService) {
        this.bookShareMailSendService = bookShareMailSendService;
        this.roomService = roomService;
        this.bookService = bookService;
    }

    @GetMapping("/{room_id}")
    public String bookRoom(BookingDto bookingDto,
            @RequestParam("weekdayPrice") String weekdayPrice,
            @RequestParam("weekendPrice") String weekendPrice,
            @RequestParam("extraPersonFee") String extraPersonFee,
            @RequestParam("BookingPriceSum") String BookingPriceSum,
            Model model) throws CommonException {

        Map<String, Object> bookInfo = bookService.selectRoomBookInfo(bookingDto.getRoom_id());
        model.addAttribute("bookInfo", bookInfo);
        model.addAttribute("bookingDto", bookingDto);
        model.addAttribute("weekdayPrice", weekdayPrice);
        model.addAttribute("weekendPrice", weekendPrice);
        model.addAttribute("extraPersonFee", extraPersonFee);
        model.addAttribute("BookingPriceSum", BookingPriceSum);

        return "room/book";
    }

    @PostMapping("/share/{room_id}")
    @ResponseBody
    public ResponseEntity bookShare(@RequestBody BookingDto bookingDto, HttpSession httpSession)
            throws Exception {

        // 숙소에 대한 정보 가져오기
        Map<String, Object> roomDto = roomService.lookUpRoom(bookingDto.getRoom_id(),
                (String) httpSession.getAttribute("user_email"));

        // 이미 다른 게스트가 예약했다면 승인거절 처리
        if (bookService.selectCheckBookingRoom(bookingDto) > 0) {
            return new ResponseEntity<>(this.getClass(), HttpStatus.BAD_REQUEST);
        }

        // DB에 저장 Booking(예약 확정 상태는 아님)
        bookService.bookRoom(bookingDto, roomDto, httpSession);

        return new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping("/share/{room_id}")
    public String bookShare(@PathVariable String room_id, BookingDto bookingDto,
            HttpSession httpSession, Model model) {

        Map<String, Object> bookInfo = bookService.selectRoomBookInfo(room_id);

        model.addAttribute("user_email", httpSession.getAttribute("user_email"));
        model.addAttribute("bookInfo", bookInfo);
        model.addAttribute("bookInfoDto", bookingDto);

        return "room/bookShare";
    }

    @PostMapping("/sendEmailForRoomInfo")
    public ResponseEntity<String> sendEmailForRoomInfo(
            @RequestBody SendEmailBookInfoDto sendEmailBookInfoDto) {
        /* 사용자가 입력한 이메일을 받는다. */
        /* VIEW에서 정보를 가져와서 이메일과 함께 ajax 요청을 보낸다. */
        /* 사용자 - 예정된 예약 페이지로 가게 해야한다. */

        System.out.println(Arrays.toString(sendEmailBookInfoDto.getEmails()));
        System.out.println(sendEmailBookInfoDto.getString());
        System.out.println(sendEmailBookInfoDto);

//        String[] emails = request.getParameterValues("emails");
//        bookShareMailSendService.sendEmailForRoomInfo(emails, sendEmailBookInfoDto);

//
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("YES");
    }
}
