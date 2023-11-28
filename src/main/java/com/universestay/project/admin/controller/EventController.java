package com.universestay.project.admin.controller;

import com.universestay.project.admin.dao.EventDao;
import com.universestay.project.dto.EventDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;


@Controller
@RequestMapping("/admin/event")
public class EventController {

    // 의존성 주입
    @Autowired
    EventDao eventDao;

    @GetMapping("/list")
    public String list(Model m) throws Exception {
        try {
            List<EventDto> eventDto = eventDao.selectAll();
            m.addAttribute("eventList", eventDto);
            Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
            m.addAttribute("startOfToday", startOfToday.toEpochMilli());
        } catch (Exception e) {
            // 이벤트 게시글 목록 조회 실패 메세지 추가예정
            e.printStackTrace();
            // 목록 조회 실패 시 관리자 메인 대시보드로 이동
            return "admin/dashboard";
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
    public String read(@PathVariable Integer event_id, Model m) {
        try {
            EventDto eventDto = eventDao.select(event_id);
            m.addAttribute(eventDto);
        } catch (Exception e) {
            // 조회 실패 메세지 추가예정
            return "redirect:/admin/event/list";
        }
        return "admin/event";
    }

    @GetMapping("/write")
    public String write() {
        return "admin/eventInput";
    }

    @PostMapping("/write")
    public String write(EventDto eventDto, HttpSession session, Model m) {
        // 로그인 기능에 세션 추가 시 사용할 코드
        String writer = (String) session.getAttribute("id");
        // 이벤트 시작일 입력 시 시작일과 종료일이 오늘보다 이전이면 안되기 때문에 시간을 구분하기 위한 코드
        Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
        m.addAttribute("startOfToday", startOfToday.toEpochMilli());
        try {
            // 세션에서 가져온 id로 작성자 설정
            eventDto.setAdmin_id(writer);
            eventDto.setCreated_id(writer);
            eventDto.setUpdated_id(writer);
            eventDao.insert(eventDto);
        } catch (Exception e) {
            // 작성에 실패했다는 메세지 추가예정
            e.printStackTrace();
            // 게시글 작성 실패 시 이벤트 목록으로 이동
            return "redirect:/admin/event/list";
        }
        return "redirect:/admin/event/list";
    }

    @PostMapping("/{event_id}")
    public String delete(@PathVariable Integer event_id, HttpSession session) {
        try {
            // 마찬가지로 구현 확인을 위해 관리자 id를 데이터에 입력된 값으로 설정해놨습니다.
            String admin_id = (String) session.getAttribute("id");
            String getAdmin_id = eventDao.select(event_id).getAdmin_id();
            // 작성자와 현재 세션에 로그인된 관리자가 같으면 삭제
            if (admin_id.equals(getAdmin_id)) {
                eventDao.delete(event_id);
            } else return "redirect:/admin/event/" + event_id;
            // 관리자와 게시자가 다르거나 예외 발생 시 삭제처리되지 않고 다시 현재 페이지로 리다이렉트
        } catch (Exception e) {
            // 예외 발생 경고창 추가예정
            e.printStackTrace();
            return "redirect:/admin/event/" + event_id;
        }
        return "redirect:/admin/event/list";
    }

    @GetMapping("/update/{event_id}")
    public String update(@PathVariable Integer event_id, Model m, HttpSession session) {
        try {
            String writer = (String) session.getAttribute("id");
            String id = eventDao.select(event_id).getAdmin_id();
            // 수정페이지로 이동하려는 사람이 작성자와 일치하는지 확인
            if (writer.equals(id)) {
                EventDto eventDto = eventDao.select(event_id);
                m.addAttribute(eventDto);
            } else return "redirect:/admin/event/" + event_id;
            // 아닐경우 or 기타 등등 에러 시 원래 페이지 유지
        } catch (Exception e) {
            // 오류 발생 메세지 추가예정
            e.printStackTrace();
            return "redirect:/admin/event/" + event_id;
        }
        return "admin/eventUpdate";
    }

    @PostMapping("/update/{event_id}")
    public String update(@PathVariable Integer event_id, EventDto eventDto, HttpSession session) {
        try {
            // 수정창에 접근할때 이미 작성자 여부를 확인했으므로 수정만 진행하면 됨
            String admin_id = (String) session.getAttribute("id");
            eventDto.setEvent_id(event_id);
            eventDto.setUpdated_id(admin_id);
            eventDao.update(eventDto);
        } catch (Exception e) {
            e.printStackTrace();
            // 예외 발생시(입력값 누락 등) 다시 수정창 그대로 리다이렉트
            return "redirect:/admin/event/update/" + event_id;
        }
        return "redirect:/admin/event/" + event_id;
    }
}
