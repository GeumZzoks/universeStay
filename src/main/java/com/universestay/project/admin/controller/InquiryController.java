package com.universestay.project.admin.controller;

import com.universestay.project.admin.dto.InquiryDto;
import com.universestay.project.admin.dto.ReplyDto;
import com.universestay.project.admin.service.InquiryService;
import com.universestay.project.common.PageHandler;
import com.universestay.project.common.SearchCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/admin/inquiry")
public class InquiryController {

    @Autowired
    InquiryService inquiryService;

    // 문의사항 목록 출력
    @GetMapping("/list")
    public String list(Model model, SearchCondition sc) {
        try {
            System.out.println("GET ---- /list");
            System.out.println("========================");
            // SearchCondition의 조건에 맞는 문의사항 카운트
            int count = inquiryService.getSearchResultCount(sc);
            // 매개변수로 받아온 SearchCondition으로 PageHandler 생성
            PageHandler ph = new PageHandler(count, sc);
            List<InquiryDto> list = inquiryService.getPage(sc);
            model.addAttribute("list", list);
            model.addAttribute("ph", ph);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "admin/inquiryList";
    }

    @GetMapping("/details")
    public String inquiry(Model model, SearchCondition sc, int inquiry_id) {
        try {
            System.out.println("GET ---- /details");
            System.out.println("========================");
            InquiryDto dto = inquiryService.readInquiry(inquiry_id);
            List<ReplyDto> list = inquiryService.readReplys(inquiry_id);
            System.out.println(dto.getInquiry_id());
            model.addAttribute("dto", dto);
            model.addAttribute("list", list);
            model.addAttribute("sc", sc);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "admin/inquiry";
    }

    @PostMapping("/writereply")
    public String writeReply(RedirectAttributes rattr, SearchCondition sc, Integer inquiry_id, String reply_writer_id, String reply_ctt) {
        System.out.println("POST ---- /writereply");
        System.out.println("========================");
        String url = sc.getQueryString() + "&inquiry_id=" + inquiry_id;
        ReplyDto dto = new ReplyDto();
        dto.setInquiry_id(inquiry_id);
        dto.setReply_writer_id(reply_writer_id);
        dto.setReply_ctt(reply_ctt);
        dto.setCreated_id(reply_writer_id);
//        rattr.addFlashAttribute("sc", sc);
//        rattr.addAttribute("sc", sc.getQueryString());
        try {
            inquiryService.writeReply(dto);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect: /admin/inquiry/details" + url;
    }

    @PostMapping("/deletereply")
    public String deleteReply(SearchCondition sc, int inquiry_id, int reply_id, RedirectAttributes rattr){
        try{
            System.out.println("POST ---- /deletereply");
            System.out.println("========================");
            int result = inquiryService.removeReply(reply_id);
            if(result == 1) System.out.println("삭제 성공");
            else System.out.println("삭제 실패");
            rattr.addFlashAttribute("msg", "성공!");
        } catch (Exception e){
            rattr.addFlashAttribute("msg", "실패!");
            e.printStackTrace();
        }
        return "redirect: /admin/inquiry/details" + sc.getQueryString() + "&inquiry_id=" + inquiry_id;
    }

    @PostMapping("/updatereply")
    public String updateReply(SearchCondition sc, String reply_ctt, String updated_id, int inquiry_id, int reply_id, RedirectAttributes rattr){
        try {
            ReplyDto dto = inquiryService.readReply(reply_id);
            dto.setReply_ctt(reply_ctt);
            dto.setUpdated_id(updated_id);
            int result = inquiryService.modifyReply(dto);
            if(result == 1) System.out.println("업데이트 성공");
            else System.out.println("업데이트 실패");
            rattr.addFlashAttribute("msg", "성공!");
        } catch (Exception e) {
            rattr.addFlashAttribute("msg", "실패!");
            e.printStackTrace();
        }
        return "redirect: /admin/inquiry/details" + sc.getQueryString() + "&inquiry_id=" + inquiry_id;
    }
}
