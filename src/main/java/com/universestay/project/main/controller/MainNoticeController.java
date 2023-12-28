package com.universestay.project.main.controller;

import com.universestay.project.admin.dto.NoticePageHandler;
import com.universestay.project.admin.service.NoticeService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MainNoticeController {

    @Autowired
    NoticeService noticeService;

    @GetMapping("/notice")
    public String noticeList(@RequestParam(defaultValue = "1") Integer page,
            @RequestParam(defaultValue = "10") Integer pageSize, Model m) {
        try {
            int totalCnt = noticeService.getOpenCount();
            NoticePageHandler nph = new NoticePageHandler(totalCnt, page, pageSize);

            if (page < 0 || page > nph.getTotalPage()) {
                page = 1;
            }
            if (pageSize < 0 || pageSize > 50) {
                pageSize = 10;
            }

            Map map = new HashMap();
            map.put("offset", (page - 1) * pageSize);
            map.put("pageSize", pageSize);

            List<Map<String, Object>> list = noticeService.getMainPage(map);
            m.addAttribute("list", list);
            m.addAttribute("nph", nph);
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("msg", "LIST_ERR");
        }
        return "main/noticeList";
    }

    @GetMapping("/notice/{notice_id}")
    public String noticeDetail(@PathVariable("notice_id") Integer notice_id, Model m,
            RedirectAttributes rttr) {
        try {
            m.addAttribute("noticeDto", noticeService.mainRead(notice_id));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "main/noticeDetail";
    }

}
