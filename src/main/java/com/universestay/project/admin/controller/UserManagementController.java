package com.universestay.project.admin.controller;

import com.universestay.project.admin.service.UserManagementService;
import com.universestay.project.common.PageHandler;
import com.universestay.project.common.SearchCondition;
import com.universestay.project.user.dto.UserDto;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

// TODO: 2023-11-28     filter or interceptor 구현
// TODO: 2023-11-28     css 태그에 직접 입력한거 다듬기

@Controller
@RequestMapping("/admin/user")
public class UserManagementController {

    @Autowired
    UserManagementService userManagementService;

    // 유저리스트 페이지 화면 출력
    @GetMapping("/list")
    public String userList(Model model, SearchCondition sc) {
        try {
            // Mapper의 쿼리문에 전달해 줄 offset과 pageSize를 map에 저장해서 mapper에 넘겨줌
            Map map = new HashMap();
            map.put("offset", sc.getOffset());
            map.put("pageSize", sc.getPageSize());
            List<UserDto> list = null;
            int count = 0;
            // 일반 페이지 리스트
            if (sc.getKeyword().equals("")) {
                list = userManagementService.getPage(map);
                // User 전체 카운트
                count = userManagementService.getCount();
            }
            // 검색결과 페이지 리스트
            else {
                list = userManagementService.getSearchResultPage(sc);
                // 검색된 User만 카운트
                count = userManagementService.getSearchResultCnt(sc);
            }
            // 뷰에 전달할 PageHandler 생성
            // 생성자에 count와 SearchCondition 입력해서 초기화
            // 이때 dopaging 실행되서 iv들 알맞게 초기화 됨
            PageHandler ph = new PageHandler(count, sc);

            // Model - list, ph 셋팅해서 뷰에 넘겨준다
            model.addAttribute("list", list);
            model.addAttribute("ph", ph);

        } catch (Exception e) {

            e.printStackTrace();
        }
        // 예외가 발생했을 때에는 model이 없는 빈 페이지가 출력
        // 예외 발생 안했을 시에는 정상적인 페이지 출력
        return "/admin/userList";
    }

    // 유저리스트에서 페이지에서 아이디를 클릭했을 때 해당 유저의 상세 정보를 출력
    @GetMapping("/info")
    public String userInfo(SearchCondition sc, String user_id, Model model) {
        // 매개변수로 user_id 받아옴
        // mapper에 user_id 넘겨주고 userDto 받아오기
        try {
            UserDto dto = userManagementService.read(user_id);
            
            model.addAttribute("dto", dto);
            model.addAttribute("sc", sc);
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 예외가 발생했을 때에는 model이 없는 빈 페이지가 출력
        // 예외 발생 안했을 시에는 정상적인 페이지 출력
        return "/admin/userInfo";
    }

    @GetMapping("/update")
    public String updateUser(String user_id, String status_id, SearchCondition sc, Model model) {
        try {
            UserDto dto = userManagementService.read(user_id);
            dto.setStatus_id(status_id);
            userManagementService.modify(dto);
            model.addAttribute("dto", dto);
            model.addAttribute("sc", sc);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/admin/userInfo";
    }
}
