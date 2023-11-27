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
@RequestMapping("/event")
public class EventController {

    @Autowired
    EventDao eventDao;

    @GetMapping("/list")
    public String list(Model m) throws Exception {
        List<EventDto> eventDto = eventDao.selectAll();
        m.addAttribute("eventList", eventDto);
        Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
        m.addAttribute("startOfToday", startOfToday.toEpochMilli());

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
    public String read(@PathVariable Integer event_id, Model m) throws Exception {
        EventDto eventDto = eventDao.select(event_id);
        m.addAttribute(eventDto);
        return "admin/event";
    }

    @GetMapping("/write")
    public String write() {
        return "admin/eventInput";
    }

    @PostMapping("/write")
    public String write(EventDto eventDto, HttpSession session, Model m) {
        // 로그인 기능이 없어 가데이터로 추가된 관리자 id로 선언해놨습니다.
        String admin_id = "0ca24692-89ea-11ee-b9d1-0242ac120002";
        Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
        m.addAttribute("startOfToday", startOfToday.toEpochMilli());
        try {
            // 현재 입력할 수 없거나 구현되지 않은 데이터들은 setter로 임시로 설정했습니다.
            // 기능 구현 확인을 위해 어쩔 수 없어서 화요일 전에 수정하겠습니다.
            eventDto.setAdmin_id(admin_id);
            eventDto.setCreated_id(admin_id);
            eventDto.setUpdated_id(admin_id);
            eventDao.insert(eventDto);
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/event/list";
        }
        return "redirect:/event/list";
    }

    @PostMapping("/{event_id}")
    public String delete(@PathVariable Integer event_id, HttpSession session)
            throws Exception {
        // 마찬가지로 구현 확인을 위해 관리자 id를 데이터에 입력된 값으로 설정해놨습니다.
        String admin_id = "0ca24692-89ea-11ee-b9d1-0242ac120002";
        String getAdmin_id = eventDao.select(event_id).getAdmin_id();

        if (admin_id.equals(getAdmin_id)) {
            eventDao.delete(event_id);
        } else {
            return "redirect:/event/" + event_id;
        }
        return "redirect:/event/list";
    }

    @GetMapping("/update/{event_id}")
    public String update(@PathVariable Integer event_id, Model m) throws Exception {
        EventDto eventDto = eventDao.select(event_id);
        m.addAttribute(eventDto);
        return "admin/eventUpdate";
    }

    @PostMapping("/update/{event_id}")
    public String update(@PathVariable Integer event_id, EventDto eventDto) throws Exception {
        // 마찬가지로 구현 확인을 위해 관리자 id를 데이터에 입력된 값으로 설정해놨습니다.
        String admin_id = "0ca24692-89ea-11ee-b9d1-0242ac120002";

        eventDto.setEvent_id(event_id);
        eventDto.setUpdated_id(admin_id);
        eventDao.update(eventDto);
        return "redirect:/event/" + event_id;
    }
}
