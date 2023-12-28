package com.universestay.project.room.controller;

import com.universestay.project.review.service.RoomReviewService;
import com.universestay.project.room.dao.BookDao;
import com.universestay.project.room.dto.SendEmailBookInfoDto;
import com.universestay.project.room.service.BookService;
import com.universestay.project.room.service.BookShareMailSendService;
import com.universestay.project.room.service.RoomService;
import com.universestay.project.user.dto.BookingDto;
import java.text.DecimalFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
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
    private BookDao bookDao;
    private RoomReviewService roomReviewService;

    @Autowired
    public BookingRoomController(BookShareMailSendService bookShareMailSendService,
            RoomService roomService, BookService bookService, BookDao bookDao,
            RoomReviewService roomReviewService) {
        this.bookShareMailSendService = bookShareMailSendService;
        this.roomService = roomService;
        this.bookService = bookService;
        this.bookDao = bookDao;
        this.roomReviewService = roomReviewService;
    }


    @GetMapping("/{room_id}")
    public String bookRoom(BookingDto bookingDto,
            @RequestParam("weekdayPrice") String weekdayPrice,
            @RequestParam("weekendPrice") String weekendPrice,
            @RequestParam("extraPersonFee") String extraPersonFee,
            @RequestParam("BookingPriceSum") String BookingPriceSum,
            @RequestParam("weekdayCount") String weekdayCount,
            @RequestParam("weekendCount") String weekendCount,
            @RequestParam("extraPersonCount") String extraPersonCount,
            @RequestParam("totalDay") String totalDay,
            Model model) throws Exception {

        Map<String, Object> bookInfo = bookService.selectRoomBookInfo(bookingDto.getRoom_id());
        List<BookingDto> bookingDtos = bookDao.selectUnavailableDates(bookingDto.getRoom_id());

        int roomReviewCount = roomReviewService.getRoomReviewCount(bookingDto.getRoom_id());

        model.addAttribute("bookInfo", bookInfo);
        model.addAttribute("bookingDto", bookingDto);
        model.addAttribute("weekdayPrice", weekdayPrice);
        model.addAttribute("weekendPrice", weekendPrice);
        model.addAttribute("extraPersonFee", extraPersonFee);
        model.addAttribute("BookingPriceSum", BookingPriceSum);
        model.addAttribute("bookingDtos", bookingDtos);
        model.addAttribute("weekdayCount", weekdayCount);
        model.addAttribute("weekendCount", weekendCount);
        model.addAttribute("extraPersonCount", extraPersonCount);
        model.addAttribute("totalDay", totalDay);
        model.addAttribute("roomReviewCount", roomReviewCount);

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
            @RequestParam(value = "profile_img_url", defaultValue = "https://universestay-img-server.s3.ap-northeast-2.amazonaws.com/big_logo_no_bgd.png") String profile_img_url,
            HttpSession httpSession, Model model) {

        // Room, User, ProfileImg 테이블 전체 가져오기
        Map<String, Object> bookInfo = bookService.selectRoomBookInfo(room_id);

        model.addAttribute("user_email", httpSession.getAttribute("user_email"));
        model.addAttribute("bookInfo", bookInfo);
        model.addAttribute("bookInfoDto", bookingDto);
        model.addAttribute("profile_img_url", profile_img_url);

        // 숫자 포맷을 설정합니다.
        DecimalFormat decimalFormat = new DecimalFormat("#,###");

        // 표시할 숫자를 가져옵니다.
        int bookingTotalPayAmount = bookingDto.getBooking_total_pay_amount();

        // 숫자를 백단위로 포맷합니다.
        String formattedAmount = decimalFormat.format(bookingTotalPayAmount);
        model.addAttribute("formattedAmount", formattedAmount);

        return "room/bookShare";
    }

    @PostMapping("/sendEmailForRoomInfo")
    public ResponseEntity sendEmailForRoomInfo(
            @RequestBody SendEmailBookInfoDto sendEmailBookInfoDto) {

        String localHost = "http://universestay.store";

        String profileLink = localHost + sendEmailBookInfoDto.getProfile_link();
        String roomDetailLink =
                localHost + sendEmailBookInfoDto.getRoom_detail_link();

        sendEmailBookInfoDto.setProfile_link(profileLink);
        sendEmailBookInfoDto.setRoom_detail_link(roomDetailLink);

        // 문자열을 LocalDate로 변환
        LocalDate checkIndate = LocalDate.parse(sendEmailBookInfoDto.getBooking_checkin_date(),
                DateTimeFormatter.ISO_DATE);
        LocalDate checkOutdate = LocalDate.parse(sendEmailBookInfoDto.getBooking_checkout_date(),
                DateTimeFormatter.ISO_DATE);

        // 요일을 얻기
        DayOfWeek checkInDateDayOfWeek = checkIndate.getDayOfWeek();
        DayOfWeek checkOutDateDayOfWeek = checkOutdate.getDayOfWeek();

        bookShareMailSendService.sendEmailForRoomInfo(sendEmailBookInfoDto, checkInDateDayOfWeek,
                checkOutDateDayOfWeek);

        return new ResponseEntity(HttpStatus.OK);
    }
}
