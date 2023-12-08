package com.universestay.project.admin.controller;

import com.universestay.project.admin.dto.CouponDto;
import com.universestay.project.admin.service.CouponService;
import com.universestay.project.admin.service.EventService;
import com.universestay.project.common.PageHandler;
import com.universestay.project.common.SearchCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin/coupon")
public class CouponController {

    // 의존성 주입
    @Autowired
    CouponService couponService;

    // uuid 가져오는 service 기능 사용을 위해 끌어옴
    @Autowired
    EventService eventService;

    // 쿠폰 페이지(목록) 조회
    @GetMapping
    public String list(SearchCondition sc, Model m) {
        try {
            System.out.println(sc);
            // 페이징 처리
            int totalCnt = couponService.getSearchResultCnt(sc);
            m.addAttribute("totalCnt", totalCnt);
            // 한 페이지에 보여줄 게시물 수
            sc.setPageSize(5);
            PageHandler pageHandler = new PageHandler(totalCnt, sc);
            // 검색된 게시물 페이징 처리
            List<CouponDto> list = couponService.getSearchResultPage(sc);
            m.addAttribute("list", list);
            m.addAttribute("ph", pageHandler);

        } catch (Exception e) {
            e.printStackTrace();
            return "admin/coupon";
        }
        return "admin/coupon";
    }


    @PostMapping("/input")
    // 쿠폰 생성
    public String input(CouponDto couponDto, RedirectAttributes rattr, HttpSession session) {
        // 쿠폰 생성 성공 메세지 선언
        String msg = "IPT_OK";
        // 세션에서 현재 로그인된 이메일 가져오기
        String admin = (String) session.getAttribute("admin_email");
        try {
            // 현재 로그인된 이메일로 uuid 가져오기
            String uuid = eventService.getAdminUuid(admin);
            // uuid로 필수값 선언
            couponDto.setCreated_id(uuid);
            couponDto.setUpdated_id(uuid);
            // 쿠폰 생성
            couponService.insert(couponDto);

            // 예외처리
        } catch (Exception e) {
            // 예외 찍어주기
            e.printStackTrace();
            // 쿠폰 생성 실패시 메세지
            msg = "IPT_ERR";
            // 쿠폰 생성 실패 메세지 전송하기
            rattr.addFlashAttribute("msg", msg);
            // 쿠폰 생성 실패 시 쿠폰페이지로 이동
            return "redirect:/admin/coupon";
        }
        // 쿠폰 생성 성공 메세지 전송하기
        rattr.addFlashAttribute("msg", msg);
        // 쿠폰 생성 성공 시 쿠폰페이지로 이동
        return "redirect:/admin/coupon";
    }


    // 쿠폰 수정 (구현예정, 단일 쿠폰 수정으로 할 지 다중 쿠폰 수정으로 할 지 아직 못 정했습니다.)
    @PostMapping("/update")
    public String update() {
        return "admin/coupon";
    }

    // 다중 쿠폰 삭제
    @PostMapping("/delete")
    public String delete(@RequestParam List<Integer> coupon_id, RedirectAttributes rattr) {
        // 쿠폰 삭제 성공 시 메세지 선언
        String msg = "DEL_OK";
        try {
            // 체크박스로 체크된 항목들의 pk 배열 값을 가져와 for문으로 돌리기
            for (int i = 0; i < coupon_id.size(); i++) {
                // 배열 위치의 pk 값 꺼내기
                Integer id = Integer.valueOf(coupon_id.get(i));
                // 각 pk마다 삭제 실행
                couponService.delete(id);
            }

            // 예외처리
        } catch (Exception e) {
            // 삭제 실패 시 메세지
            msg = "DEL_ERR";
            // 에러 찍어주기
            e.printStackTrace();
            // 삭제 실패 메세지 전송
            rattr.addFlashAttribute("msg", msg);
            // 삭제 실패 시 쿠폰 페이지에 머무르기
            return "redirect:/admin/coupon";
        }
        // 삭제 성공 메세지 전송
        rattr.addFlashAttribute("msg", msg);
        // 삭제 성공 시 쿠폰 페이지에 머무르기
        return "redirect:/admin/coupon";
    }

    // 다중 쿠폰 발급
    @PostMapping("/issue")
    public String issue(@RequestParam List<Integer> coupon_id, RedirectAttributes rattr) {
        // 발급 성공 시 메세지 선언
        String msg = "ISU_OK";
        // 체크박스로 체크된 항목들의 pk 배열 값을 가져와 for문으로 돌리기
        try {
            for (int i = 0; i < coupon_id.size(); i++) {
                // 배열 위치의 pk 값 꺼내기
                Integer id = Integer.valueOf(coupon_id.get(i));
                // pk 값마다 coupon_is_activated 를 모두 'Y'로 변경
                couponService.issue(id);
            }

            //예외처리
        } catch (Exception e) {
            // 발급 실패 시 메세지
            msg = "ISU_ERR";
            // 에러 찍어주기
            e.printStackTrace();
            // 발급 실패 메세지 전송
            rattr.addFlashAttribute("msg", msg);
            // 발급 실패 시 페이지에 머무르기
            return "redirect:/admin/coupon";
        }
        // 발급 성공 메세지 전송
        rattr.addFlashAttribute("msg", msg);
        // 발급 성공 시 쿠폰 페이지에 머무르기
        return "redirect:/admin/coupon";
    }

    // 다중 쿠폰 발급 중지
    @PostMapping("/stopIssue")
    public String stopIssue(@RequestParam List<Integer> coupon_id, RedirectAttributes rattr) {
        // 발급 중지 성공 시 메세지 선언
        String msg = "STISU_OK";
        try {
            // 체크박스로 체크된 항목들의 pk 배열 값을 가져와 for문으로 돌리기
            for (int i = 0; i < coupon_id.size(); i++) {
                // 배열 마다 pk 값 꺼내기
                Integer id = Integer.valueOf(coupon_id.get(i));
                // pk 값마다 coupon_is_activated 를 모두 'N'으로 변경
                couponService.stopIssue(id);
            }

            //예외처리
        } catch (Exception e) {
            // 발급중지 실패 시 메세지
            msg = "STISU_ERR";
            // 에러 찍어주기
            e.printStackTrace();
            // 발급 실패 메세지 전송
            rattr.addFlashAttribute("msg", msg);
            // 발급 실패 시 페이지 머무르기
            return "redirect:/admin/coupon";
        }
        // 발급 성공 메세지 전송
        rattr.addFlashAttribute("msg", msg);
        // 발급 성공 시 쿠폰 페이지에 머무르기
        return "redirect:/admin/coupon";
    }
}
