package com.universestay.project.admin.controller;

import com.universestay.project.admin.dto.NoticeDto;
import com.universestay.project.admin.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/notice")
public class NoticeController {

    @Autowired
    NoticeService noticeService;

    @GetMapping("/list")
    public String list(Model model) throws Exception {
        model.addAttribute("list", noticeService.getList());
        return "/admin/noticeList";
    }

    @GetMapping("/read")
    public String read(@RequestParam("notice_id") Integer notice_id, Model model) throws Exception {
        model.addAttribute("noticeDto", noticeService.read(notice_id));
        return "/admin/notice";
    }

    @PostMapping("/remove")
    public String remove(Integer notice_id, RedirectAttributes rttr) throws Exception {
        if (noticeService.remove(notice_id) == 1) {
            rttr.addFlashAttribute("result", "삭제 성공!!!");
        }
        return "redirect:/admin/notice/list";
    }

    @GetMapping("/write")
    public String getWrite() throws Exception {
        return "/admin/noticeWrite";
    }

    @PostMapping("/write")
    public String postWrite(NoticeDto noticeDto) throws Exception {
        noticeService.write(noticeDto);
        return "redirect:/admin/notice/list";
    }

    @PostMapping("/modify")
    public String modify(NoticeDto noticeDto, RedirectAttributes rttr) throws Exception {
        if (noticeService.modify(noticeDto) == 1) {
            rttr.addFlashAttribute("result", "수정 성공!!!");
        }
        return "redirect:/admin/notice/list";
    }
}
