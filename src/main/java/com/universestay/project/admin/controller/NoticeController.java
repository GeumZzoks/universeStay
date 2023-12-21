package com.universestay.project.admin.controller;


import com.universestay.project.admin.dto.NoticeDto;
import com.universestay.project.admin.dto.NoticePageHandler;
import com.universestay.project.admin.service.NoticeService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/notice")
public class NoticeController {

    @Autowired
    NoticeService noticeService;

    // 공지사항 목록
    @GetMapping("/list")
    public String list(@RequestParam(defaultValue = "1") Integer page,
            @RequestParam(defaultValue = "10") Integer pageSize, Model m) {
        try {
            int totalCnt = noticeService.getCount();
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

            System.out.println("showPrev : " + nph.isShowPrev());
            System.out.println("showNext : " + nph.isShowNext());

            List<Map<String, Object>> list = noticeService.getPage(map);
            m.addAttribute("list", list);
            m.addAttribute("nph", nph);
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("msg", "LIST_ERR");
        }
        return "admin/noticeList";
    }

    // 공지사항 조회
    @GetMapping("/{notice_id}")
    public String read(@PathVariable("notice_id") Integer notice_id, Model model,
            RedirectAttributes rttr) {
        // DB에 있는 공지사항 번호이면 보여주고, 없으면 에러 메시지 뷰에 전달
        try {
            model.addAttribute("noticeDto", noticeService.read(notice_id));
        } catch (Exception e) {
            e.printStackTrace();
            rttr.addFlashAttribute("msg", "READ_ERR");
            return "redirect:/admin/notice/list";
        }
        return "admin/notice";
    }

    // 공지사항 삭제
    @PostMapping("/remove")
    public String remove(Integer notice_id, RedirectAttributes rttr) {
        String msg = "DEL_OK";
        try {
            // 식제가 되지 않으면 삭제 에러 메시지 뷰에 전달
            if (noticeService.remove(notice_id) != 1) {
                throw new Exception("Delete Failed.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            msg = "DEL_ERR";
        }
        // 삭제 되었으면 삭제 성공 메세지 뷰에 전달
        rttr.addFlashAttribute("msg", msg);
        return "redirect:/admin/notice/list";
    }

    // 공지사항 등록(get 요청)
    @GetMapping("/write")
    public String getWrite() {
        return "admin/noticeWrite";
    }

    // 공지사항 등록
    @PostMapping("/write")
    public String postWrite(NoticeDto noticeDto, RedirectAttributes rttr, Model m,
            HttpSession session) {
        try {
            String writer = (String) session.getAttribute("admin_email");
            noticeDto.setAdmin_id(noticeService.getAdminId(writer));
            noticeDto.setCreated_id(noticeService.getAdminId(writer));
            noticeDto.setUpdated_id(noticeService.getAdminId(writer));
            if (noticeService.write(noticeDto) != 1) {
                throw new Exception("Write failed.");
            }
            // 공지사항 등록 성공 시
            return "redirect:/admin/notice/" + noticeDto.getNotice_id();
        } catch (Exception e) {
            // 공지사항 등록 실패 시 (실패하는 경우가 어떤 경우가 있을지 생각)
            e.printStackTrace();
            m.addAttribute(noticeDto);
            m.addAttribute("msg", "WRT_ERR");
            return "admin/noticeWrite";
        }
    }

    @GetMapping("modify/{notice_id}")
    public String modify(@PathVariable("notice_id") Integer notice_id, Model m,
            RedirectAttributes rttr) {
        try {
            // 정상적인 수정 get 요청 시
            NoticeDto noticeDto = noticeService.read(notice_id);
            m.addAttribute(noticeDto);
            return "admin/noticeUpdate";
        } catch (Exception e) {
            rttr.addFlashAttribute("msg", "MOD_NOT");
            return "redirect:/admin/notice/list";
        }
    }

    // 공지사항 수정
    @PostMapping("/modify")
    public String modify(NoticeDto noticeDto, RedirectAttributes rttr, Model model,
            HttpSession session) {
        try {
            String writer = (String) session.getAttribute("admin_email");
            noticeDto.setAdmin_id(noticeService.getAdminId(writer));
            noticeDto.setCreated_id(noticeService.getAdminId(writer));
            noticeDto.setUpdated_id(noticeService.getAdminId(writer));
            // 수정 실패 시
            if (noticeService.modify(noticeDto) != 1) {
                throw new Exception("Modify Failed.");
            }
            // 수정 성공 시
            rttr.addFlashAttribute("msg", "MOD_OK");
            return "redirect:/admin/notice/" + noticeDto.getNotice_id();
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("msg", "MOD_ERR");
            return "admin/notice";
        }
    }
}