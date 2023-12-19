package com.universestay.project.admin.controller;

import com.universestay.project.admin.dto.EventDto;
import com.universestay.project.admin.dto.EventImgDto;
import com.universestay.project.admin.service.EventService;
import com.universestay.project.common.PageHandler;
import com.universestay.project.common.S3.AwsS3ImgUploaderService;
import com.universestay.project.common.SearchCondition;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("/admin/event")
public class EventController {

    // 의존성 주입
    @Autowired
    EventService eventService;

    @Autowired
    AwsS3ImgUploaderService awsS3ImgUploaderService;

    @GetMapping("/list")
    // 이벤트 목록 조회 코드
    public String list(SearchCondition sc, Model m) {
        try {
            System.out.println(sc);
            // 페이징 처리
            int totalCnt = eventService.getSearchResultCnt(sc);
            m.addAttribute("totalCnt", totalCnt);
            // 한 페이지에 보여줄 게시물 수
            sc.setPageSize(15);
            PageHandler pageHandler = new PageHandler(totalCnt, sc);
            // 검색된 게시물 페이징 처리
            List<Map<String, Object>> list = eventService.getSearchResultPage(sc);
            m.addAttribute("list", list);
            m.addAttribute("ph", pageHandler);
            // 목록에서 시간별로 게시 날짜를 구분하기 위해 선언
            Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
            m.addAttribute("startOfToday", startOfToday.toEpochMilli());

            //예외처리
        } catch (Exception e) {
            // 이벤트 게시글 목록 조회 실패 메세지 추가예정
            e.printStackTrace();
            // 목록 조회 실패 시 리스트에 유지
            return "admin/eventList";
        }
        return "admin/eventList";
    }

    @GetMapping("/{event_id}")
    // 이벤트 개별 조회 코드
    public String read(@PathVariable Integer event_id, Model m) {
        try {
            // 이벤트 DB에 저장된 값 모델로 불러오기
            Map<String, Object> eventDto = eventService.read(event_id);
            m.addAttribute("eventDto", eventDto);
        } catch (Exception e) {
            e.printStackTrace();
            // 조회 실패시 목록으로 이동
            return "redirect:/admin/event/list";
        }
        return "admin/event";
    }

    @GetMapping("/write")
    // 이벤트 작성 화면으로 넘어가기
    public String write() {
        return "admin/eventInput";
    }

    @PostMapping("/write")
    // 이벤트 게시글 작성 코드
    public String write(EventDto eventDto, EventImgDto eventImgDto, @RequestParam("eventFile") MultipartFile event_img_url, Model m, HttpSession session, RedirectAttributes rattr) throws Exception {
        // 로그인시 세션에 전송된 이메일 가져오기
        String adminEmail = (String) session.getAttribute("admin_email");
        // 가져온 세션 이메일로 현재 로그인된 Admin 테이블의 UUID 가져오기
        String writer = eventService.getAdminUuid(adminEmail);
        // 이벤트 시작일 입력 시 시작일과 종료일이 오늘보다 이전이면 안되기 때문에 시간을 구분하기 위한 코드(구현예정)
        Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
        m.addAttribute("startOfToday", startOfToday.toEpochMilli());
        try {
            // 현재 로그인된 ID가 입력되어야 하는 필수 입력값 지정
            eventDto.setAdmin_id(writer);
            eventDto.setCreated_id(writer);
            eventDto.setUpdated_id(writer);
            eventImgDto.setCreated_id(writer);
            eventImgDto.setUpdated_id(writer);
            String event_img_src = awsS3ImgUploaderService.uploadImageToS3(event_img_url, "event-img");
            eventImgDto.setEvent_img_url(event_img_src);
            // 입력처리
            eventService.write(eventDto, eventImgDto);

            //예외처리
        } catch (Exception e) {
            // 작성 실패 메세지 -> 성공 메세지는 출력하지 않으므로 예외 발생시 초기와와 함께 선언
            String msg = "WRT_ERR";
            // 예외 찍어주기
            e.printStackTrace();
            // 작성 실패 메세지 전송
            rattr.addFlashAttribute("msg", msg);
            // 작성 실패 메세지와 함께 게시글 작성으로 돌아가기
            return "redirect:/admin/event/write";
        }
        // 작성 성공시 작성된 게시글로 이동
        return "redirect:/admin/event/" + eventDto.getEvent_id();
    }

