package com.universestay.project.notice.controller;

import com.universestay.project.notice.dto.NoticeDto;
import com.universestay.project.notice.dto.NoticePageHandler;
import com.universestay.project.notice.service.NoticeService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
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

    // 공지사항 목록
    @GetMapping("/list")
    public String list(@RequestParam(defaultValue = "1") Integer page,
            @RequestParam(defaultValue = "10") Integer pageSize, Model m,
            HttpServletRequest request)
            throws Exception {

        try {
            int totalCnt = noticeService.getCount();
            NoticePageHandler noticePageHandler = new NoticePageHandler(totalCnt, page, pageSize);

            if (page < 0 || page > noticePageHandler.getTotalPage()) {
                page = 1;
            }
            if (pageSize < 0 || pageSize > 50) {
                pageSize = 10;
            }

            Map map = new HashMap();
            map.put("offset", (page - 1) * pageSize);
            map.put("pageSize", pageSize);

            List<NoticeDto> list = noticeService.getPage(map);
            m.addAttribute("list", list);
            m.addAttribute("noticePageHandler", noticePageHandler);
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("msg", "LIST_ERR");
        }
        return "/notice/noticeList2";
    }

    // 공지사항 조회
    @GetMapping("/read")
    public String read(@RequestParam("notice_id") Integer notice_id, Model model,
            RedirectAttributes rttr) {
        // DB에 있는 공지사항 번호이면 보여주고, 없으면 에러 메시지 뷰에 전달
        try {
            model.addAttribute("noticeDto", noticeService.read(notice_id));
        } catch (Exception e) {
            e.printStackTrace();
            rttr.addFlashAttribute("msg", "READ_ERR");
        }
        return "/notice/notice";
    }

    // 공지사항 삭제
    @PostMapping("/remove")
    public String remove(Integer notice_id, RedirectAttributes rttr) throws Exception {
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
        return "redirect:/notice/noticeList";
    }

    // 공지사항 등록(get 요청)
    @GetMapping("/write")
    public String getWrite() {
        return "/notice/noticeWrite";
    }

    // 공지사항 등록(post 요청)
    @PostMapping("/write")
    public String postWrite(NoticeDto noticeDto, RedirectAttributes rttr, Model model) {

        try {
            // 공지사항 등록 실패 시
            if (noticeService.write(noticeDto) != 1) {
                throw new Exception("Write failed.");
            }

            // 공지사항 등록 성공 시
            rttr.addFlashAttribute("msg", "Write OK");
            return "redirect:/notice/noticeList";
        } catch (Exception e) {
            e.printStackTrace();
            // @@@@@@@@@@@@ 코드 작성 해야함 @@@@@@@@@@@@
        }
        return "redirect:/notice/noticeList";
    }

    // 공지사항 수정
    @PostMapping("/modify")
    public String modify(NoticeDto noticeDto, RedirectAttributes rttr, Model model) {
        try {
            // 수정 실패 시
            if (noticeService.modify(noticeDto) != 1) {
                throw new Exception("Modify Failed.");
            }

            // 수정 성공 시
            rttr.addFlashAttribute("msg", "MOD_OK");
            return "redirect:/notice/noticeList";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("msg", "MOD_ERR");
            // @@@@@@@@@@ 아직 미완 @@@@@@@@@@@@@@@@
            return "";
        }
    }
}
