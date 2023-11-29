package com.universestay.project.admin.controller;

import com.universestay.project.admin.service.EventService;
import com.universestay.project.dto.EventDto;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/admin/event")
public class EventController {

    // 의존성 주입
    @Autowired
    EventService eventService;


    @GetMapping("/list")
    // 이벤트 목록 조회 코드
    public String list(Model m) throws Exception {
        try {
            List<EventDto> eventDto = eventService.list();
            m.addAttribute("eventList", eventDto);
            // 목록에서 시간별로 게시 날짜를 구분하기 위해 선언
            Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
            m.addAttribute("startOfToday", startOfToday.toEpochMilli());
        } catch (Exception e) {
            // 이벤트 게시글 목록 조회 실패 메세지 추가예정
            e.printStackTrace();
            // 목록 조회 실패 시 리스트에 유지
            return "admin/eventList";
        }
        return "admin/eventList";
    }

    //검색은 아직 미구현입니다
//    @GetMapping("/list/{search}")
//    public String search(@PathVariable String search, Model m) throws Exception {
//        List<EventDto> eventDto = eventDao.search(search);
//        m.addAttribute("eventList", eventDto);
//        Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
//        m.addAttribute("startOfToday", startOfToday.toEpochMilli());
//
//        return "admin/eventList/" + search;
//    }

    @GetMapping("/{event_id}")
    // 이벤트 개별 조회 코드
    public String read(@PathVariable Integer event_id, Model m) {
        try {
            // 이벤트 서비스 변경완료
            EventDto eventDto = eventService.read(event_id);
            m.addAttribute(eventDto);
        } catch (Exception e) {
            // 조회 실패 메세지 추가예정
            return "redirect:/admin/event/list";
        }
        return "admin/event";
    }

    @GetMapping("/write")
    // 이벤트 작성 화면으로 넘어가는 코드
    public String write() {
        return "admin/eventInput";
    }

    @PostMapping("/write")
    // 이벤트 게시글 작성 코드
    public String write(EventDto eventDto, Model m, HttpSession session) {
        // 현재 세션 ID로 작성자 선언
        String writer = (String) session.getAttribute("admin_id");
        // 이벤트 시작일 입력 시 시작일과 종료일이 오늘보다 이전이면 안되기 때문에 시간을 구분하기 위한 코드(구현예정)
        Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
        m.addAttribute("startOfToday", startOfToday.toEpochMilli());
        try {
            // 이벤트 서비스로 변경
            eventDto.setAdmin_id(writer);
            eventDto.setCreated_id(writer);
            eventDto.setUpdated_id(writer);
            eventService.write(eventDto);
        } catch (Exception e) {
            // 작성에 실패했다는 메세지 추가예정
            e.printStackTrace();
            // 게시글 작성으로 돌아가기
            return "redirect:/admin/event/write";
        }
        return "redirect:/admin/event/list";
    }

    @PostMapping("/{event_id}")
    // 이벤트 게시글 삭제 코드
    public String delete(@PathVariable Integer event_id, HttpSession session) {
        try {
            // 삭제할 권한이 있는 작성자인지 확인하기 위해 선언
            String admin_id = (String) session.getAttribute("admin_id");
            String getAdmin_id = eventService.select(event_id).getAdmin_id();
            // 작성자와 현재 세션에 로그인된 관리자가 같으면 삭제
            if (admin_id.equals(getAdmin_id)) {
                // 이벤트 서비스로 변경
                // if 문으로 작성자가 맞는지 먼저 확인하기 때문에 삭제 시 admin_id 는 확인하지 않음
                eventService.delete(event_id);
            } else {
                return "redirect:/admin/event/" + event_id;
            }
            // 관리자와 게시자가 다르거나 예외 발생 시 삭제처리되지 않고 다시 현재 페이지로 리다이렉트
        } catch (Exception e) {
            // 예외 발생 경고창 추가예정
            e.printStackTrace();
            // 예외 발생 시 현재 페이지로 리다이렉트
            return "redirect:/admin/event/" + event_id;
        }
        return "redirect:/admin/event/list";
    }

    @GetMapping("/update/{event_id}")
    // 이벤트 수정 화면으로 이동하는 코드
    public String update(@PathVariable Integer event_id, Model m, HttpSession session) {
        try {
            // 수정할 권한이 있는 작성자인지 확인하기 위해 선언
            String writer = (String) session.getAttribute("admin_id");
            String id = eventService.select(event_id).getAdmin_id();
            // 수정페이지로 이동하려는 사람이 작성자와 일치하는지 확인
            // 일치하지 않으면 아예 수정페이지로 접근할 수 없다
            if (writer.equals(id)) {
                EventDto eventDto = eventService.select(event_id);
                m.addAttribute(eventDto);
            } else {
                return "redirect:/admin/event/" + event_id;
            }
            // 작성자와 게시자가 일치하지 않을 경우 or 기타 등등 에러 시 원래 페이지 유지
        } catch (Exception e) {
            // 오류 발생 메세지 추가예정
            e.printStackTrace();
            return "redirect:/admin/event/" + event_id;
        }
        return "admin/eventUpdate";
    }

    @PostMapping("/update/{event_id}")
    // 이벤트 게시글 수정 코드
    public String update(@PathVariable Integer event_id, EventDto eventDto, HttpSession session) {
        String admin_id = (String) session.getAttribute("admin_id");
        try {
            // 수정창에 접근할때 이미 작성자 여부를 확인했으므로 수정만 진행하면 됨
            eventDto.setEvent_id(event_id);
            eventDto.setUpdated_id(admin_id);
            eventService.update(eventDto);
        } catch (Exception e) {
            e.printStackTrace();
            // 예외 발생시(입력값 누락 등) 다시 수정창 그대로 리다이렉트
            return "redirect:/admin/event/update/" + event_id;
        }
        return "redirect:/admin/event/" + event_id;
    }
}