    @PostMapping("/{event_id}")
    // 이벤트 게시글 삭제 코드
    public String delete(@PathVariable Integer event_id, HttpSession session, RedirectAttributes rattr) {
        // 삭제 성공 메세지
        String msg = "DEL_OK";
        try {
            // 로그인시 세션에 전송된 이메일 가져오기
            String adminEmail = (String) session.getAttribute("admin_email");
            // 가져온 세션 이메일로 현재 로그인된 Admin 테이블의 UUID 가져오기
            String admin_id = eventService.getAdminUuid(adminEmail);
            // 삭제하려는 게시글의 작성자 UUID 가져오기
            System.out.println("admin_id = " + admin_id);
            String getAdmin_id = eventService.select(event_id).getAdmin_id();
            System.out.println("getAdmin_id = " + getAdmin_id);
            // 작성자와 현재 세션에 로그인된 관리자가 같으면 삭제
            if (admin_id.equals(getAdmin_id)) {
                // if 문으로 작성자가 맞는지 먼저 확인하기 때문에 삭제 시 admin_id 는 확인하지 않음
                // 삭제처리
                eventService.delete(event_id);
            } else {
                // 권한이 없을 예외로 던짐
                throw new Exception("Delete Denied.");
            }
            // 관리자와 게시자가 다르거나 예외 발생 시 삭제처리되지 않고 다시 현재 페이지로 리다이렉트
            // 예외처리
        } catch (Exception e) {
            // 삭제 실패 메세지로 변경
            msg = "DEL_ERR";
            // 예외 찍어주기
            e.printStackTrace();
            // 삭제 실패 메세지 전송
            rattr.addFlashAttribute("msg", msg);
            // 예외 발생 시 현재 페이지로 리다이렉트
            return "redirect:/admin/event/" + event_id;
        }
        // 삭제 성공 메세지 전송
        rattr.addFlashAttribute("msg", msg);
        // 삭제 성공 후 성공 메세지와 함께 게시글 목록으로 이동
        return "redirect:/admin/event/list";
    }

    @GetMapping("/update/{event_id}")
    // 이벤트 수정 화면으로 이동하는 코드
    public String update(@PathVariable Integer event_id, Model m, HttpSession session, RedirectAttributes rattr) {
        // 예외 메세지 코드 GET메서드로 수정페이지 권한 확인을 위해 예외 메세지만 출력
        String msg = "UDT_ERR";
        try {
            // 로그인시 세션에 전송된 이메일 가져오기
            String adminEmail = (String) session.getAttribute("admin_email");
            // 가져온 세션 이메일로 Admin 테이블의 UUID 가져오기
            String adminUuid = eventService.getAdminUuid(adminEmail);
            // 수정하려는 게시글의 작성자 UUID 가져오기
            String id = eventService.select(event_id).getAdmin_id();
            // 수정페이지로 이동하려는 사람이 작성자와 일치하는지 확인
            // 일치하지 않으면 아예 수정페이지로 접근할 수 없다
            String start = eventService.select(event_id).getEvent_start_date();
            String expire = eventService.select(event_id).getEvent_expire_date();
            String event_start_val = start.substring(0, 10);
            String event_expire_val = expire.substring(0, 10);

            if (adminUuid.equals(id)) {
                // 권한이 있을경우 수정하고자 하는 게시글의 DB정보를 모델로 저장
                Map<String, Object> eventDto = eventService.selectWithImg(event_id);
                m.addAttribute("eventDto", eventDto);
                m.addAttribute("start", event_start_val);
                m.addAttribute("expire", event_expire_val);

                System.out.println(event_start_val);
            } else {
                // 권한이 없을경우 예외로 던짐
                throw new Exception("Update Denied.");
            }

            // 예외처리
        } catch (Exception e) {
            // 에러 찍어주기
            e.printStackTrace();
            // 권한 인증 실패 메세지 전송
            rattr.addFlashAttribute("msg", msg);
            // 작성자와 게시자가 일치하지 않을 경우 or 기타 등등 에러 시 원래 페이지 유지
            return "redirect:/admin/event/" + event_id;
        }
        // 변경하고자 하는 게시글의 값을 갖고 수정 페이지로 이동
        return "admin/eventUpdate";
    }

    @PostMapping("/update/{event_id}")
    // 이벤트 게시글 수정 코드
    public String update(@PathVariable Integer event_id, EventDto eventDto, EventImgDto eventImgDto, @RequestParam("eventFile") MultipartFile event_img_url, HttpSession session, RedirectAttributes rattr) {
        // 성공 메세지 코드
        String msg = "UDT_OK";
        try {
            // 로그인시 세션에 전송된 이메일 가져오기
            String adminEmail = (String) session.getAttribute("admin_email");
            // 가져온 세션 이메일로 Admin 테이블의 UUID 가져오기
            String adminId = eventService.getAdminUuid(adminEmail);
            // 수정창에 접근할때 이미 작성자 여부를 확인했으므로 수정만 진행하면 됨
            String event_img_src = awsS3ImgUploaderService.uploadImageToS3(event_img_url, "event-img");

            // 수정할 게시글을 ID로 지정
            eventDto.setEvent_id(event_id);
            // 최종 수정자 ID를 현재 로그인된 UUID로 지정
            eventDto.setUpdated_id(adminId);
            eventImgDto.setUpdated_id(adminId);
            // 수정한 이미지 url 지정
            eventImgDto.setEvent_img_url(event_img_src);

            // 업데이트
            eventService.update(eventDto, eventImgDto);

            // 예외처리
        } catch (Exception e) {
            // 실패 메세지 코드
            msg = "UDT_ERR2";
            // 에러 찍어주기
            e.printStackTrace();
            // 실패 메세지 코드 전송
            rattr.addFlashAttribute("msg", msg);
            // 예외 발생시(입력값 누락 등) 경고 메세지와 함께 다시 수정창 그대로 리다이렉트
            return "redirect:/admin/event/update/" + event_id;
        }
        // 성공 메세지 코드 전송
        rattr.addFlashAttribute("msg", msg);
        // 수정 성공시 수정 성공 메세지와 함께 수정된 게시글 조회로 리다이렉트
        return "redirect:/admin/event/" + event_id;
    }
}
